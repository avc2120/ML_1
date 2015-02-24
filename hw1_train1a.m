function params = hwk1_train1a(X,Y)
[rows, columns] = size(X);
params = struct([]);
mean = zeros(max(Y)+1,columns, 'double');
prior = zeros(max(Y)+1,columns, 'double');
means = zeros(max(Y)+1,columns, 'double');
for i = 1: length(Y)
    prior(Y(i)+1) = prior(Y(i)+1)+1;
end

disp('mean');
for i = 1: rows %X is data Y is labels
        mean(Y(i)+1, :) = mean(Y(i)+1,:) + double(X(i,:));
end

disp(mean);

for i = 1: (max(Y)+1)
    for j = 1:columns
        means(i,j) = double(mean(i,j))/(prior(i));
    end
end
disp(means);

disp('Class Priors:');
for i= min(Y)+1:max(Y)+1
    prior(i) = prior(i)/length(Y);
end
disp('Covariance');
for k = min(Y):max(Y)
    A = [];
    for i = 1:length(Y)
        if(Y(i) == k)
        	 A = [A ; X(i,:)];
        end
    end
    params(k+1).covariance = cov(A);
end



for i = 1:(max(Y)+1)
    params(i).prior = prior(i);
    params(i).mean = means(i,:);
    disp(params(i).covariance);
end

%-----------------------
end