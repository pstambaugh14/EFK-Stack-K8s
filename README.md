# ELK-Stack-Kubernetes
Elasticsearch, Logstash and Kibana for Kubernetes
Elasticsearch, Fluentd and Kibana for Kubernetes

This stack is set to be utilized as a DaemonSet, allowing the collection of logs in ANY pod in the k8s cluster.

# How to Use
This was tested only on Minikube, however I believe that this should work on any k8s cluster.
Also important to note is that the Persistent Volume option can be any choice that works with your environment.

# Install
Prerequisites: A functional Kubernetes cluster or Minikube cluster
(Optional: Ansible)

1) Run either the shell script './init_env.sh' 

OR

2) Run 'ansible-playbook playbook.yml' (-v or -vvvv for verbosity levels).

# Running
1a) Once setup is completed then run port_forward.sh to port forward your Kibana to localhost:5601 
From there, just open up your favorite web-browser to http://localhost:5601.

OR:

1b) Run 'minikube service list' then grab the IP and port associated with the service in namespace kube-logging: kibana | http://*ip*:*port*

THEN:

2) In the Kibana dashboard, Create Index Pattern 'logstash-*'.  
   Then Select the Filter for @timestamp

3) Done!


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

# Goals/TODO:
1) Add SIEM Security AuditBeat for security metrics.
2) Add FileBeat to gather log data.
3) Add HeartBeat for UpTime Monitoring
4) Add MetricBeat for Metrics for such thing as Docker containers.
5) Considering adding APM for Application Monitoring
6) 
