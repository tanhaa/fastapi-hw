# Recorded with the doitlive recorder
#doitlive shell: /bin/zsh
#doitlive prompt: smiley
#doitlive speed: 2
#doitlive commentecho: false

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
# cleanup
kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl delete ns argocd
