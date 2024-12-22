#!/bin/sh

set -e

if [ -d ./.venv ]; then
    echo "Deleting existing VirtualEnv"
    rm -rf ./.venv
fi

# Create a new python virtual env
echo "Creating new python virtual environment"
python3 -m venv ./.venv
echo "Python virtual environment created"

# Activate the environment
echo "Activating VirtualEnv..."
source ./.venv/bin/activate
echo "VirtualEnv activated"

# Install the requirements
echo "Installing requirements"
pip3 install -r requirements.txt
echo "Requirements installed"

# Finally download the dataset from kaggle
echo "Will download dataset from: https://www.kaggle.com/datasets/ahmedkhanak1995/sign-language-gesture-images-dataset/data"
mkdir -p sign_datasets/sign-language-gesture-images-dataset
curl -L -o ./sign_datasets/sign-language-gesture-images-dataset.zip https://www.kaggle.com/api/v1/datasets/download/ahmedkhanak1995/sign-language-gesture-images-dataset
echo "Download Completed. Will unzip"

# Unzip it
echo "Will unzip dataset to sign_datasets/sign-language-gesture-images-dataset"
unzip -oq ./sign_datasets/sign-language-gesture-images-dataset.zip -d "sign_datasets/sign-language-gesture-images-dataset"
echo "Extraction completed"

# Finally remove the zip
echo "Will remove zip file"
rm ./sign_datasets/sign-language-gesture-images-dataset.zip
echo "Setup completed"