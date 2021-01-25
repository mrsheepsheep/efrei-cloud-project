# Pré-requis

## Installation de kubectl

`./tools/install-kubectl.sh`

## Installation de Helm sur la machine locale

`./tools/install-helm.sh`

## Installation du plugin ansible kubernetes

* `ansible-galaxy collection install community.kubernetes`
* `pip3 install openshift`

# Installation

## Installation basique du cluster

Configurer l'inventaire dans le fichier `hosts`.

Il faut aussi penser à changer la range d'IP à assigner via MetalLB dans le fichier `install-ingress.yml`

`ansible-playbook -K -i hosts setup/install.yml`

## Installation de Rancher

Configurer au préalable le nom de domaine de Rancher dans `rancher/config.yml`

`ansible-playbook -K -i hosts rancher/install.yml`
 
## Installation de Harbor

Note: la persistance n'a pas encore été configurée...

Difficultés avec les PVC, StorageController, etc.

`ansible-playbook -K -i hosts harbor/install.yml`

## Installation de l'application

Wordpress - Non réussi à cause de la configuration des PVC

`ansible-playbook -K -i hosts app/install.yml`

nginx de test pour valider le fonctionnement du ingress controller et de la NAT externe

`ansible-playbook -K -i hosts app/test.yml`

# Installation de Falco et Falco Sidekick

`ansible-playbook -K -i hosts falco/install.yml`

Il est possible de configurer un webhook pour falco-sidekick dans le fichier `falco/install.yml`

Les alertes seront remontées sur le webhook choisi.
