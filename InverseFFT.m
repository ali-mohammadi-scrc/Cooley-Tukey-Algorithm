function Signal = InverseFFT(Spectrum)
    Signal = CooleyTukey(Spectrum, 1)/length(Spectrum);
end