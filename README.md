# LAB STATIC WEB-APP DEVOPS DOCUMENTATION
The Lab Web-App is a comprehensive lab project that combines frontend and backend development with modern DevOps workflows. It showcases CI/CD automation, Jenkins pipeline orchestration, containerized deployments with Docker, and infrastructure provisioning with Terraform.


## Table of Contents
1. Introduction
2. Prerequisites and services used
3. Github account creation
4. Web App configuration
5. Github Actions
6. Jenkins Pipeline Automations
7. Docker Installation and Image Creation
8. Docker Hub and Repositories
9. Kubernetes
10. Monitoring using Prometheus and Grafana

## Introduction
This repository is a comprehensive, hands-on project designed to provide practical experience in full-stack development and modern DevOps workflows. This project integrates a dynamic frontend and robust backend, powered by automated CI/CD pipelines and Jenkins-driven build orchestration. Containerization is handled with Docker for consistent deployments, while Terraform manages the infrastructure to enable scalable, reproducible environments.

## Prequisites and services used
* Local Working Directory with Frontend and Backend features
* Access to AWS Console Dashboard
* An Active Subscription (Free/Paid Tier)
* Nodejs
* Github Repository
* Jenkins
* Docker
* Docker Hub
* Kubernetes
* Prometheus and Grafana

## Github account creation

This serves as a cloud-based datacenter where all repositories are stored.
* Head to https://github.com and create an account.
* Verify your mail by confirming ownership through code or link sent by Github
* On the dashboard, navigate to ‘+’ sign and select ‘New Repository’. 
* On the next page, fill in the repository name and adjust the configuration settings to what is needed. Then select ‘Create Repository’

## Web App configuration

* Nodejs installation
  * Download nodejs from official website 
  * To verify, run `node -v` and `npm -v` to confirm status
* Task app folder and its sub-folders
  * To create the folder, run `mkdir task-app`.
  * Navigate into the folder and create frontend and backend folders by running `mkdir frontend backend`.
* Install dependencies in the backend
  * Run `cd backend` - This takes you the backend folder
  * Run `npm init -y` - This initializes the process of npm installation in the backend folder.
  * Run `npm install express` - This downloads npm in your backend folder
* Create server.js file
  * In the backend folder, run `notepad server.js`. This opens the notepad app where you input your script.
    Save the file. 
* Connect to the backend
  * Run `node server.js` to check if it is running. A url link will be displayed
  * Copy the url and paste in your browser- http://localhost:3000/tasks
  * It returns an empty array ‘[]’ because no tasks have been added yet. This shows that the Express server is working correctly.
    
* Create files on the frontend
  * Run `cd frontend` to change directory to the frontend
  * Run the following commands; 
    * `notepad index.html`
    * `notepad script.js`
    * `notepad style.css`
*  This launches a text editor like Notepad, allowing you to enter or paste your scripts. Then Save it



<p align="center"> <img width="900" height="698" alt="Screenshot 2026-03-22 223916" src="https://github.com/user-attachments/assets/44e0a59f-8cf6-4bbe-8781-116331acd8a2" />


## Github Actions
* Git Initialization

  Git is a distributed version control. It is used to track changes made in a project repository. 
  * To initialize git, navigate to the root directory of your project by running command `cd “projectname”` in the terminal
  * In the project directory, run `git init`  to create a hidden folder (.git)
  * Run `git status` to verify if successfully installed
 
* Git Global User Configuration

  This is necessary because every commit you make is stamped with your name and email. If you skip this step, Git may use a default or system name that doesn't      represent you, which can cause issues when collaborating with others or pushing to GitHub.
  * To configure github profiles in the project, run the following commands
    * `git config --global user.name “username”`- This adds the github username 
    * `git config --global user.email “email address”`- This adds the email address
    * Run `git config --list` to view and confirm profiles attached.

* Linking Project to Repository

  This links the project being worked on to its designated repository on github. That way, changes can be made either by saving or deletion of files. Projects can   also be cloned on new workspaces. 
  * To connect and link projects to repository, run command; `git remote add origin “repository link”`. 
  * To ensure you are on the main branch, run command; `git branch -m Main`


