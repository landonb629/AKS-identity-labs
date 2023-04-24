# AKS-identity-labs
labs and information on identity in Azure kubernetes service



## Scenario 

Your company has three types of employees that are interfacing with your k8s cluster. these are backend devs, frontend devs, and kubernetes administrators. Each of these employees needs access to SOME parts of the cluster but not ALL. 

## Methods for providing access to AKS 

- Kubernetes RBAC 
    - you assign user and group permissions in the kubernetes cluster using Roles/ClusterRoles and RoleBindings/ClusterRoleBindings
- Azure AD and Azure RBAC 
    - uses the Azure Ad integration to control access to the AKS cluster 
    - any changes that happen to a user or group are automatically updated in access to that cluster 

## Levels of access for operating AKS 

there are two different levels for operating and AKS cluster 

- subscription level access to the cluster 
    - grants permissions to pull the AKS config 
    - grants permissions to upgrade and scale the cluster 

- kubernetes api access 
    - controlled with Kubernetes RBAC 
    - controlled with azure RBAC 



## Difference between ClusterRoles and Roles

Roles: define permissions in a specific namespace 
    ex: a role grants a user the ability to create and managed pods / deployments in the development namespace 
ClusterRoles: defines permissions across an entire cluster 
    ex: a role grants a user the ability to create and manage pods / deployments in all namesapces


## Azure AD integration 

- you create the Roles and ClusterRoles that state permissions, these roles are binded to users or groups in azure AD 


## Limiting access to the kubeconfig file 
- kubeconfig file gives access to the cluster 
- Azure RBAC can be used to control access to credentials, these roles let you define who can grab a kubeconfig file 

Roles: 
 - Azure Kubernetes Service Cluster Admin Role 
    - Downloads kubeconfig for the clusterAdmin role 
    - users with clusterAdmin role have admin access 
 - Azure Kubernetes Service Cluster User Role 
    - Downloads kubeconfig for clusterUser role 
    - users with clusterRole have an empty kubeconfig file that prompts for login 



## Cluster Identity 

### Service principals + managed identities 
For AKS to access and make requests to other Azure resources, it's required to have either a service principal or a managed identity

Microsoft recommendation: use Managed identities to authenticate with other resources in azure, this is also the default authentication method in your AKS cluster 


#### Service principals 
Creating and user a service principal for AKS cluster

```
az ad sp create-for-rbac --name devCluster
```

specify the APPID for as the service principal for the AKS cluster, and use the client secret
- the service principal will need role assignments in order to be able to perform the necessary actions 

all of the permissions required can be found here 

https://gist.github.com/noelbundick/7799d7dfe76745a4fdd31b0f8563a858


#### Managed Identities
Managed identities are pretty much just a wrapper for service principals, but they make them easier to use because you don't have to handle any of the secret rotating

- by default, your AKS cluster is going to be created with a system assigned managed identity
- managed identity can be created from the portal, az cli, or with an IaC tool like terraform / pulumi / bicep


#### Difference between Cluster Identity and Identity

