function x_norm = norm1(x)
    x_min = min(x);
    x_max = max(x);
    x_norm = ((x - x_min) / (x_max - x_min))-0.5;
end
