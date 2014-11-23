get "/" echo "welcome!!"
get "/ps" ps aux
get "/netstat" netstat -pan

get "/get" echo "get response"
post "/post" echo "post response"
put "/put" echo "put response"
patch "/patch" echo "patch response"
