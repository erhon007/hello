kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.3.0/deploy/static/provider/cloud/deploy.yaml

kubectl get pods --namespace=ingress-nginx
kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=120s

$ cat <<EOF > nginx_deploy.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  generation: 1
  labels:
    app: test
  name: test
  namespace: default
spec:
  replicas: 1
  selector:
    matchLabels:
      app: test
  template:
    metadata:
      labels:
        app: test
    spec:
      containers:
      - image: httpd
        name: httpd
        ports:
        - containerPort: 80
          protocol: TCP
EOF
kubectl apply -f nginx_deploy.yaml

$ cat <<EOF > nginx_service.yaml
apiVersion: v1
kind: Service
metadata:
  labels:
    app: test
  name: test
  namespace: default
spec:
  ipFamilies:
  - IPv4
  ipFamilyPolicy: SingleStack
  ports:
  - nodePort: 30080
    port: 80
    protocol: TCP
    targetPort: 80
  selector:
    app: test
  sessionAffinity: None
  type: NodePort
status:
  loadBalancer: {}
EOF
kubectl apply -f nginx_service.yaml

kubectl create ingress demo-localhost --class=nginx \
  --rule="demo.localdev.me/*=demo:80"
kubectl get service ingress-nginx-controller --namespace=ingress-nginx