* GitHub Actions CI Pipeline

  To set up the CI pipeline ;
  * Create a Github parent folder and add a workflows folder. 
  * Run `mkdir -p .github/workflows.` This helps provision a hidden folder with a subfolder
  * Run `notepad ci.yml` within the workflows folder to create a new YAML file. Paste the CI workflow script into the editor and save the file.

* Push to Repository
  * Run `git status`- This checks for changes in the projects folder
  * Run `git add .` - This stages untracked files and prepares them for commit
  * Run `git commit -m “workflows file commit”`- Saves the new file changes with a message describing the actions taken
  * Run `git push`- This uploads the commit to the repository. 

## Jenkins Setup and Automation
1. Create a VPC and launch an EC2 instance on AWS. Ensure the AMI used is Ubuntu. Set the inbound rules for security groups and NACLS to the following: 
   * SSH - Port 22
   * HTTP- Port 80
   * Custom TCP- 8080
   * All traffic
These rules, especially All traffic, is subject to change to specific public addresses to ensure compliance with best safety practices.

2. Run `sudo apt update` and `sudo apt upgrade` to install system dependencies and security patches for vulnerabilities.

3. Install Java
   * Run `javac -version`. This lists available java applications ready for downloads. 
   * Run `sudo apt install fontconfig openjdk-21-jre -y` to install java on the instance
   * Run `java -version` to verify installation

4. Install Nodejs
   * Run `sudo apt install nodejs -y` to install nodejs on the instance
   * Run `node -v` to verify installation

5. Add Jenkins Repository
    * This does two things- downloads jenkins official security key and allows ubuntu to trust the jenkins package. 
      To this:
      `run echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
      https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
      /etc/apt/sources.list.d/jenkins.list > /dev/null`. This also adds jenkins official repository to ubuntu

6. Install Jenkins
   * To install jenkins, `run sudo systemctl install jenkins -y`. This downloads and installs Jenkins in the instance.
   * To enable, `run sudo systemctl enable jenkins` 
   * To check its status, `run sudo systemctl status jenkins`
   * To start Jenkins, `run sudo systemctl start jenkins`
   * To stop, `run sudo systemctl stop jenkins`

7. Access Jenkins
   * Copy the public address of the EC2 instance and replace here. http://Instance_Public_Address:8080 and access it on the web browser
   * On the displayed page, an admin password will be requested. This can be obtained from the instance
   * On the Instance CLI, run `sudo cat/var/lib/jenkins/secrets/initialAdminPassword` to obtain the password. Copy the results and paste where it was requested
   * Set up your email, username and password. Then select Install Suggested Plugins.

8. CI Pipeline 
   * Start by creating a new item, enter the name and select type option Pipeline
   * In the configuration settings, leave the general section as default
   * For the triggers section, check the box for github hook trigger for GITSCm polling
   * For pipeline section, set definition as Pipeline script from SCM
   * The SCM function is automatically set to Git
   * Paste the required repository url in its designated space
   * Switch the branch from Master to Main
   * For the script path, fill in Jenkinsfile, leave the rest in defaults and Save
   * Go to the Manage Jenkins section and navigate to Security
   * On the Security page, go to Git Hooks and check the box Allow on Controller. This allows git hooks to run on the Jenkins Controller. Then Save.

9. Create a github webhook
This feature on Github lets you link your repository to Jenkins and allows you to carry out build automations any time you push changes to your repository.
   * Go to the project repository and navigate to Settings
   * Locate Webhooks on the menu section 
   * On its settings page, input your payload url which is your jenkins url accompanied with “/github-webhook”. Eg; http://54.198.67.11:8080/github-webhook
   * Select your application type as application/json
   * Choose the events you would like triggers for through the webhook
   * Check the box for active, leave the Secret space blank and Save
   * A test ping action will be initiated to ensure connection to the local host. If successful, it sendsa message saying the last delivery was successful
   * To test the trigger feature, create a new folder in your project root directory and push it to the repository
   * Return to Jenkins and confirm that the build process has been automated successfully

<p align="center"> <img width="900" height="715" alt="Screenshot 2026-04-04 192328" src="https://github.com/user-attachments/assets/36e865b3-5ad7-48f7-a3e5-d6a21c9f8602" />


## Docker Installation and Image Creation
Docker is a tool that packages your application and everything it needs to run — code, dependencies, libraries, settings — into a single unit called a container.

