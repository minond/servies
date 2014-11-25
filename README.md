[![Build Status](https://travis-ci.org/minond/servies.svg?branch=master)](https://travis-ci.org/minond/servies)

`servies` is a bash micro-framework that uses netcat to listen to and respond
to HTTP requests.

#### example

your request handlers can be one-liners:

```bash
get "/" echo "welcome"
```

you can, of course, define your own commands/functions and use those as well.
I won't include an example of that because it's not "dead sexy" (yeah, that's
for you)

anything sent to stdout by your handler function or command will be sent back
as the response body. there's only a `status` and a `header` command that you
can use to customize the status code and to add any header you want.

ok, so let's say you saved that to a file named `app`. to start that server,
just run `server app`, and that will make netcat listen to requests made to
your local host on port `8080` and route your requests.

you can also set a `PORT` and/or a `HOST` variable to bind netcat to something
other than the default `0.0.0.0:8080`.

checkout the `sample.sh` file for an example.

#### installing

just clone the repo and run `make install` (you may need to sudo that)

#### tests

start the sample application, by running `./servies sample.sh`, then run `make
test` to run automated tests

#### important

don't ever use this. it has issues with the responses and it probably can't
handle a whole lot of usage. this is just a toy project.

#### also important

if you are going to use this, then I do ask that you only browse what ever you
build using [Links](http://links.twibright.com/) (jk)
