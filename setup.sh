echo "clear last cluster"
minikube stop
minikube delete

echo "create cluster"
minikube start --vm-driver=virtualbox

echo "move docker inside the cluster"
eval $(minikube docker-env)

echo "create pods"
echo "docker builds"
docker build -t nginx-image srcs/nginx/
docker build -t mysql-image srcs/mysql/
docker build -t phpmyadmin-image srcs/phpmyadmin/
docker build -t wordpress-image srcs/wordpress/

echo "apply yaml files"
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml

echo "enable load balancer"
minikube addons enable metallb

echo "enable dashboard"
minikube addons enable dashboard

echo "apply configmap"
kubectl apply -f srcs/configmap.yaml

echo "launch"
kubectl get pods
minikube dashboard
