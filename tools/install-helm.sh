
echo "Installing Helm..."
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

echo "Installing 'stable' chart repository..."
helm repo add stable https://charts.helm.sh/stable

echo "Helm client is ready."
