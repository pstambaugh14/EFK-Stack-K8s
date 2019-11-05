#!/bin/bash

#This script is used for the automatic deployment of the base environment
#necessary for the RELK-K8S stack

#Create the RELK namespace.
kubectl apply -f kube-logging.yaml
#List all namespaces to validate.
kubectl get namespaces
#Create the headless service for ES
kubectl create -f elasticsearch_svc.yaml
#Validate that the service was created.
kubectl get services --namespace=kube-logging
#Create PersistentVolume
kubectl apply -f elasticsearch_Volume.yaml
#Create PersistentVolumeClaim
kubectl apply -f elasticsearch_PVC.yaml
#Create deployment for StatefulSet, containers, environment vars, initContainers, and PVC's
kubectl create -f elasticsearch_statefulset.yaml
#Validate Rollout of statefulset cluster
kubectl rollout status sts/es-cluster --namespace=kube-logging
