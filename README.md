`servies` is a bash micro-framework that uses netcat to listen to and respond
to HTTP requests.

##### example

your request handlers can be one-liners:

```bash
get "/" echo "welcome"
```

or functions:

```bash
get "/ps/python" show_python_processes
show_python_processes() {
    ps aux | grep python
}
```

let's say you saved that to a file named `app`. to start that server, just run
`server app`, and that will make netcat listen to requests made to your local
host on port `8080` and route your requests.

you can also set a `PORT` and/or a `HOST` variable to bind netcat to something
other than the default `0.0.0.0:8080`.

##### installing

just clone the repo and run `make install` (you may need to sudo that)

##### tests

run `make test` to run automated tests

##### important

also, don't ever use this. it has issues with the responses and it probably
can't handle a whole lot of usage. this is just a toy project.
