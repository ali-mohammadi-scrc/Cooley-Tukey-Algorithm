function Output = CooleyTukey(Signal, inv)
    N = length(Signal);
    if (N == 1)
        Output = Signal;
        return
    end
    radix = factor(N);
    radix = radix(1);
    M = N/radix;
    %%
    X = zeros(radix, M);
    if inv
        Sign = 1;
    else
        Sign = -1;
    end
    for r = 1:radix
        Twiddles = exp(Sign * 2 * pi * 1i * (0:M-1) * (r - 1) / N);
        X(r, :) = CooleyTukey(Signal(r:radix:end), inv) .* Twiddles;
    end
    %%
    Output = zeros(1, M);
    for k = 0:radix-1
        temp = zeros(1, M);
        for r = 1:radix
            temp_0 = exp(Sign * 2 * pi * 1i * k * M * (r - 1) / N);
            temp = temp + temp_0 * X(r, :);
        end
        Output((k * M + 1):(k * M + M)) = temp;
    end
end