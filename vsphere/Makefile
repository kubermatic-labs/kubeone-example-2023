########## K1 vsphere cluster
K1_CONFIG="."
TF_CONFIG="./terraform"    #relative from K1_CONFIG

K1_EXTRA_ARG?="--auto-approve"
K1_KUBECONFIG=./kubeconfig-k1-vsphere
#K1_SSH_KEY="use-agent"

######### KubeOne
k1-load-env:
	@test -d ${K1_CONFIG} && echo "[ok]" && echo "kubeone config folder found " || exit 1
	### store kubeone version
	kubeone version > ${K1_CONFIG}/kubeone.version.json
	@#cd ${K1_CONFIG} && test -f ${K1_SSH_KEY} && chmod 600 ${K1_SSH_KEY} && ssh-add ${K1_SSH_KEY} && echo "[ok] "|| (echo "ERROR: ssh key permission ..." && exit 2)

k1-tf-init:
	cd ${K1_CONFIG} && cd ${TF_CONFIG} && \
	terraform init

k1-tf-apply: k1-load-env k1-tf-init
	cd ${K1_CONFIG} && cd ${TF_CONFIG} && \
	terraform apply

k1-tf-destroy: k1-load-env
	cd ${K1_CONFIG} && cd ${TF_CONFIG} && \
	terraform destroy

k1-tf-refresh: k1-load-env
	cd ${K1_CONFIG} && cd ${TF_CONFIG} && \
	terraform refresh

k1-apply:k1-load-env
	cd ${K1_CONFIG} && kubeone apply -m kubeone.yaml -t ${TF_CONFIG} --verbose ${K1_EXTRA_ARG}
	make k1-kubeconfig
	#make k1-apply-md
	#make k1-apply-secret

k1-reset: k1-load-env
	cd ${K1_CONFIG} && kubeone reset -m kubeone.yaml -t ${TF_CONFIG}  --verbose

k1-apply-addons: k1-load-env
	kubectl apply -f ${K1_CONFIG}/addons

k1-apply-md: k1-load-env
	kubectl apply -f ${K1_CONFIG}/machines

k1-kubeconfig: k1-load-env
	cd ${K1_CONFIG} && kubeone kubeconfig -m kubeone.yaml -t ${TF_CONFIG} > ${K1_KUBECONFIG}
