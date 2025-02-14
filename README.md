# Sign Language Image Detection

## Authors

Fourfouris Ioannis

Korovesis Panagiotis

Myrto Potamiti

## Report

For an __analytical report__ of our work please look at [Report/Sign_Language_Detection_Report.pdf](Report/Sign_Language_Detection_Report.pdf)


## Setup

To _create the virtual environment and download the dataset_ execute the following command:

```sh
bash setup.sh
```
## Project Structure

The structure of the project can be seen bellow

```bash
├── README.md
├── Report
│   ├── Sign Language Detection_Presentation.pptx
│   ├── Sign_Language_Detection_Report.pdf
│   └── Sign_Language_Image_Detection_Poster.pptx
├── requirements.txt
├── setup.sh
├── sign-language-image-detection-deliverables.zip
└── src
    ├── ViT
    │   ├── 27-class-asl-numpy-dataset.ipynb
    │   ├── ASL-dataset.ipynb
    │   ├── ASL_test_dataset_cache.pkl
    │   ├── ViT_Trainer.py
    │   ├── azSL-dataset.ipynb
    │   ├── benghali-dataset.ipynb
    │   ├── hagrid-dataset-gesture-dataset.ipynb
    │   ├── kenyan-dataset.ipynb
    │   └── post_processing.ipynb
    ├── nn_and_cnn
    │   ├── images
    │   │   ├── pytorch_conv2d.ipynb
    │   │   ├── pytorch_data_loader.ipynb
    │   │   └── pytorch_flatten.ipynb
    │   └── numpy
    │       ├── pytorch_conv2d_for_numpy.ipynb
    │       ├── pytorch_data_loader_for_numpy.ipynb
    │       └── pytorch_flatten_for_numpy.ipynb
    ├── transfer_learning
    │   ├── american_sign_language_transfer_learning.ipynb
    │   ├── azerbaijan_sign_language_transfer_learning.ipynb
    │   ├── bengali_sign_language_transfer_learning.ipynb
    │   ├── hagrid_10_transfer_learning.ipynb
    │   ├── hagrid_transfer_learning.ipynb
    │   ├── kenyan_sign_language_transfer_learning.ipynb
    │   ├── numpy-dataset-transfer-learning.ipynb
    │   ├── plot_results.ipynb
    │   ├── plots
    │   │   └── transfer_learning_accuracies.png
    │   └── sing_language_gesture_transfer_learning.ipynb
    └── utils
        ├── __init__.py
        │   ├── __init__.cpython-312.pyc
        │   ├── keras_dataset_utils.cpython-312.pyc
        │   └── numpy_dataset_utils.cpython-312.pyc
        ├── hagrid_subset_generator.ipynb
        ├── keras_dataset_utils.py
        └── numpy_dataset_utils.py
```