Fast API Hello world created using: 
https://fastapi.tiangolo.com/deployment/docker/

`docker build -t fastapi-hw .`
`docker run -d --name fastapi-hw-container -p 8080:8080 fastapi-hw`

**Test: **

```
# using httpie

❯ http get localhost
HTTP/1.1 200 OK
content-length: 17
content-type: application/json
date: Thu, 18 Nov 2021 17:18:54 GMT
server: uvicorn

{
    "Hello": "World"
}

❯ http http://localhost/items/5 q==somequery
HTTP/1.1 200 OK
content-length: 29
content-type: application/json
date: Thu, 18 Nov 2021 17:23:26 GMT
server: uvicorn

{
    "item_id": 5,
    "q": "somequery"
}


# =================
# using curl
# ================
❯ curl http://localhost
{"Hello":"World"}

# using browser
http://127.0.0.1/items/5?q=somequery

# Response should be: 

{"item_id": 5, "q": "somequery"}
```

To access swagger docs: 
http://127.0.0.1/docs
