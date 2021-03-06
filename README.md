# Aperture Sonar Image Classifier Using Pre-trained Neural Networks

# Description
A jupyter notebook using the fast.ai library to classify synthetic aperture sonar imagery. Used in a study to determine the viability of training a classifier on synthetic data. Image processing scripts in MATLAB are used to generate the synthetic data.

# Abstract

In the past 10 years, advancements in graphical and cloud computing have made it possible to conduct a wide variety of experiments applying machine learning tools to real-world physical problems. In this thesis, we explore the effectiveness of applying these tools to an image classification problem dealing with SAS (Synthetic Aperture Sonar) imagery. Lack of reference SAS imagery means that training an image recognition algorithm would require creating a training dataset from the ground up. SAS imagery is computationally expensive to create which makes training an image classification algorithm non-trivial. Therefore, in this experiment we will leverage the use of artificially generated images from MATLAB to train our image classification algorithm. This algorithm will be validated on 3D-printed versions of the artificially generated images. The MNIST dataset will be used as a basis for both the set of artificially generated images and the set of 3D-printed models. The Fast.ai library will be used as the source for our image classification models. First returns of data show the classifier is able to categorize MATLAB generated training set at an accuracy rate of 99.5%. However, results are inconclusive for SAS data. Possible continuations of this study would explore the possibility of using numerical data rather than images, or categorizing scans based on material properties (ex: density).

# Usage

Refer to Ahmed_Raiid_Categorizing_Synthetic_Aperture_Sonar_Imagery_Using_Pre-Trained_Neural_Networks_and_Artificial_Data.pdf and AIRSAS-Image-Classifier-Flipped.ipynb.



