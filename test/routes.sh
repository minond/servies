source ./servies

set_up() {
    save_route ONE "/one" "one"
    save_route TWO "/two" "two"

    get "/get" echo get
    post "/post" echo post
    put "/put" echo put
    patch "/patch" echo patch
}

tear_down() {
    ROUTE_URLS=()
    ROUTE_METHODS=()
    ROUTE_HANDLERS=()
}

set_up

expect "urls are saved in order" $(test "${ROUTE_URLS[1]}" = "/two")
expect "methods are saved in order" $(test "${ROUTE_METHODS[1]}" = "TWO")
expect "handlers are saved in order" $(test "${ROUTE_HANDLERS[1]}" = "two")

expect "get helper saves correct url" $(test "${ROUTE_URLS[2]}" = "/get")
expect "get helper saves correct method" $(test "${ROUTE_METHODS[2]}" = "GET")
expect "get helper saves correct handler" $(test "${ROUTE_HANDLERS[2]}" = "echo get")

expect "post helper saves correct url" $(test "${ROUTE_URLS[3]}" = "/post")
expect "post helper saves correct method" $(test "${ROUTE_METHODS[3]}" = "POST")
expect "post helper saves correct handler" $(test "${ROUTE_HANDLERS[3]}" = "echo post")

expect "put helper saves correct url" $(test "${ROUTE_URLS[4]}" = "/put")
expect "put helper saves correct method" $(test "${ROUTE_METHODS[4]}" = "PUT")
expect "put helper saves correct handler" $(test "${ROUTE_HANDLERS[4]}" = "echo put")

expect "patch helper saves correct url" $(test "${ROUTE_URLS[5]}" = "/patch")
expect "patch helper saves correct method" $(test "${ROUTE_METHODS[5]}" = "PATCH")
expect "patch helper saves correct handler" $(test "${ROUTE_HANDLERS[5]}" = "echo patch")
