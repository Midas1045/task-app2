# LAB TASK-APP DEVOPS DOCUMENTATION
The Lab Task-App is a comprehensive lab project that combines frontend and backend development with modern DevOps workflows. It showcases CI/CD automation, Jenkins pipeline orchestration, containerized deployments with Docker, and infrastructure provisioning with Terraform.


## Table of Contents
1. Introduction
2. Prerequisites and services used
3. Github account creation
4. Task App configuration
5. Github Actions
6. Jenkins Pipeline Automation
7. Docker Image Creation
8. Docker Hub and Repositories
9. Infrastructure as a code

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





