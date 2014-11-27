# declares a GET route that runs "ps aux" when you request "/ps"
get "/ps" ps aux

# this is a route with a "name" parameter that is extracted from the url
# if you want to use variables like this, make sure to declare your handlers
# using single quotes so that the variable is evaluated during the routing
get "/hello/:name" echo 'hello $name'

# you can define optional parameters by adding a question mark after the name
get "/hello/:name?" echo 'hello friend'

# you can declare routes of different http methods
get "/get" echo "get response"
post "/post" echo "post response"
put "/put" echo "put response"
patch "/patch" echo "patch response"
