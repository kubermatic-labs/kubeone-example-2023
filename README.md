# KubeOne Example 2023

![KubeOne Meetup Stuttgart - Google Slides 2023-03-03 13-39-27](https://user-images.githubusercontent.com/4659261/222757469-f18c4277-44c5-4225-a5e7-67855cde3301.png)

[ Kickstart Your Kubernetes Projects with KubeOne - Novatec Meetup 2023 Stuttgart - PDF](https://drive.google.com/file/d/1xC23jBGz2U5WaLTMRdHxZyNk-ex9FJD6/view)

## Quickstart - KubeOne Tooling Container
```bash
docker run -u 0 -it --network host \
  -v "$(pwd)":/home/kubermatic/mnt \
  -v /run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock \
  -e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock" quay.io/kubermatic-labs/kubeone-tooling bash
```


## Install
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

### GCP - Static Hosts Debian Example
KubeOne running on static debian host: [gcp-debian-static-machines](./gcp-debian-static-machines)
* local storage provisioner
* metallb addon via helm

## vSphere

see [vsphere](vsphere)
