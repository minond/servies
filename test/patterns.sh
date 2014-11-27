source ./servies

expect "slashes to be optional" \
    $(test "$(url_pattern "/welcome/")" = "/\?welcome/\?")

expect "groups are replaced with regular expressions" \
    $(test "$(url_pattern "/welcome/:name")" = "/\?welcome/\?\w\+")

expect "optional groups are handles correctly" \
    $(test "$(url_pattern "/welcome/:name?")" = "/\?welcome/\?\w\+\?")

expect "single group to be found" \
    $(test "$(url_groups "/welcome/:name")" = "name")

expect "multiple groups to be found" \
    $(test "$(url_groups "/welcome/:name/:age")" = "name age")

expect "optional groups do not include identifier" \
    $(test "$(url_groups "/welcome/:name/:age?")" = "name age")
