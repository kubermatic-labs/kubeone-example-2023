# kubeone-gcp

```
curl -sfL get.kubeone.io | sh

```


```
eval ssh-agent $SHELL
ssh-add /home/mario/.ssh/id_rsa
export GOOGLE_CREDENTIALS=$(cat ./k1-cluster-provisioner-sa-key.json)
terraform init

terraform apply -var=control_plane_target_pool_members_count=1
terraform output -json > tf.json

kubeone apply -m kubeone.yaml -t terraform/tf.json 

kubeone migrate to-containerd -m kubeone.yaml -t terraform/tf.json 
```