Key Concepts include: 
* Image — a blueprint/template for creating a container. 
* Container — a running instance of an image. 
* Dockerfile — a text file with instructions on how to build an image.
* Docker Hub — an online registry where you can share and download images, like GitHub but for Docker images.


Steps 
1. Installation of Docker desktop and create a dockerfile
   * Download and install docker desktop locally then sign up or sign in if you already have an account
   * Run `notepad Dockerfile` in the frontend and backend directory of the project. This will open Notepad with a new file called Dockerfile.
   * Paste the basic Dockerfile script for the Node.js project

2. Build Docker Image Locally
   * Run `docker build -t project .` in the frontend and backend directory. This command builds a Docker image from your Dockerfile and tags it with the name of 	 the project.

3. Run the Container
   * Run command `docker run -d -p 3000:3000 project:tag`. This maps the frontend to run on port => 3000.
   * Run command `docker run -d -p 8081:3000 project:tag`. This maps the backend to run on port => 8081.
   * Ensure both ports are added to security groups to enable connectivity. 

4. Verify Container Status
    * Run `docker ps -q`. This shows only IDs of running containers.
    * Run `docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Ports}}`. This shows running containers with more detail.
    
5. Push Dockerfile to Github
  * Run the following commands
    * `git add .`
    * `git commit -m “activity”`
    * `git push`
 
This uploads the Dockerfile to GitHub repository so Jenkins can access it when running the CI pipeline. Since Jenkins is connected to GitHub through the webhook, pushing new code will automatically trigger a new Jenkins build.

6. Install Docker on Jenkins Server
   * On the instance, run `sudo apt update && sudo apt upgrade` to update dependencies and security patch configurations
   * Run command `sudo apt install docker.io -y` - This installs docker in the instance serving as the jenkins server that allows the CI pipeline to build and run      container images during automated builds
   * Run commands `sudo systemctl start docker && sudo systemctl enable docker`. This conveys two processes: Start the docker service and also ensure it is 		 enabled automatically whenever the server gets booted up

7. Enable access for Jenkins to Use Docker
   * Run `sudo usermod -aG docker jenkins`. This grants permission to Jenkins to run docker commands. Without this, Jenkins pipelines will fail when trying to 		 build Docker images. For Jenkins to build Docker images, Docker must be installed on that server.

8. Update the Jenkins Pipeline
   * In Week 3, the Jenkins pipeline included only two stages:
      * Install dependencies
      * Verify that Node.js is installed
Jenkins was only validating the environment and not building the application container. To complete, we need to add an another stage: Build the Docker image.

With this update, the pipeline will now:
  * Pull the repository
  * Install dependencies
  * Verify Node.js
  * Build the Docker image

By introducing the Docker build stage, Jenkins can automatically package the application into a container image whenever new code is pushed to GitHub.

9. Push the updated jenkinsfile to Github
Run commands:
	* `git  add .`
	* `git commit -m`
	* `git push`
	This pushes the changes made to the project repository

10. Verify Docker Build
Access your Jenkins server and verify the console output
To view/confirm that the docker image exists, run docker images. This displays docker images present in the server

<p align="center"> <img width="1159" height="684" alt="Screenshot 2026-05-05 141325" src="https://github.com/user-attachments/assets/a7fb5838-a718-4f98-90eb-13d34c5d5e64" />

## Kubernetes
1. Pre- Kubernetes Setup

	* Before running commands for installation, ensure you have enough space on your instance type of your virtual machine. Jenkins previously installed consumes 	  a lot of space and as such might pose an issue for setting up kubernetes. The workaround to this is to increase the storage capacity of the existing 			  instance type without having to delete or repurpose another one. Ideally anything 30GB and above should suffice.
	   * On the instance page, navigate to Instance state near the top right and click
	   * A drop down menu showing options is displayed then select Stop instance. The instance is stopped successfully.
	   * Head to the Actions tab beside the Instance state and click
	   * Navigate to the Instance Configuration sub-menu then select Change Instance type.
	   * This redirects to a page where a new instance type is selected depending on what is needed. Then Save
	   * Restart your instance and SSH into it via Mobaxtern

