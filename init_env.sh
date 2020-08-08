#!/bin/bash

#This script is used for the automatic deployment of the base environment
#necessary for the RELK-K8S stack

#Create the EFK namespace.
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
#Create Fluentd Deployment
kubectl create -f fluentd.yaml
#Validate Rollout of Fluentd Deployment
kubectl rollout status daemonset/fluentd --namespace=kube-logging
#Deploy Kibana Dashboard
kubectl create -f kibana.yaml
#Validate Rollout of Kibana Dashboard
kubectl rollout status deployment/kibana --namespace=kube-logging
#Display if Successfully Completed All Tasks
echo "Successfully Deployed EFK Kubernetes Stack!"
