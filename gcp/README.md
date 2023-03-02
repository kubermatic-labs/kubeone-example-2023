# KubeOne on GCP
```bash
cd gcp
```

Now configure a service account as described on this page:
https://docs.kubermatic.com/kubeone/v1.6/guides/credentials/#environment-variables-3

```bash
export GOOGLE_CREDENTIALS=$(cat ./.env/k1-cluster-provisioner-sa-key.json)
```

Now we are set and can run the Terraform installation:

```bash
cd terraform
terraform init

vim terraform.tfvars ### TODO ADJUST your vars
terraform apply -var=control_plane_target_pool_members_count=1
```
Here you can find the reason why we use the terraform apply in a different way:
https://docs.kubermatic.com/kubeone/v1.4/guides/using_terraform_configs/#terraform-apply-1

Now lets run it:
````bash
terraform output --json
````
The output shows you the source input for the cluster bootstrapping by kubeone 
```bash
cd ..
kubeone apply -m kubeone.yaml -t ./terraform --verbose
```

Ensure HA by register all Control Planes
```bash
cd terraform
terraform apply
cd ..
kubeone apply -m kubeone.yaml -t ./terraform --verbose
```

New we cann upgrade to a new K8s version check [kubeone_update_1.yaml](./kubeone_update_1.yaml):
```bash
cd ..
kubeone apply -m kubeone_update_1.yaml -t ./terraform --verbose
```
If you want to apply final update and chart installation, check [kubeone_update_final.yaml](./kubeone_update_final.yaml):
```bash
#enable autoscaler
kubeone apply -m kubeone_update_final.yaml -t ./terraform --verbose

# add preemptible node pool
export KUBECONFIG=gcp-example-2023-kubeconfig
kubectl apply -f machines/
```