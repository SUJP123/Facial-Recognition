Dataset = imageDatastore('IMG_DATASET', 'IncludeSubfolders',true, 'LabelSource','foldernames');

[Training, Validation] = splitEachLabel(Dataset, 0.7, 'randomized');

net = squeezenet;
analyzeNetwork(net);

Input_Layer_Size = net.Layers(1).InputSize(1:2);
Resized_Training = augmentedImageDatastore(Input_Layer_Size, Training);
Resized_Validation = augmentedImageDatastore(Input_Layer_Size, Validation);

Network_Arc = layerGraph(net);

Number_of_Classes = numel(categories(Training.Labels));

New_Con_Layer = convolution2dLayer([1, 1], Number_of_Classes, ...
    'WeightLearnRateFactor', 10, 'BiasLearnRateFactor', 10, 'Name', ...
    'Facial Feature Learner');

New_Class_Layer = classificationLayer("Name", "Face Classifier");

New_Net = replaceLayer(Network_Arc, 'conv10', New_Con_Layer);
New_Net = replaceLayer(New_Net, 'ClassificationLayer_predictions', New_Class_Layer);

Training_opt = trainingOptions('sgdm', 'MiniBatchSize', 4, ...
    'MaxEpochs', 10, ...
    'InitialLearnRate', 4e-4, ...
    'Shuffle', 'every-epoch', ...
    'ValidationData', Resized_Training, ...
    'ValidationFrequency', 3, ...
    'Verbose', false, ...
    'Plots', 'training-progress');

Trained_Net = trainNetwork(Resized_Training, New_Net, Training_opt);

save('Face_recognition.mat','Trained_Net');