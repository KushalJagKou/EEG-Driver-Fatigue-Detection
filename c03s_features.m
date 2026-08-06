c03s_e = c03eeglabactive';
[r, c] = size (c03s_e);
fs = 256;
duration = c / 256;
t = (0 : (c - 1)) / fs;
for i = [4 15 16 17 27 31]
    alphafiltered3s = filter (Hbpalpha, c03s_e(i, :));
    nfft= length(alphafiltered3s); %Length of Signal
    nfft2=2^nextpow2(nfft); % Length of singal In power Two to get a good resolution of the signal
    alphaSf3s=fft(alphafiltered3s,nfft2); % taking fft of the signal 
    xfft2=256*(0:nfft2/2-1)/nfft2; % to plot PSD against Frequency
    if i == 4
    f3psdxalpha_3s = (1/(fs*nfft2)) * abs(alphaSf3s).^2; % to calculate the power spectral density
    Halpha = alphaSf3s(1:nfft2/2); % Since the dataa will be a mirror plot we take half
    figure(1);
    plot(xfft2,abs(Halpha));
    xlabel ('Frequency (Hz)');
    ylabel ('Magnitude');
    elseif i == 15
    o1psdxalpha_3s = (1/(fs*nfft2)) * abs(alphaSf3s).^2;
    elseif i == 16
    ozpsdxalpha_3s = (1/(fs*nfft2)) * abs(alphaSf3s).^2;
    elseif i == 17
    o2psdxalpha_3s = (1/(fs*nfft2)) * abs(alphaSf3s).^2;
    elseif i == 27
    f4psdxalpha_3s = (1/(fs*nfft2)) * abs(alphaSf3s).^2;
    elseif i == 31
    fzpsdxalpha_3s = (1/(fs*nfft2)) * abs(alphaSf3s).^2;
    end

    betafiltered3s = filter (Hbpbeta, c03s_e(i, :));
    nfft= length(betafiltered3s); 
    nfft2=2^nextpow2(nfft); 
    betaSf3s=fft(betafiltered3s,nfft2);
    xfft2=256*(0:nfft2/2-1)/nfft2;
    if i == 4
    f3psdxbeta_3s = (1/(fs*nfft2)) * abs(betaSf3s).^2;
    Hbeta = betaSf3s(1:nfft2/2);
    figure(2);
    plot(xfft2,abs(Hbeta));
    xlabel ('Frequency (Hz)');
    ylabel ('Magnitude');
    elseif i == 15
    o1psdxbeta_3s = (1/(fs*nfft2)) * abs(betaSf3s).^2;
    elseif i == 16
    ozpsdxbeta_3s = (1/(fs*nfft2)) * abs(betaSf3s).^2;
    elseif i == 17
    o2psdxbeta_3s = (1/(fs*nfft2)) * abs(betaSf3s).^2;
    elseif i == 27
    f4psdxbeta_3s = (1/(fs*nfft2)) * abs(betaSf3s).^2;
    elseif i == 31
    fzpsdxbeta_3s = (1/(fs*nfft2)) * abs(betaSf3s).^2;
    end

    thetafiltered3s = filter (Hbptheta, c03s_e(i, :));
    nfft= length(thetafiltered3s);
    nfft2=2^nextpow2(nfft);
    thetaSf3s=fft(thetafiltered3s,nfft2);
    xfft2=256*(0:nfft2/2-1)/nfft2;
    if i == 4
    f3psdxtheta_3s = (1/(fs*nfft2)) * abs(thetaSf3s).^2;
    Htheta = thetaSf3s(1:nfft2/2);
    figure(3);
    plot(xfft2,abs(Htheta));
    xlabel ('Frequency (Hz)');
    ylabel ('Magnitude');
    elseif i == 15
    o1psdxtheta_3s = (1/(fs*nfft2)) * abs(thetaSf3s).^2;
    elseif i == 16
    ozpsdxtheta_3s = (1/(fs*nfft2)) * abs(thetaSf3s).^2;
    elseif i == 17
    o2psdxtheta_3s = (1/(fs*nfft2)) * abs(thetaSf3s).^2;
    elseif i == 27
    f4psdxtheta_3s = (1/(fs*nfft2)) * abs(thetaSf3s).^2;
    elseif i == 31
    fzpsdxtheta_3s = (1/(fs*nfft2)) * abs(thetaSf3s).^2;
    end
end
X = size(fzpsdxtheta_3s);
O = ones(X);
psd3s = cat(2,fzpsdxtheta_3s', fzpsdxalpha_3s', fzpsdxbeta_3s', f3psdxtheta_3s', f3psdxalpha_3s', f3psdxbeta_3s', o2psdxtheta_3s', o2psdxbeta_3s', o2psdxalpha_3s', f4psdxtheta_3s', f4psdxalpha_3s', f4psdxbeta_3s', o1psdxalpha_3s', o1psdxbeta_3s', o1psdxtheta_3s', ozpsdxtheta_3s', ozpsdxbeta_3s', ozpsdxalpha_3s', O');