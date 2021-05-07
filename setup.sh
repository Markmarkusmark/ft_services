echo "clear last cluster"
minikube stop
minikube delete

echo "create cluster"
minikube start --vm-driver=virtualbox --memory 4000

echo "move docker inside the cluster"
eval $(minikube docker-env)

echo "create pods"
echo "docker builds"
docker build -t nginx-image srcs/nginx/
docker build -t mysql-image srcs/mysql/
docker build -t phpmyadmin-image srcs/phpmyadmin/
docker build -t wordpress-image srcs/wordpress/
docker build -t ftps-image srcs/ftps/
docker build -t influxdb-image srcs/influxdb/
docker build -t grafana-image srcs/grafana/

echo "apply yaml files"
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/ftps/ftps.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml
kubectl apply -f srcs/grafana/grafana.yaml

echo "enable load balancer"
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2
minikube addons enable metallb

echo "enable dashboard"
minikube addons enable dashboard

echo "apply configmap"
kubectl apply -f srcs/configmap.yaml

echo "launch"
minikube dashboard