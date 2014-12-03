source ./servies

set_up() {
    SERVIES_FILE_HEADERS="$(mktemp)"
}

tear_down() {
    [ -f "$SERVIES_FILE_HEADERS" ] && rm "$SERVIES_FILE_HEADERS"
}

set_up

expect "headers to be colon separated" \
    $(header "Content-Type" "text/plain"; test "$(cat "$SERVIES_FILE_HEADERS")" = "Content-Type: text/plain")

expect "values can be optional" \
    $(header "Content-Type"; test "$(cat "$SERVIES_FILE_HEADERS")" = "Content-Type: ")
