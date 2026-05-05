#  STATIC WEB-APP DEVOPS DOCUMENTATION
The Lab Web-App is a comprehensive lab project that combines frontend and backend development with modern DevOps workflows. It showcases CI/CD automation, Jenkins pipeline orchestration, containerized deployments with Docker, and infrastructure provisioning with Terraform.


## Table of Contents
1. Introduction
2. Prerequisites and services used
3. Github account creation
4. Task App configuration
5. Github Actions
6. Jenkins Pipeline Automations
7. Docker Installation and Image Creation
8. Docker Hub and Repositories
9. Infrastructure as a code
10. Kubernetes

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
* Terraform
* Kubernetes-

## Github account creation

This serves as a cloud-based datacenter where all repositories are stored.
* Head to https://github.com and create an account.
* Verify your mail by confirming ownership through code or link sent by Github
* On the dashboard, navigate to ‘+’ sign and select ‘New Repository’. 
* On the next page, fill in the repository name and adjust the configuration settings to what is needed. Then select ‘Create Repository’

## Task App configuration

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
   * On the Instance CLI, run sudo cat/var/lib/jenkins/secrets/initialAdminPassword to obtain the password. Copy the results and paste where it was requested
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
   * Run notepad Dockerfile in the root directory of the project. This will open Notepad with a new file called Dockerfile.
   * Paste the basic Dockerfile script for the Node.js project

2. Build Docker Image Locally
   * Run docker build -t project . in the root directory. This command builds a Docker image from your Dockerfile and tags it with the name of the project.

3. Run the Container
   * Run command docker run -p 3000:3000 project. This maps the backend to run on port => 3000. 
   * Open this in your browser: http://localhost:3000. This tells Docker to create and start a running container from the image built

4. Push Dockerfile to Github
  * Run the following commands
    * git add .
    * git commit -m “activity”
    * git push
 
This uploads the Dockerfile to GitHub repository so Jenkins can access it when running the CI pipeline. Since Jenkins is connected to GitHub through the webhook, pushing new code will automatically trigger a new Jenkins build.

5. Install Docker on Jenkins Server
   * On the instance, run sudo apt update and sudo apt upgrade to update dependencies and security patch configurations
   * Run command sudo apt install docker.io -y - This installs docker in the instance serving as the jenkins server that allows the CI pipeline to build and run        container images during automated builds
   * Run commands sudo systemctl start docker and sudo systemctl enable docker. This conveys two processes: Start the docker service and also ensure it is enabled      automatically whenever the server get booted up

6. Enable access for Jenkins to Use Docker
   * Run sudo usermod -aG docker jenkins. This grants permission to Jenkins to run docker commands. Without this, Jenkins pipelines will fail when trying to build      Docker images. For Jenkins to build Docker images, Docker must be installed on that server.

7. Update the Jenkins Pipeline
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


8. Push the updated jenkinsfile to Github
Run commands:
	* git  add .
	* git commit -m
	* git push
	This pushes the changes made to the project repository

9. Verify Docker Build
Access your Jenkins server and verify the console output
To view/confirm that the docker image exists, run docker images. This displays docker images present in the server