2. Kubernetes Installation

	* Lightweight Kubernetes was installed - Easy to install, half the memory, all in a binary of less than 100 MB. K3s is a lightweight, production-ready 			  Kubernetes distribution designed for low-resource environments, edge computing, IoT devices, development labs, and single-node or small clusters. It 			  packages core Kubernetes components into a single compact binary, reducing memory usage and simplifying installation, management, and deployment 	compared 	  to standard Kubernetes setups. 
		* To install, run `curl -sfL https://get.k3s.io | sh -` to install and set up Kubernetes on the EC2 instance.
		* Run `sudo kubectl get nodes` to verify status.

3.  Create K8s Folder Locally

	* Run `mkdir k8s` to create a dedicated kubernetes folder. This serves to store the deployment and service manifest files needed for operations.
	* Run the following commands: 
		* `notepad backend-deployment.yaml`
		* `notepad backend-service.yaml`
		* `notepad frontend-deployment.yaml`
		* `notepad frontend-service.yaml`		
	* For each command, input or paste the required script in the text editor and save.
	* Always ensure that the name of the docker images matches what is found in the docker hub repository to avoid errors.

4. Git Operations
	* On the local repository, `run git status`. This shows all untracked changes recently made in the repository
	* Run `git add .` - This prepares the files and adds them to a staging area
	* Run `git commit -m “description”`- Records all staged changes as a permanent snapshot in your local repository, along with a message describing what was 		  modified.
	* Run `git push`. This pushes the changes to the public remote repository
	* On the EC2 instance, run `git clone “repo link”`- This downloads a complete copy of the local project repository on the Instance. This enables for easy            access to the files needed for the Kubernetes setup

 5. Pull Docker Images from Docker Hub

	* Run `sudo apt install docker.io`. This installs docker in the EC2 instance. 
	* Run `sudo systemctl status docker` to verify installation.
	* Run command `docker login`. This enables you to add your docker credentials so as to access docker hub to push/pull docker images from the repository.
	* After successful authentication, run `docker pull “yourname/repo:description”` to pull the latest images from the repository. Eg; 
	  * `sudo docker pull clint7/frontend:Image1`
	  * `sudo docker pull clint7/backend:Image2`

  6. Apply on VM

	 * After cloning the local repository to the EC2 instance, run cd k8s to access the Kubernetes folder.
	 * Run ls to view and verify files
	 * Run the following commands to apply configurations for deployment and services files: 
	 	* `sudo kubectl apply -f backend-deployment.yaml`
	 	* `sudo kubectl apply -f backend-service.yaml`
		* `sudo kubectl apply -f frontend.service.yaml`
		* `sudo kubectl apply -f frontend-deployment.yaml`
	
* If deployment and service files are correct, a successful creation message will be displayed. This can change to configured if modifications were made to          the yaml files
	* To verify the output, run `sudo kubectl get pods`. This command lists all running pods in the cluster along with their current state. A healthy deployment         should show a STATUS of "Running" and a READY value of "1/1", meaning one out of one container inside the Pod is healthy and accepting traffic.
	* Run `sudo kubectl get svc`. This command lists all services in the cluster. Services give Pods stable network identities and control how they are accessed.
	* If a Pod shows "CrashLoopBackOff" or "Error", it means the container is failing to start. Run `sudo kubectl logs <pod-name>` to investigate and troubleshoot.

7. Add permissions and update Jenkins file

The Jenkinsfile needs to be modified to handle the complete pipeline — building both the frontend and backend Docker images, pushing them to Docker Hub, and       automatically deploying the updated images to the running Kubernetes cluster. Old Jenkins file script is updated with new one to ensure continuous deployment..   After this, carry out git operations to push to the remote repository.


* Generate a Docker Hub Access Token. 
	* Navigate to https://hub.docker.com/ and login to access the dashboard
	* Head to the profile section and select account settings
	* On the new tab, locate and select Personal Access Tokens from the left navigation menu.
	* Click Generate Token, fill in the required details including a description, set the access type to Read and Write, then click Generate.
	* Copy the generated token immediately as it will not be displayed again once you leave the page.
* Add generated access token to Jenkins
	* Navigate to Jenkins and open the Settings menu, then follow this path: Credentials → System → Global credentials → Add Credentials.
	* In the Kind field, select Username with password from the dropdown.
	* In the Username field, enter your Docker Hub username 
	* In the Password field, paste the access token you generated from Docker Hub. Do not use your Docker Hub account password here — the access token is what           Jenkins uses to authenticate securely.
	* In the ID field, enter dockerhub-creds exactly as written. This is the identifier the Jenkinsfile uses to reference this credential at runtime.
	* In the Description field, enter Docker Hub Access Token to make it easy to identify later.
	* Click Create to save the credential. By doing this, jenkins has been authenticated to push images created to docker hub. 
