function result = plot_error()
X = [1000,2000,4000,8000];
Y1 = [0.1141, 0.1167, 0.1116, 0.1111, 0.1120, 0.1157, 0.1167, 0.1121, 0.1113, 0.1174];
Y2 = [0.0868, 0.0895, 0.0884, 0.0911, 0.0903, 0.0919, 0.0872, 0.0917, 0.0913, 0.0894];
Y3 = [0.0715, 0.0701, 0.0728, 0.0665, 0.0696, 0.0695, 0.0696, 0.0675, 0.0689, 0.0692];
Y4 = [0.0524, 0.0533, 0.0555, 0.0555, 0.0563, 0.0565, 0.0542, 0.0558, 0.0549, 0.0559];
Y = [mean(Y1) mean(Y2) mean(Y3) mean(Y4)];
e = [std(Y1) std(Y2) std(Y3) std(Y4)];
result = plot(X,Y);
errorbar(X, Y, e);

end