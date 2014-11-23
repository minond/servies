source ./servies

expect "known statuses only require a code" \
    $(test "$(status 200)" = "HTTP/1.1 200 OK")

expect "any status code can be used" \
    $(test "$(status 204 "No Content")" = "HTTP/1.1 204 No Content")
