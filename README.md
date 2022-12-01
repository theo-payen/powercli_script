
# Projet Virtu 4SRC2


## Authors

- PAYEN Théo 
- GEORGE Mukilventhan
- WAZANE Mohamed
- HABERMANN Maxime 

## PowerCLI

Installation de PowerCLI

`Install-Module -Name VMware.PowerCLI`
`Set-ExecutionPolicy Unrestricted`

## Script Cluster 

Notre script permet de :
-  Créer un cluster 
-  Créer un centre de donnée
-  Ajouter un host ESXi dans le cluster 

## Script  Create Template
Notre script permet de :
-  Choisir notre machine
- Stocker dans un datastore le template 

## Script  Create VM from template 

Notre script permet de :
- Créer un VM  depuis un template 

## Script  HA Cluster
Notre script permet de :
- Configuration ha dans un cluster

## Script Snapshot auto
Notre script permet de :
- Créer un snapshot d'une machine 
- Supprimer notre snapchot après un temps limité 

## Source

[doc1](https://vdc-repo.vmware.com/vmwb-repository/dcr-public/73d6de02-05fd-47cb-8f73-99d1b33aea17/850c6b63-eb82-4d9c-bfcf-79279b5e5637/doc/index.html#link67346e27d64a7cf6089900270a364d43d8e086b7;New-VM.html)
