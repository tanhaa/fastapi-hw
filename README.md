Fast API Hello world created using: 
https://fastapi.tiangolo.com/deployment/docker/

`docker build -t fastapi-hw .`
`docker run -d --name fastapi-hw-container -p 8080:8080 fastapi-hw`
# tail logs: 
`docker logs -f fastapi-hw-container`

**Test:**

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

===================================

**Adding helm**
```
> mkdir charts
> cd charts
> helm create fastapi-hw

```
The above will create a directory named charts with an initial chart.  
Edit values.yaml file accordingly and also deployment.yaml file to the right port

```
> helm lint

# from root repo folder
> helm upgrade --install fastapi-hw --dry-run --debug ./charts/fastapi-hw
# if all is good
> helm upgrade --install fastapi-hw ./charts/fastapi-hw
# check if all is well
> helm ls
> kubectl get pods
> kubectl get service fastapi-hw
```