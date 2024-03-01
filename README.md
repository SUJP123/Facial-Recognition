Utilizing MATLAB, I constructed a facial recognition project that uses deep learning techniques in order to identify and match faces. There 
are three files included and each use a foulder reffered to as IMG_DATASET which contains two sub folders labeld "My Face" and "Random Person".

The first file to use is FMAIN.m which constructs a validation and training set that is used to train the model. The training parameters are
defined and after sufficient training, the actual facial recognition can begin. Note that utilizing larger sets of data for both subfolders 
in the IMG_DATASET folder would yield superior results and high accuracy. 

The next file to use is the Test_NET.m which randomly picks 9 of the images from the validaiton data created in the first file, and classifies
it as either "My Face" or "Random Person" with a probability. If the results are not the expected value, run FMAIN.m a few more times to train
the model until the desired results are met.

After testing on Test_NET, and judging if the model is accurately trained, the third file, IMG_Detector.m can be used. This detector takes
in an image and compares them to the images in the validation data set. If an image is deemed to be a match, then the loop will stop and 
the program will declare it a match. If there is no match, the program runs until the last picture which states it is not a match.

