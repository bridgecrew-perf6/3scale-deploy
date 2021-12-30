#!/bin/bash
NAMESPACE=nfs-provisioner
oc apply -f nfs-provisioner.yaml
oc project $NAMESPACE
oc apply -f rbac.yaml
oc adm policy add-role-to-user use-scc-hostmount-anyuid system:serviceaccount:$NAMESPACE:nfs-client-provisioner
oc adm policy add-scc-to-user hostmount-anyuid -z nfs-client-provisioner
oc apply -f deployment.yaml
