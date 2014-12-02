# declares a GET route that runs "ps aux" when you request "/ps"
get "/ps" ps aux

# this is a route with a "name" parameter that is extracted from the url
# if you want to use variables like this, make sure to declare your handlers
# using single quotes (or escape the dollar sign) so that the variable is
# evaluated during the routing
get "/hello/:name" echo 'hello $name'

# you can define optional parameters by adding a question mark after the name
get "/hello/:name?" echo 'hello friend'

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
    local type="$1"
    local body=
    local ok=true

    case "$type" in
        --prog)
            body=$(netstat -pan | grep "$prog")
            ;;

        --port)
            body=$(netstat -pan | grep ":$port")
            ;;

        *)
            ok=false
            body="invalid type: $type"
    esac

    # you can also send back any status code you'd like by using the `status`
    # command
    if [ $ok = false ]; then
        status 422 "Unprocessable Entity"
    else
        status 200 "OK"
    fi

    # after setting the status, it is possible to set headers:
    header "Content-Type" "text/plain"

    # you must make sure to include a blank like separating your headers and
    # the response body. this is only really needed if you are setting your
    # own status and headers
    echo
    echo "$body"
}
