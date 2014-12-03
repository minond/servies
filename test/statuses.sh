source ./servies

set_up() {
    SERVIES_FILE_STATUSES="$(mktemp)"
}

tear_down() {
    [ -f "$SERVIES_FILE_STATUSES" ] && rm "$SERVIES_FILE_STATUSES"
}

set_up

expect "known statuses only require a code" \
    $(status 200; test "$(cat "$SERVIES_FILE_STATUSES")" = "HTTP/1.1 200 OK")

expect "any status code can be used" \
    $(status 204 "No Content"; test "$(cat "$SERVIES_FILE_STATUSES")" = "HTTP/1.1 204 No Content")