* Jenkins Configuration for Kubernetes Access
	* SSH into your VM and run the following command; `sudo chmod 644 /etc/rancher/k3s/k3s.yaml`. This gives Jenkins read access to the K3s configuration file,          allowing it to communicate with the Kubernetes cluster:
	* To add Jenkins to the sudo group so it has the necessary system-level permissions, run `sudo usermod -aG sudo jenkins`
	* Run `sudo visudo`. This opens the sudoers file safely using the following command. This file controls which users can run commands with elevated privileges:
	* Scroll to the bottom of the sudoers file and add the following line: jenkins ALL=(ALL) NOPASSWD: /usr/local/bin/kubectl. This allows Jenkins to run kubectl        commands without being prompted for a password each time:
	* Save and exit the file, then restart Jenkins to apply all the changes. Run command `sudo systemctl restart jenkins`

8. Pipeline Verification
	* Run the following command `sudo kubectl get pods` on your VM to confirm the pipeline executed successfully. You should see newly created Pods with a recent        AGE, indicating that fresh deployments have been rolled out. This confirms that Jenkins successfully built both images and pushed the new versioned copies         to Docker Hub. Kubernetes detected the updated image version and automatically performed a rolling update, replacing the old Pods with new ones without any 	  manual intervention.

9. Install and Configure OpenLens for External K3s Kubernetes Cluster Connectivity

    Openlens is a GUI tool to manage Kubernetes clusters It serves as a dashboard for monitoring and troubleshooting K8s setup
   * Install Openlens
     
	 * Go to https://github.com/MuhammedKalkan/OpenLens/releases and download the official file lts version
	 * Navigate to the downloaded .exe file on the local machine and double-click. 
	 * Follow the installation prompts and finish setup.


   * Update Kubeconfig to Enable Remote Server Access in OpenLens

     * On the server, run the following command to display the K3s kubeconfig file: cat /etc/rancher/k3s/k3s.yaml  . This displays the Kubernetes cluster 			  configuration, including the API server endpoint, certificate authority data, and authentication credentials required to connect the cluster to 				  OpenLens.
     * Next, highlight and copy the contents of the K3s kubeconfig file, then paste it into OpenLens to authenticate and enable cluster access. However, 			  the connection will still fail even after replacing the localhost address (`127.0.0.1`) with the server’s public IP address, because the K3s API 				  server is still configured to advertise and generate certificates for the localhost endpoint by default.
     * Run the following command to view the K3s system service configuration file: cat /etc/systemd/system$ k3s.service. This displays the K3s systemd 			  service definition, which contains the startup configuration used to launch the K3s server. This is where the Kubernetes API server settings can be 			  modified to advertise the server’s external IP address and generate the correct TLS certificates required for remote access through OpenLens.
     * Run the following command to edit the K3s system service configuration file: `sudo nano /etc/systemd/system/k3s.service`
     * Under the ExecStart section, update the K3s server configuration to include the external IP address
       ```
       ExecStart=/usr/local/bin/k3s \
	       server \
	       --tls-san {server IP adddress} \
	       --node-ip {server IP adddress} \
		   --advertise-address {server IP adddress} \

		```
		These parameters ensure that the Kubernetes API server advertises the correct public endpoint and generates TLS certificates that allow external tools 		    such as OpenLens to connect successfully.
	 * Save the file and restart the K3s service to apply the updated API server configuration by running the following commands:
	      ```
	      sudo systemctl daemon-reexec
		  sudo systemctl daemon-reload
		  sudo systemctl restart k3s
	      ```
	 * Verify by running `kubectl cluster-info`. This should display the server ip address and its mapped port (6443) instead of the local host
	 * After the service restarts, reconnect to OpenLens using the updated kubeconfig file. The cluster should now authenticate successfully using the server’s 	   public IP address instead of the default localhost endpoint
	 * The OpenLens dashboard should now be fully connected and live, allowing you to monitor the Kubernetes cluster in real time, including node status, 			   workload, pods, deployments, namespaces, events, and resource metrics such as CPU and memory usage.








	



    




