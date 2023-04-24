# Out of box authentication 

## Scenario 
Using the terraform configuration, we have a cluster deployed with the out of box identity configuration. I'm going to create two new users, the first user is going to be an azure AD user and the second will be a local cluster user 

Azure AD user - devuser1
local k8s user = devuser2 

## creating a local k8s user
When creating a local K8s user, we will leverage the RBAC mechanisms provided by kubernetes. 

high level steps to create a local kubernetes user 
1. generate a certificate 
2. create a certificate signing request 
3. approve the certificate signing request 
4. get the certificate and decode it 
5. create Roles/RoleBindings 
6. create local context for the new kubernetes user 


## enabling Azure RBAC for an existing k8s cluster 


