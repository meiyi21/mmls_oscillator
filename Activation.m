function A = Activation(X)
    k = 2;
    X_h = 2;
    M = 1.5;
    A = (M + exp(-k * (X - X_h))) / (1 + exp(-k * (X - X_h)));
end