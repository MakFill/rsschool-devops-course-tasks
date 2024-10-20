# K8s Cluster Configuration and Creation

This template allows you to configure and deploy AWS VPC infrastructure via GitHub Actions Pipeline for a Kubernetes (K8s) cluster using k3s:

**To use this template:**

1. Sign in to your AWS account.

2. In the `terraform/root/terraform.tfvars` file update: `default_cidr`, `ec2_ami`, `ec2_instance_type`, `key_pair` and `region` fields with related data.

3. In the `terraform/modules/vpc/variables.tf` file update: `public_subnet_cidrs`, `private_subnet_cidrs`, `azs`, `main_vpc_cidr_block` default values with related data.

4. Add the `AWS_ARN` (your AWS ARN), `REPO` (the name of your GitHub organization) and `ID` (your ID cidr block for ssh access) as environment (security) variables.

**To configure and create a Kubernetes (K8s) cluster:**

1. SSH into the Bastion Host via SSH (Github secret ID cidr block should be setted to allow your ID).

2. SSH into your K3s server instance:
    - `ssh -i "your-key.pem" ec2-user@<K3s_SERVER_PRIVATE_IP>`.

3. Install K3s:
    - `curl -sfL https://get.k3s.io | sh -`.

4. Get the K3s token and save it for later use:
    - `sudo cat /var/lib/rancher/k3s/server/node-token`.

5. To verify K3s is running, you can check the nodes:
    - `sudo k3s kubectl get nodes`.

6. SSH into your K3s agent instance:
    - `ssh -i "your-key.pem" ec2-user@<K3s_AGENT_PRIVATE_IP>`.

7. Install K3s agent:
    - Use the following command, replacing <K3s_SERVER_IP> with the public or private IP of your K3s server and <NODE_TOKEN> with the token obtained in the previous step.
      `curl -sfL https://get.k3s.io | K3S_URL=https://<K3s_SERVER_IP>:6443 K3S_TOKEN=<NODE_TOKEN> sh -`.

8. Verify the Setup:
    - Back to your K3s server instance, run: `sudo k3s kubectl get nodes`. You should see both the K3s server and the agent listed.

**To deploy a simple workload on the cluster:**

1. From the K3s instance run:
    - `sudo k3s kubectl apply -f https://k8s.io/examples/pods/simple-pod.yaml`.

2. Verify the Deployment:
    - `sudo k3s kubectl get pods`.

3. Check Pod details:
    - `sudo k3s kubectl describe pod <POD_NAME>`.

4. Check Pod logs:
    - `sudo k3s kubectl logs <POD_NAME>`. 
