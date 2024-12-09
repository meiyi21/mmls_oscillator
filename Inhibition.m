function I = Inhibition(X)
    k = 2;
    X_h = 2;
    M = 1.25;
    I = (1 + exp(-k * (X - X_h))) / (M + exp(-k * (X - X_h)));
end