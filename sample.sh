# declares a GET route that runs "ps aux" when you request "/ps"
get "/ps" ps aux

# this is a route with a "value" parameter that is extracted from the url
# if you want to use variables like this, make sure to declare your handlers
# using single quotes (or escape the dollar sign) so that the variable is
# evaluated during the routing
get "/hello/:value" echo '$value'

# you can define optional parameters by adding a question mark after the name
get "/hello/:name?" echo 'hello ${name:-friend}'

# you can declare routes of different http methods
get "/get" echo "get response"
post "/post" echo "post response"
put "/put" echo "put response"
patch "/patch" echo "patch response"

# multiple params in url
# get "/person/:name/age/:age/gender/:gender" echo 'hello $name\nfd'
get "/person/:name/age/:age/gender/:gender" echo $(cat <<-'VIEW'
name: $name
age: $age
gender: $gender
VIEW
)

# you can route requests to your own commands, of course
get "/netstat/:prog/prog" show_netstat --prog
get "/netstat/:port/port" show_netstat --port
get "/netstat/invalid" show_netstat --invalid-filter-type
show_netstat() {
    # headers!
    header "Content-Type" "text/plain"

    case "$1" in
        --prog)
            netstat -pan | grep "$prog"
            ;;

        --port)
            netstat -pan | grep ":$port"
            ;;

        *)
            # send any status!!
            status 422 "Unprocessable Entity"
            echo "invalid type: $1"
    esac
}
