c01s_e = c01seeglab';
[r, c] = size (c01s_e);
fs = 256;
duration = c / 256;
t = (0 : (c - 1)) / fs;
for i = [3 14 15 16 25 29]
    alphafiltered1s = filter (Hbpalpha, c01s_e(i, :));
    nfft= length(alphafiltered1s); %Length of Signal
    nfft2=2^nextpow2(nfft); % Length of singal In power Two to get a good resolution of the signal
    alphaSf1s=fft(alphafiltered1s,nfft2); % taking fft of the signal 
    xfft2=256*(0:nfft2/2-1)/nfft2; % to plot PSD against Frequency
    if i == 3
    f3psdxalpha_1s = (1/(fs*nfft2)) * abs(alphaSf1s).^2; % to calculate the power spectral density
    Halpha = alphaSf1s(1:nfft2/2); % Since the dataa will be a mirror plot we take half
    figure(1);
    plot(xfft2,abs(Halpha));
    xlabel ('Frequency (Hz)');
    ylabel ('Magnitude');
    elseif i == 14
    o1psdxalpha_1s = (1/(fs*nfft2)) * abs(alphaSf1s).^2;
    elseif i == 15
    ozpsdxalpha_1s = (1/(fs*nfft2)) * abs(alphaSf1s).^2;
    elseif i == 16
    o2psdxalpha_1s = (1/(fs*nfft2)) * abs(alphaSf1s).^2;
    elseif i == 25
    f4psdxalpha_1s = (1/(fs*nfft2)) * abs(alphaSf1s).^2;
    elseif i == 29
    fzpsdxalpha_1s = (1/(fs*nfft2)) * abs(alphaSf1s).^2;
    end

    betafiltered1s = filter (Hbpbeta, c01s_e(i, :));
    nfft= length(betafiltered1s); 
    nfft2=2^nextpow2(nfft); 
    betaSf1s=fft(betafiltered1s,nfft2);
    xfft2=256*(0:nfft2/2-1)/nfft2;
    if i == 3
    f3psdxbeta_1s = (1/(fs*nfft2)) * abs(betaSf1s).^2;
    Hbeta = betaSf1s(1:nfft2/2);
    figure(2);
    plot(xfft2,abs(Hbeta));
    xlabel ('Frequency (Hz)');
    ylabel ('Magnitude');
    elseif i == 14
    o1psdxbeta_1s = (1/(fs*nfft2)) * abs(betaSf1s).^2;
    elseif i == 15
    ozpsdxbeta_1s = (1/(fs*nfft2)) * abs(betaSf1s).^2;
    elseif i == 16
    o2psdxbeta_1s = (1/(fs*nfft2)) * abs(betaSf1s).^2;
    elseif i == 25
    f4psdxbeta_1s = (1/(fs*nfft2)) * abs(betaSf1s).^2;
    elseif i == 29
    fzpsdxbeta_1s = (1/(fs*nfft2)) * abs(betaSf1s).^2;
    end

    thetafiltered1s = filter (Hbptheta, c01s_e(i, :));
    nfft= length(thetafiltered1s);
    nfft2=2^nextpow2(nfft);
    thetaSf1s=fft(thetafiltered1s,nfft2);
    xfft2=256*(0:nfft2/2-1)/nfft2;
    if i == 3
    f3psdxtheta_1s = (1/(fs*nfft2)) * abs(thetaSf1s).^2;
    Htheta = thetaSf1s(1:nfft2/2);
    figure(3);
    plot(xfft2,abs(Htheta));
    xlabel ('Frequency (Hz)');
    ylabel ('Magnitude');
    elseif i == 14
    o1psdxtheta_1s = (1/(fs*nfft2)) * abs(thetaSf1s).^2;
    elseif i == 15
    ozpsdxtheta_1s = (1/(fs*nfft2)) * abs(thetaSf1s).^2;
    elseif i == 16
    o2psdxtheta_1s = (1/(fs*nfft2)) * abs(thetaSf1s).^2;
    elseif i == 25
    f4psdxtheta_1s = (1/(fs*nfft2)) * abs(thetaSf1s).^2;
    elseif i == 29
    fzpsdxtheta_1s = (1/(fs*nfft2)) * abs(thetaSf1s).^2;
    end
end
X = size(fzpsdxtheta_1s);
O = ones(X);
psd1s = cat(2,fzpsdxtheta_1s', fzpsdxalpha_1s', fzpsdxbeta_1s', f3psdxtheta_1s', f3psdxalpha_1s', f3psdxbeta_1s', o2psdxtheta_1s', o2psdxbeta_1s', o2psdxalpha_1s', f4psdxtheta_1s', f4psdxalpha_1s', f4psdxbeta_1s', o1psdxalpha_1s', o1psdxbeta_1s', o1psdxtheta_1s', ozpsdxtheta_1s', ozpsdxbeta_1s', ozpsdxalpha_1s', O');