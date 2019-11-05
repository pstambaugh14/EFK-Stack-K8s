# ELK-Stack-Kubernetes
Elasticsearch, Logstash and Kibana for Kubernetes
Elasticsearch, Fluentd and Kibana for Kubernetes

This stack is set to be utilized as a DaemonSet, allowing the collection of logs in ANY pod in the k8s cluster.

# How to Use
This was tested only on Minikube, however I believe that this should work on any k8s cluster.
Also important to note is that the Persistent Volume option can be any choice that works with your environment.

Prerequisites: A functional Kubernetes cluster or Minikube cluster

Run either the BASH (init_env.sh) or Ansible script (playbook.yml).

Once setup is completed then run port_forward.sh to port forward your Kibana to localhost:5601 OR run
minikube service list then the IP associated with: kube-logging         | kibana                    | http://*ip*

From there, just open up your favorite web-browser to http://localhost:5601.

Detailed instructions for setting up Kibana are in the below link, under 'Credits':

# Credit
Much credit has to go to the following article for inspiration:
https://www.digitalocean.com/community/tutorials/how-to-set-up-an-elasticsearch-fluentd-and-kibana-efk-logging-stack-on-kubernetes

# Disclaimer
This was tested locally in my Minikube environment.  I wouldn't recommended this for anything serious until further testing.

# Lisence:
Patrick Stambaugh

# Fix History:
1) Added Kibana and Fluentd to both the shell install script and Ansible install script.
2) Fixed Kibana so it can also be accessed via its Service.
