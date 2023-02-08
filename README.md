# botit-task

# The Task Components
- **GKE**
- **Kuberentes**
- **Terraform**
- **Jenkins**
- **Docker**
- **Webhook-github**


# GCP-Infra Structure By Terraform


## Terraform : 

- GKE Module
  
  - Cluster
  - Node
  - Service Account

- Network Module
   
   - VPC 
   - Firewall
   - Subnets
   - Nat 
 
 - VM Module 
  
   - vm instance with run Script.sh in Metadata 
 
   - Service Account
   

## Jenkins BY kubernetes

1- deploy jenkins

  - the offical Image of Jenkins

2- deploy jenkins slave 

   - build Image of base ubnutu conatin: 
        - Docker
        
        - Kubectl 
        
        - gcloud 
        
        - helm 
        
        - Java
        
3- credinatials of:
  
   -  Dockerhub                     
  
                                           --------> to access dockerhub to pull ana push image 
   
   - cluster kube config                 
                                
                                           --------> to access cluster to deploy the yamls files
   
   - slave                                
            
                                           --------> to act salve as node to run docker , kubectl and gcloud in Pipeline
   
   - servvice account of Mangment VM  
   
                                           --------> to authenticate with gcloud 

 4- create pipeline that make:
 
 
   - build docker image and push it for both App and test 
   
   - trigger the change in github repo by webhook
 
   - deploy DEPLOYMENTS by kubernetes in GKE cluster 
   
   
## Flask-App

- Dockerize the Flask app and its test from Repo https://github.com/alexosama-botit/exercise_do_1

- Kubernetes
    
    - Deployment to run the app
    
    - Service to expose the app
    
   
 
