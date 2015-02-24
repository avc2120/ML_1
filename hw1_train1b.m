function params = hw1_train1b(X,Y)
[rows, columns] = size(X);
%params = struct([]);
mean = zeros(max(Y)+1,columns, 'double');
means = zeros(max(Y)+1,columns, 'double');
prior = zeros(max(Y)+1,columns, 'double');
for i = 1: length(Y)
    prior(Y(i)+1) = prior(Y(i)+1)+1;
end
disp(rows);
for i = 1: rows %X is data Y is labels
    mean(Y(i)+1, :) = double(mean(Y(i)+1,:) + X(i,:));
end

for i = 1: (max(Y)+1)
    for j = 1:columns
        means(i,j) = double(mean(i,j))/(prior(i));
    end
end
mean(1,:)
prior(1)
for i= min(Y)+1:max(Y)+1
    prior(i) = prior(i)/length(Y);
end



for i = 1:(max(Y)+1)
    params(i).prior = prior(i);
    params(i).mean = means(i,:);
end

%-----------------------
end
