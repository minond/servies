source ./servies

[ -z "$PORT" ] && PORT=8080
[ -z "$HOST" ] && HOST=0.0.0.0

expect "can make a get request and get expected response" \
    $(test "$(curl -X GET "$HOST:$PORT/get" -s)" = "get response")

expect "can make a post request and get expected response" \
    $(test "$(curl -X POST "$HOST:$PORT/post" -s)" = "post response")

expect "can make a patch request and get expected response" \
    $(test "$(curl -X PATCH "$HOST:$PORT/patch" -s)" = "patch response")

expect "can make a put request and get expected response" \
    $(test "$(curl -X PUT "$HOST:$PORT/put" -s)" = "put response")

expect "requests to invalid routes respond with a 404" \
    $(grep -q "404 Not Found" <<< $(curl -X GET "$HOST:$PORT/getsss" -si))

expect "required url parameters can be included in response" \
    $(test "$(curl -X GET "$HOST:$PORT/hello/marcos" -s)" = "hello marcos")

expect "optional url parameters can be included in response" \
    $(test "$(curl -X GET "$HOST:$PORT/hello" -s)" = "hello friend")

expect "matches multiple url parameters" \
    $(test "$(curl -X GET "$HOST:$PORT/person/marcos/age/25/gender/male" -s)" = \
        "name: marcos age: 25 gender: male")
