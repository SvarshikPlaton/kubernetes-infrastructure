gcloud container clusters create provedcode --machine-type e2-small --disk-size=10 --num-nodes=3

kubectl apply -f provedcode-backend-secret.yaml
kubectl apply -f provedcode-backend-deployment.yaml
kubectl apply -f provedcode-frontend-deployment.yaml

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.1/deploy/static/provider/cloud/deploy.yaml

kubectl expose deployment provedcode-backend-deployment --port=80 --type=ClusterIP  
kubectl expose deployment provedcode-frontend-deployment --port=80 --type=ClusterIP

kubectl apply -f provedcode-ingress-hosts.yaml
kubectl describe ingress

# kubectl delete all --all
# kubectl delete ingress --all
# gcloud container clusters delete provedcode

