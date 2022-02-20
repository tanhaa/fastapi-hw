kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/release-3.7/deploy/gatekeeper.yaml
kubectl delete -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/release-3.5/deploy/gatekeeper.yaml


kubectl get k8srequiredlabels.constraints.gatekeeper.sh -o yaml


kubectl delete -f gatekeeper.sh/policies/k8srequiredlabels/constraint.yaml



https://github.com/sighupio/gatekeeper-policy-manager
https://github.com/sebradloff/k8s-gatekeeper-policies-example/tree/main/policies
https://itnext.io/running-and-writing-gatekeeper-policies-in-kubernetes-part-2-1c49c1c683b2
