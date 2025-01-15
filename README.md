# Guide to Running Docker with Notebooks and Data

This guide outlines the steps to **pull** a Docker image, mount necessary directories (such as notebooks, data, and results), and run the container using Docker.

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
Note: Make sure you are running Docker Desktop or started your docker engine before performing any of the commands below.
### Step 1: Pull the Docker Image

First, you need to pull the Docker image from the registry (e.g., Docker Hub). Use the following command to pull the image:

`docker pull ghcr.io/bioinfodlsu/metagenomics-workshop/deploy:latest`

This command fetches the image and prepares it for running in a container.

### Step 2: Mount Local Directories

You’ll want to mount your local directories to the Docker container to ensure that your notebooks, data, and results are accessible inside the container.

Here’s a breakdown of the directories being mounted:
- **Data**: Your local path `path_to_your_data_directory` containing the data will be mounted to  `/home/jovyan/data` in the container. The data should be downloaded from the data folder located in this Drive Link (https://drive.google.com/drive/folders/1pfcwepIvSYmJ_wBp668jbVYR8nekrSF3?usp=sharing). Ensure that the required data files are placed in this directory before running the container.
- **Notebooks**: Your local path `path_to_your_notebooks_directory` will be mounted to `/home/jovyan/notebooks` in the container. The notebooks should be downloaded from the **notebooks folder in the Github repository provided**. Place your Jupyter notebooks into this local directory before running the container.

Make sure your data and notebooks are placed in your specified local directories before running the container.

### Step 3: Run the Docker Container

Once the image is pulled and your directories are set up, run the Docker container with the following command:
```
docker run -p 8888:8888 -v "path_to_your_data_directory:/home/jovyan/data" -v "path_to_your_notebooks_directory:/home/jovyan/notebooks" ghcr.io/bioinfodlsu/metagenomics-workshop/deploy:latest
```

Note: Please remember to replace the paths with your corresponding data and notebook directories.

### Step 4: Access Jupyter Notebook

Once the container is running, a link to the Jupyter Notebook interface, including the authentication token (e.g., http://127.0.0.1:8888/?token=your_token), will appear in the terminal or command prompt after starting the container. Simply copy and paste this link into your browser.



