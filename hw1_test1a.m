function preds = hw1_test1a(params,test)
results = [];
[row, column] = size(params);
[rowt, columnt] = size(test);
disp(column);
disp(rowt);
for i = 1:column
    pred_row = [];
    for j = 1: rowt %10000
        temp1 = test(j,:) - params(i).mean;
        temp3 = transpose(temp1);
        covariance = params(i).covariance;
        pred_row = [pred_row ; exp(-0.5*temp1*inv(covariance)*temp3)*params(i).prior/sqrt(det(covariance))];
    end
    results = [results pred_row];
end
% for i = 1:column
%     results = [results mvnpdf((test), (params(i).mean), params(i).covariance)];
% end
results
preds = [];
for i = 1:rowt
    [maxval, maxind] = max(results(i,:));
    preds = [preds; maxind-1];
end
disp(size(preds));
