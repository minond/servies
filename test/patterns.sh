source ./servies

expect "slashes to be optional in extractors" \
    $(test "$(url_extractor "/welcome/")" = "s/\/{0,}welcome\/{0,}//")

expect "groups are replaced with regular expressions in extractors" \
    $(test "$(url_extractor "/welcome/:name")" = "s/\/{0,}welcome\/{0,}(\w+)/ \1/")

expect "optional groups are handles correctly in extractors" \
    $(test "$(url_extractor "/welcome/:name?")" = "s/\/{0,}welcome\/{0,}(\w+){0,}/ \1/")

expect "slashes to be optional in patterns" \
    $(test "$(url_pattern "/welcome/")" = "^/\?welcome/\?\$")

expect "groups are replaced with regular expressions in patterns" \
    $(test "$(url_pattern "/welcome/:name")" = "^/\?welcome/\?\w\+\$")

expect "optional groups are handles correctly in patterns" \
    $(test "$(url_pattern "/welcome/:name?")" = "^/\?welcome/\?\w\+\?\$")

expect "single group to be found" \
    $(test "$(url_groups "/welcome/:name")" = "name")

expect "multiple groups to be found" \
    $(test "$(url_groups "/welcome/:name/:age")" = "name age")

expect "optional groups do not include identifier" \
    $(test "$(url_groups "/welcome/:name/:age?")" = "name age")
