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

# Create a new python kernel
echo "Will create a new kernel for the project named 'SL Detection'"
python -m ipykernel install --user --name=sl_detection --display-name "SL Detection"
echo "Kernel created"

# Finally download the datasets

#########################
# SIGN LANGUAGE GESTURE #
#########################
# echo "Will download dataset from: https://www.kaggle.com/datasets/ahmedkhanak1995/sign-language-gesture-images-dataset/data"
# mkdir -p sign_datasets/sign-language-gesture-images-dataset
# curl -L -o ./sign_datasets/sign-language-gesture-images-dataset.zip https://www.kaggle.com/api/v1/datasets/download/ahmedkhanak1995/sign-language-gesture-images-dataset
# echo "Download Completed. Will unzip"

# # Unzip it
# echo "Will unzip dataset to sign_datasets/sign-language-gesture-images-dataset"
# unzip -oq ./sign_datasets/sign-language-gesture-images-dataset.zip -d "sign_datasets/sign-language-gesture-images-dataset"
# echo "Extraction completed"

# # Finally remove the zip
# echo "Will remove zip file"
# rm ./sign_datasets/sign-language-gesture-images-dataset.zip
# echo "Setup completed"

##########################
# AMERICAN SIGN LANGUAGE #
##########################
echo "Will download datset from https://www.kaggle.com/code/alfathterry/american-sign-language-real-time-detection"
mkdir -p sign_datasets/american_sign_language_dataset
curl -L -o sign_datasets/american_sign_language.zip https://www.kaggle.com/api/v1/datasets/download/kapillondhe/american-sign-language
echo "Download Completed. Will unzip"

# Unzip it
echo "Will unzip dataset to sign_datasets/american_sign_language"
unzip -oq ./sign_datasets/american_sign_language -d "sign_datasets/american_sign_language_dataset"
echo "Extraction completed"

# Finally remove the zip
echo "Will remove zip file"
rm ./sign_datasets/american_sign_language.zip
echo "Setup completed"

#########################
# HAGRID CLASSIFICATION #
#########################
echo "Will download dataset from "
curl -L -o sign_datasets/hagrid-classification-512p.zip https://www.kaggle.com/api/v1/datasets/download/innominate817/hagrid-classification-512p
echo "Download Completed. Will unzip"

# Unzip it
echo "Will unzip dataset to sign_datasets/hagrid_classification_dataset"
unzip -oq ./sign_datasets/hagrid-classification-512p.zip -d "sign_datasets/hagrid-classification-512p_dataset"
echo "Extraction completed"

# Finally remove the zip
echo "Will remove zip file"
rm ./sign_datasets/hagrid-classification-512p.zip
echo "Setup completed"

##################################
# 27-class-sign-language-dataset #
##################################
echo "Will download datset from https://www.kaggle.com/api/v1/datasets/download/ardamavi/27-class-sign-language-dataset"
mkdir -p sign_datasets/27-class-sign-language-dataset
curl -L -o sign_datasets/27-class-sign-language-dataset.zip https://www.kaggle.com/api/v1/datasets/download/ardamavi/27-class-sign-language-dataset
echo "Download Completed. Will unzip"

# Unzip it
echo "Will unzip dataset to sign_datasets/27-class-sign-language-dataset"
unzip -oq ./sign_datasets/27-class-sign-language-dataset -d "sign_datasets/27-class-sign-language-dataset"
echo "Extraction completed"

# Finally remove the zip
echo "Will remove zip file"
rm ./sign_datasets/27-class-sign-language-dataset.zip
echo "Setup completed"

##################################
# Bengali Sign Language Dataset  #
##################################
echo "Will download datset from https://www.kaggle.com/api/v1/datasets/download/muntakimrafi/bengali-sign-language-dataset"
mkdir -p sign_datasets/bengali-sign-language-dataset
curl -L -o sign_datasets/bengali-sign-language-dataset.zip https://www.kaggle.com/api/v1/datasets/download/muntakimrafi/bengali-sign-language-dataset
echo "Download Completed. Will unzip"

# Unzip it
echo "Will unzip dataset to sign_datasets/bengali-sign-language-dataset"
unzip -oq ./sign_datasets/bengali-sign-language-dataset -d "sign_datasets/bengali-sign-language-dataset"
echo "Extraction completed"

# Finally remove the zip
echo "Will remove zip file"
rm ./sign_datasets/bengali-sign-language-dataset.zip
echo "Setup completed"

################################
# Kenyan Sign Language Dataset #
################################
echo "Will download datset from https://www.kaggle.com/api/v1/datasets/download/gauravduttakiit/kslc-kenyan-sign-language-classification-challenge"
mkdir -p sign_datasets/kslc-kenyan-sign-language-dataset
curl -L -o sign_datasets/kslc-kenyan-sign-language-classification-challenge.zip https://www.kaggle.com/api/v1/datasets/download/gauravduttakiit/kslc-kenyan-sign-language-classification-challenge
echo "Download Completed. Will unzip"

# Unzip it
echo "Will unzip dataset to sign_datasets/kslc-kenyan-sign-language-dataset"
unzip -oq ./sign_datasets/kslc-kenyan-sign-language-classification-challenge -d "sign_datasets/kslc-kenyan-sign-language-dataset"
echo "Extraction completed"

# Finally remove the zip
echo "Will remove zip file"
rm ./sign_datasets/kslc-kenyan-sign-language-classification-challenge.zip 
echo "Setup completed"

#############################
# Azerbaijan Sign Language  #
#############################
echo "Will download datset from https://www.kaggle.com/api/v1/datasets/download/aykhannazimzada/azsl-dataset"
mkdir -p sign_datasets/azerbaijan-sign-language-dataset
curl -L -o sign_datasets/azsl-dataset.zip https://www.kaggle.com/api/v1/datasets/download/aykhannazimzada/azsl-dataset
echo "Download Completed. Will unzip"

# Unzip it
echo "Will unzip dataset to sign_datasets/ajerbaijan-sign-language-dataset"
unzip -oq ./sign_datasets/azsl-dataset -d "sign_datasets"
echo "Extraction completed"

# Finally remove the zip
echo "Will remove zip file"
rm ./sign_datasets/azsl-dataset.zip
echo "Setup completed"

# Delete all the useless files and folders
echo "Cleaning AzSL Dataset"
find "./sign_datasets/AzSL Dataset" -type f ! \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.ppm" -o -iname "*.bmp" -o -iname "*.pgm" -o -iname "*.tif" -o -iname "*.tiff" -o -iname "*.webp" \) -delete
find "./sign_datasets/AzSL Dataset" -type d -empty -delete
find "./sign_datasets/AzSL Dataset" -mindepth 1 -maxdepth 1 -type d ! -regex '.*/[A-Z]' -exec rm -rf {} +
