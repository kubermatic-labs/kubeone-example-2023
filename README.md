# KubeOne Example 2023

<iframe src="https://docs.google.com/presentation/d/e/2PACX-1vRryHk-9AO9rC7RhFKryX1pqytHWpXMl6TcLMX5sS_IB8BNV55l4SR46i_NLZryIWUhWay5PhHGx12j/embed?start=false&loop=false&delayms=3000" frameborder="0" width="1440" height="839" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>


To install KubeOne run the folliwng command in your shell:


```
curl -sfL get.kubeone.io | sh

```

As we will connect via SSH to the machines make shure to have a ssh-agent running
```
eval ssh-agent $SHELL
ssh-add /home/YOURUSER/.ssh/id_rsa

```

## GCP

see [gcp/README](gcp/README.md)

## vSphere

see [vsphere](vsphere)
