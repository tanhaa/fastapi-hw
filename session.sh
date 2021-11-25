# Recorded with the doitlive recorder
#doitlive shell: /bin/zsh
#doitlive prompt: smiley
#doitlive speed: 2
#doitlive commentecho: false

# our app isn't running
http http://localhost:8080

# Let's make sure our cluster is good and running
kubectl cluster-info
# Let's install argocd
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
# give it a second and check if it's running
kubectl get pods -n argocd
# by default the service is not exposed with an external IP
kubectl get svc -n argocd
# need to access the server, so we wil just quickly patch our argocd service type to loadbalancer
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

# check again:
kubectl get svc -n argocd

# let's get the password:
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo

# already installed the argocd cli

# create a new app
argocd app create fastapi-hw --repo https://github.com/tanhaa/fastapi-hw --dest-namespace fastapi-hw --dest-server https://kubernetes.default.svc --path charts/fastapi-hw --project default --revision main
argocd app get fastapi-hw
kubectl create namespace fastapi-hw
argocd app sync fastapi-hw
argocd app get fastapi-hw

http http://localhost:8080

yes | argocd app delete fastapi-hw
kubectl delete ns fastapi-hw
kubectl get namespaces

# create with auto sync
argocd app create fastapi-hw --repo https://github.com/tanhaa/fastapi-hw --dest-namespace fastapi-hw --dest-server https://kubernetes.default.svc --path charts/fastapi-hw --project default --revision main --sync-policy auto --sync-option CreateNamespace=true

# check app is running
http http://localhost:8080/items/5 q==somequery

# push some changes
git add app/main.py
git commit -m "added new route"
git push origin add_argo

argocd app sync fastapi-hw

http http://localhost:8080/amit

# cleanup
#yes | argocd app delete fastapi-hw
#kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
#kubectl delete ns argocd
