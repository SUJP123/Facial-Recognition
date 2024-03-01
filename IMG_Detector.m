image_name = "TESTIMG.png";

[Label, Probability] = classify(net, Resized_Validation);
accuracy = mean(Label == Validation.Labels);


index1 = randperm(numel(Validation.Files), 15);

figure
subplot(1,2,1);
imshow(image_name);
title("Test Image")
for i = 1:15
    subplot(1,2,2);
    imshow(readimage(Validation, index1(i)));
    if string(Label(index1(i))) == "My Face"
        if 100*max(Probability(index1(i), :)) > 80
            title("MATCH");
            break;
        end
    end
    if string(Label(index1(i))) == "Random Person"
        title("Not a Match!");
    end
    if i == 15
        break;
    end
    drawnow;
end
