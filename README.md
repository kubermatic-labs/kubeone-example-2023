# kubeone-gcp


To install KubeOne run the folliwng command in your shell:


```
curl -sfL get.kubeone.io | sh

```

As we will connect via SSH to the machines make shure to have a ssh-agent running
```
eval ssh-agent $SHELL
ssh-add /home/YOURUSER/.ssh/id_rsa

```


Now configure a service account as described on this page:
https://docs.kubermatic.com/kubeone/v1.4/guides/credentials/#environment-variables-3

```
export GOOGLE_CREDENTIALS=$(cat ./k1-cluster-provisioner-sa-key.json)

```

Now we are set and can run the Terraform installation:

```
terraform init

terraform apply -var=control_plane_target_pool_members_count=1
terraform output -json > tf.json

```
Here you can find the reason why we use the terraform apply in a different way:
https://docs.kubermatic.com/kubeone/v1.4/guides/using_terraform_configs/#terraform-apply-1

Now lets run it:

```

kubeone apply -m kubeone.yaml -t terraform/tf.json 
```

If you want to migrate to container d
```
kubeone migrate to-containerd -m kubeone.yaml -t terraform/tf.json 
```
