function preds = hw1_test1b(params,test)
results = [];
preds = [];
[row, column] = size(params); %1x10
[rowt, columnt] = size(test); %10000 x 784
disp(size(test)); 
disp(size(params(1).mean)); %1*784

    
for i = 1:column
    pred_row = [];
    for j = 1: rowt %10000
        temp1 = test(j,:) - params(i).mean;
        temp3 = transpose(temp1);
        pred_row = [pred_row ; (temp1*temp3)/-2 + log(params(i).prior)];
        %results = [results mvnpdf((test), (params(i).mean))];
    end
    results = [results pred_row];
end
preds = [];
for i = 1:rowt
    [maxval, maxind] = max(results(i,:));
    preds = [preds; maxind-1];
end
%preds = pred;

