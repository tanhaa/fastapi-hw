# Recorded with the doitlive recorder
#doitlive shell: /bin/zsh
#doitlive prompt: smiley
#doitlive speed: 2
#doitlive commentecho: false

# helm repo add elastic https://helm.elastic.co
# helm install elasticsearch elastic/elasticsearch

kubectl create namespace kube-logging
kubectl create -f efk/elasticsearch_svc.yaml
kubectl create -f efk/elasticsearch_statefulset.yaml
kubectl port-forward es-cluster-0 9200:9200 --namespace=kube-logging
kubectl create -f efk/fluentd.yaml
