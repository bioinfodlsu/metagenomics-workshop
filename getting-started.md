# Getting started

To get started, you will need to go through the following steps.

1. Download the Jupyter notebooks prepard for this workshop.
2. Download the dataset for this workshop.
3. Install Docker.
4. Pull the Docker image prepared for this workshop.
5. Spin up a Docker container.


## 1. Download Jupyter notebooks
Jupyter notebooks needed for this workshop are provided in the GitHub repository: https://github.com/bioinfodlsu/metagenomics-workshop. Click the (green) Code button, then download zip, then unzip, and place the `metagenomics-workshop-main` folder to your preferred location. 

## 2. Download dataset 
A dataset containing pre-downloaded databases and some metagenomic samples can be downloaded from here. 
Download, unzip, and place the `data` folder inside `metagenomics-workshop-main` folder.

## 3. Install Docker
Skip this step if you already have Docker installed on your system.
Instruction to install Docker is available at https://docs.docker.com/desktop.

<!---
### Platform-Specific Requirements

#### Windows
- Install Docker Desktop:
  1. Download Docker Desktop from [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop).
  2. Follow the on-screen instructions to install.
  3. Launch Docker Desktop and ensure it is running.

#### macOS
- Install Docker Desktop:
  1. Download Docker Desktop from [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop).
  2. Follow the installation instructions and start Docker Desktop.

#### Linux
- Install Docker Engine:
  1. Update your package manager and install Docker. For example, on Ubuntu:
     ```
     sudo apt-get update
     sudo apt-get install -y docker.io
     sudo systemctl start docker
     sudo systemctl enable docker
     ```
  2. Add your user to the `docker` group to avoid using `sudo` with Docker commands:
     ```
     sudo usermod -aG docker $USER
     newgrp docker
     ```
-->

## 4. Pull the Docker image 
To resolve software dependency issues, we have provided a Docker image containing all software tools required for this workshop [here](https://github.com/orgs/bioinfodlsu/packages?repo_name=metagenomics-workshop).

Ensure you are running Docker Desktop/Engine. 
In the Command Prompt/Terminal, execute the following to download/pull the Docker image:

`docker pull ghcr.io/bioinfodlsu/metagenomics-workshop/deploy:latest`

### 5. Spin up a Docker container
In the Command Prompt/Terminal, launch a Docker container by executing the following, replacing `path_to_metagenomics-workshop-main` with the actual path on your system. If you are at the top-level of the `metagenomics-workshop-main` folder, the path is simply a dot `.`.

```
docker run -it --rm -p 8888:8888 -v path_to_metagenomics-workshop-main:/home/jovyan/work ghcr.io/bioinfodlsu/metagenomics-workshop/deploy:latest
```
Once the container is running, a link to the Jupyter Lab interface, including the authentication token (e.g., http://127.0.0.1:8888/?token=your_token), will appear in the terminal or command prompt after starting the container. Copy and paste this link into your browser.

<!---
Here’s a breakdown of the directories being mounted:
- **Data**: Your local path `path_to_your_data_directory` containing the data will be mounted to  `/home/jovyan/data` in the container. The data should be downloaded from the data folder located in this Drive Link (https://drive.google.com/drive/folders/1pfcwepIvSYmJ_wBp668jbVYR8nekrSF3?usp=sharing). Ensure that the required data files are placed in this directory before running the container.
- **Notebooks**: Your local path `path_to_your_notebooks_directory` will be mounted to `/home/jovyan/notebooks` in the container. The notebooks should be downloaded from the **notebooks folder in the Github repository provided**. Place your Jupyter notebooks into this local directory before running the container.

Make sure your data and notebooks are placed in your specified local directories before running the container.


Once the image is pulled and your directories are set up, run the Docker container with the following command:
```
docker run -p 8888:8888 -v "path_to_your_data_directory:/home/jovyan/data" -v "path_to_your_notebooks_directory:/home/jovyan/notebooks" ghcr.io/bioinfodlsu/metagenomics-workshop/deploy:latest
```
-->







