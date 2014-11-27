[![Build Status](https://travis-ci.org/minond/servies.svg?branch=master)](https://travis-ci.org/minond/servies)

`servies` is a bash micro-framework that uses netcat to listen for and respond
to HTTP requests.

#### example

route definitions are done using this method: `[http method] [url pattern]
[command]`. your request handlers can be one-liners:

```bash
get "/hi/:name" echo 'hi $name, how are you??'
```

you can, of course, define your own commands/functions and use those as well.
I won't include an example of that because it's not "dead sexy" (yeah, that's
for you)

anything sent to stdout by your handler function or command will be sent back
as the response body, but there's also a `status` and a `header` command that
you can use to customize the status code and to add any header you want.
checkout the `sample.sh` file for an example.

#### routes

required (`:something`) and optional (`:something?`) route parameters are
supported. during the routing, servies will extract these values from the url
and declare them as variables you can use. if you want to use variables in
these, make sure to declare your handlers using single (or escape the dollar
sign) quotes so that the variables are evaluated during the routing

#### usage

let's say you saved your route definitions to a file named `app`. to start that
server, just run `servies app`, and that will make netcat listen to requests
made to your local host on port `8080` and route your requests. you can also
set a `PORT` and/or a `HOST` variable to bind netcat to something other than
the default `0.0.0.0:8080`.

#### installing

clone the repo and run `make install` (you may need to sudo that)

#### tests

start the sample application, by running `./servies sample.sh`, then run `make
test`

#### important

don't ever use this. it has issues with the responses, it probably can't handle
a whole lot of usage, and let's not even get started on the security issues
something like this has. I mean, you can do something like this `get "/:file"
cat \$file` and make most of your file system avialable. this is just a toy
project. just play around with it.

#### also important

if you are going to use this, then I do ask that you only browse what ever you
build using [Links](http://links.twibright.com/) (jk)

#### thanks

thank you to [this SO response](http://stackoverflow.com/a/24342101/247674)
that showed me how to redirect nc calls to a command
