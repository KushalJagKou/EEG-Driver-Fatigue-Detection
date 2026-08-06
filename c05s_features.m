c05s_e = c05eeglabactive';
[r, c] = size (c05s_e);
fs = 256;
duration = c / 256;
t = (0 : (c - 1)) / fs;
for i = [4 15 16 17 27 31]
    alphafiltered5s = filter (Hbpalpha, c05s_e(i, :));
    nfft= length(alphafiltered5s); %Length of Signal
    nfft2=2^nextpow2(nfft); % Length of singal In power Two to get a good resolution of the signal
    alphaSf5s=fft(alphafiltered5s,nfft2); % taking fft of the signal 
    xfft2=256*(0:nfft2/2-1)/nfft2; % to plot PSD against Frequency
    if i == 4
    f3psdxalpha_5s = (1/(fs*nfft2)) * abs(alphaSf5s).^2; % to calculate the power spectral density
    Halpha = alphaSf5s(1:nfft2/2); % Since the dataa will be a mirror plot we take half
    figure(1);
    plot(xfft2,abs(Halpha));
    xlabel ('Frequency (Hz)');
    ylabel ('Magnitude');
    elseif i == 15
    o1psdxalpha_5s = (1/(fs*nfft2)) * abs(alphaSf5s).^2;
    elseif i == 16
    ozpsdxalpha_5s = (1/(fs*nfft2)) * abs(alphaSf5s).^2;
    elseif i == 17
    o2psdxalpha_5s = (1/(fs*nfft2)) * abs(alphaSf5s).^2;
    elseif i == 27
    f4psdxalpha_5s = (1/(fs*nfft2)) * abs(alphaSf5s).^2;
    elseif i == 31
    fzpsdxalpha_5s = (1/(fs*nfft2)) * abs(alphaSf5s).^2;
    end

    betafiltered5s = filter (Hbpbeta, c05s_e(i, :));
    nfft= length(betafiltered5s); 
    nfft2=2^nextpow2(nfft); 
    betaSf5s=fft(betafiltered5s,nfft2);
    xfft2=256*(0:nfft2/2-1)/nfft2;
    if i == 4
    f3psdxbeta_5s = (1/(fs*nfft2)) * abs(betaSf5s).^2;
    Hbeta = betaSf5s(1:nfft2/2);
    figure(2);
    plot(xfft2,abs(Hbeta));
    xlabel ('Frequency (Hz)');
    ylabel ('Magnitude');
    elseif i == 15
    o1psdxbeta_5s = (1/(fs*nfft2)) * abs(betaSf5s).^2;
    elseif i == 16
    ozpsdxbeta_5s = (1/(fs*nfft2)) * abs(betaSf5s).^2;
    elseif i == 17
    o2psdxbeta_5s = (1/(fs*nfft2)) * abs(betaSf5s).^2;
    elseif i == 27
    f4psdxbeta_5s = (1/(fs*nfft2)) * abs(betaSf5s).^2;
    elseif i == 31
    fzpsdxbeta_5s = (1/(fs*nfft2)) * abs(betaSf5s).^2;
    end

    thetafiltered5s = filter (Hbptheta, c05s_e(i, :));
    nfft= length(thetafiltered5s);
    nfft2=2^nextpow2(nfft);
    thetaSf5s=fft(thetafiltered5s,nfft2);
    xfft2=256*(0:nfft2/2-1)/nfft2;
    if i == 4
    f3psdxtheta_5s = (1/(fs*nfft2)) * abs(thetaSf5s).^2;
    Htheta = thetaSf5s(1:nfft2/2);
    figure(3);
    plot(xfft2,abs(Htheta));
    xlabel ('Frequency (Hz)');
    ylabel ('Magnitude');
    elseif i == 15
    o1psdxtheta_5s = (1/(fs*nfft2)) * abs(thetaSf5s).^2;
    elseif i == 16
    ozpsdxtheta_5s = (1/(fs*nfft2)) * abs(thetaSf5s).^2;
    elseif i == 17
    o2psdxtheta_5s = (1/(fs*nfft2)) * abs(thetaSf5s).^2;
    elseif i == 27
    f4psdxtheta_5s = (1/(fs*nfft2)) * abs(thetaSf5s).^2;
    elseif i == 31
    fzpsdxtheta_5s = (1/(fs*nfft2)) * abs(thetaSf5s).^2;
    end
end
X = size(fzpsdxtheta_5s);
O = ones(X);
psd5s = cat(2,fzpsdxtheta_5s', fzpsdxalpha_5s', fzpsdxbeta_5s', f3psdxtheta_5s', f3psdxalpha_5s', f3psdxbeta_5s', o2psdxtheta_5s', o2psdxbeta_5s', o2psdxalpha_5s', f4psdxtheta_5s', f4psdxalpha_5s', f4psdxbeta_5s', o1psdxalpha_5s', o1psdxbeta_5s', o1psdxtheta_5s', ozpsdxtheta_5s', ozpsdxbeta_5s', ozpsdxalpha_5s', O');
