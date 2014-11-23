`servies` is a bash micro-framework that uses netcat to listen to and respond
to HTTP requests.

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

to start your application, just run `servies [FILE]`. you can also set a `PORT`
and/or a `HOST` variable to bind netcat to something other than the default
`0.0.0.0:8080`.

also, don't ever use this. it has issues with the responses and it probably
can't handle a whole lot of usage. but if you do want to use it, just clone
the repo and run `make install` (you may need to sudo that)

##### tests

run `make test` to run automated tests
