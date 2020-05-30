function ACF = AutoCorr (Signal)
    Spec = FFT(Signal);
    Power = abs(Spec) .^ 2;
    ACF = real(InverseFFT(Power));
    plot(1:length(Signal), ACF)
end