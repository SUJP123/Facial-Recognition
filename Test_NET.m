loaded_net = load('Face_recognition.mat');

net = loaded_net.Trained_Net;

[Label, Probability] = classify(net, Resized_Validation);
accuracy = mean(Label == Validation.Labels);

index = randperm(numel(Validation.Files), 9);
figure
for i = 1:9
    subplot(3,3,i);
    full = readimage(Validation, index(i));
    imshow(full);
    label = Label(index(i));
    title(string(label) + ", " + num2str(100*max(Probability(index(i), :)), 3) + "%");
end