#!/bin/bash
kubectl delete pods es-cluster-1 es-cluster-0 es-cluster-2 -n kube-logging
kubectl delete -n kube-logging statefulset es-cluster
kubectl delete persistentvolume log-pv-volume
kubectl delete -n kube-logging persistentvolumeclaim log-pv-claim
