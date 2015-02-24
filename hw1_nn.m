function preds = hw1_nn(X,Y,test)
A = [1000, 2000, 4000, 8000];
preds = struct([]);
prediction = [];
ind = 1;
for k = A
    sample = datasample([X Y], k, 1);
    [row, col] = size(sample);
    data = sample(:, 1:col-1);
    label = sample(:, col);
    [rows, columns] = size(test);
    pred = [];
    index = 1;
    for i = 1:rows
        min_dist = intmax('int64');
        index = 1;
        for j = 1:row-1
           new_min = abs(norm(data(j,:)-test(i,:)));
            if (min_dist > new_min)
                min_dist = new_min;
                index = j;
            end
        end
        pred = [pred; label(index)];
    end
    prediction = [prediction pred];
end
for a=1:4
preds(a).pred = prediction(:,a);
end
end


