function error = hw1_errors(preds, testlabels)  % to get the error for test set
    disp(size(preds));
    error = 0;
        for i = 1:length(testlabels)
            if (preds(i) ~= testlabels(i))
                error = error + 1;
            end
        end
error = error/(length(testlabels));
end