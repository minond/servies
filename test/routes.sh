source ./servies

set_up() {
    save_route ONE "/one" "one"
    save_route TWO "/two/:name/:age" "two"

    get "/get/:name/:age" echo get
    post "/post/:name/:age" echo post
    put "/put/:name/:age" echo put
    patch "/patch/:name/:age" echo patch
}

tear_down() {
    ROUTE_URLS=()
    ROUTE_METHODS=()
    ROUTE_HANDLERS=()
}

set_up

expect "patterns are saved in order" \
    $(test "${ROUTE_PATTERN[1]}" = "^/\?two/\?.\+/\?.\+\$")

expect "extractors are saved in order" \
    $(test "${ROUTE_EXTRACTOR[1]}" = "s/\/{0,}two\/{0,}(\w+)\/{0,}(\w+)/ \1 \2/")

expect "urls are saved in order" \
    $(test "${ROUTE_URLS[1]}" = "/two/:name/:age")

expect "methods are saved in order" \
    $(test "${ROUTE_METHODS[1]}" = "TWO")

expect "handlers are saved in order" \
    $(test "${ROUTE_HANDLERS[1]}" = "two")

expect "groups are saved in order" \
    $(test "${ROUTE_GROUPS[1]}" = "name age")


expect "get helper saves correct pattern" \
    $(test "${ROUTE_PATTERN[2]}" = "^/\?get/\?.\+/\?.\+\$")

expect "get helper saves correct extractors" \
    $(test "${ROUTE_EXTRACTOR[2]}" = "s/\/{0,}get\/{0,}(\w+)\/{0,}(\w+)/ \1 \2/")

expect "get helper saves correct url" \
    $(test "${ROUTE_URLS[2]}" = "/get/:name/:age")

expect "get helper saves correct method" \
    $(test "${ROUTE_METHODS[2]}" = "GET")

expect "get helper saves correct handler" \
    $(test "${ROUTE_HANDLERS[2]}" = "echo get")


expect "post helper saves correct pattern" \
    $(test "${ROUTE_PATTERN[3]}" = "^/\?post/\?.\+/\?.\+\$")

expect "post helper saves correct extractors" \
    $(test "${ROUTE_EXTRACTOR[3]}" = "s/\/{0,}post\/{0,}(\w+)\/{0,}(\w+)/ \1 \2/")

expect "post helper saves correct url" \
    $(test "${ROUTE_URLS[3]}" = "/post/:name/:age")

expect "post helper saves correct method" \
    $(test "${ROUTE_METHODS[3]}" = "POST")

expect "post helper saves correct handler" \
    $(test "${ROUTE_HANDLERS[3]}" = "echo post")


expect "put helper saves correct pattern" \
    $(test "${ROUTE_PATTERN[4]}" = "^/\?put/\?.\+/\?.\+\$")

expect "put helper saves correct extractors" \
    $(test "${ROUTE_EXTRACTOR[4]}" = "s/\/{0,}put\/{0,}(\w+)\/{0,}(\w+)/ \1 \2/")

expect "put helper saves correct url" \
    $(test "${ROUTE_URLS[4]}" = "/put/:name/:age")

expect "put helper saves correct method" \
    $(test "${ROUTE_METHODS[4]}" = "PUT")

expect "put helper saves correct handler" \
    $(test "${ROUTE_HANDLERS[4]}" = "echo put")


expect "patch helper saves correct pattern" \
    $(test "${ROUTE_PATTERN[5]}" = "^/\?patch/\?.\+/\?.\+\$")

expect "patch helper saves correct extractors" \
    $(test "${ROUTE_EXTRACTOR[5]}" = "s/\/{0,}patch\/{0,}(\w+)\/{0,}(\w+)/ \1 \2/")

expect "patch helper saves correct url" \
    $(test "${ROUTE_URLS[5]}" = "/patch/:name/:age")

expect "patch helper saves correct method" \
    $(test "${ROUTE_METHODS[5]}" = "PATCH")

expect "patch helper saves correct handler" \
    $(test "${ROUTE_HANDLERS[5]}" = "echo patch")
