allow_insecure = true
cluster_name = "k1-vsphere-demo"

dc_name = "Hamburg"
datastore_name     = "vsan"
compute_cluster_name = "Kubermatic"
network_name       = "Default Network"
template_name      = "kkp-ubuntu-22.04"
resource_pool_name = ""
folder_name = "Kubermatic-PS"
ssh_username = "ubuntu"
ssh_public_key_file = "~/.ssh/id_rsa_loodse.pub"
is_vsphere_enterprise_plus_license = "false"
#cluster_name = "name of your cluster"
#dc_name = "datacenter name"
#compute_cluster_name = "cluster name"
#datastore_name = "datastore name"
#network_name = "network name"
#
#ssh_public_key_file = "path/to/.secrets/ubuntu.pub"
#ssh_username = "ubuntu"
#
#load_balancer_template = "machine template e.g. ubuntu-18.04"
#load_balancer_disk_size = 50
#control_plane_count = 3
#control_plane_memory = 4096
#control_plane_template = "machine template e.g. ubuntu-18.04"
#
#worker_template = "machine template e.g. ubuntu-18.04.ova"
#worker_memory = 4096
#worker_os = "ubuntu"
#worker_count = 3
#folder_name = "Folder name"
#resource_pool_name = "resource name"