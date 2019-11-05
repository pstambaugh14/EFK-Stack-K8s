#!/bin/bash
echo "Port Fowarding to http://localhost:5601"
podvar=`kubectl get pods -n kube-logging | awk '{ print $1 }' | grep -i kibana`
kubectl port-forward $podvar 5601:5601 --namespace=kube-logging
