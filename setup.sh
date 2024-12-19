#!/bin/sh

set -e

# Check if conda is installed
# ! command checks if the command will run or fail
if ! command -v conda &> /dev/null; then
    echo "Conda is not installed. Please install Anaconda or Miniconda."
    exit 1
fi

# source the env to be able to do activate / deactivate
source /opt/conda/etc/profile.d/conda.sh

if conda-env list | grep "SL-Detection"; then
    echo "Deleting existing 'SL-Detection' conda environment"
    conda deactivate
    conda remove --name SL-Detection --all --yes
fi

# Create a new conda environment named
echo "Creating new conda environment 'SL-Detection'..."
conda create --name SL-Detection -y
echo "Conda environment 'SL-Detection' has been created successfully."

# Activate the environment
echo "Activating SL-Detection..."
conda activate SL-Detection
echo "Conda environment activated"

# Install the requirements
echo "Installing requirements"
pip install -r requirements.txt
echo "Requirements installed"

# Finally download the dataset from kaggle
echo "Will download dataset from: https://www.kaggle.com/datasets/ahmedkhanak1995/sign-language-gesture-images-dataset/data"
mkdir -p sign_datasets/sign-language-gesture-images-dataset
curl -L -o ./sign_datasets/sign-language-gesture-images-dataset.zip https://www.kaggle.com/api/v1/datasets/download/ahmedkhanak1995/sign-language-gesture-images-dataset
echo "Download Completed. Will unzip"

# Unzip it
echo "Will unzip dataset to sign_datasets/sign-language-gesture-images-dataset"
unzip ./sign_datasets/sign-language-gesture-images-dataset.zip -d "sign_datasets/sign-language-gesture-images-dataset"
echo "Extraction completed"

# Finally remove the zip
echo "Will remove zip file"
rm ./sign_datasets/sign-language-gesture-images-dataset.zip
echo "Setup completed!"