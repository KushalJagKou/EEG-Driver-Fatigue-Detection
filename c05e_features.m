c05e_e = c05eeglabfatigue';
[r, c] = size (c05e_e);
fs = 256;
duration = c / 256;
t = (0 : (c - 1)) / fs;
for i = [4 14 15 16 26 30]
    alphafiltered5e = filter (Hbpalpha, c05e_e(i, :));
    nfft= length(alphafiltered5e); %Length of Signal
    nfft2=2^nextpow2(nfft); % Length of singal In power Two to get a good resolution of the signal
    alphaSf5e=fft(alphafiltered5e,nfft2); % taking fft of the signal 
    xfft2=256*(0:nfft2/2-1)/nfft2; % to plot PSD against Frequency
    if i == 4
    f3psdxalpha_5e = (1/(fs*nfft2)) * abs(alphaSf5e).^2; % to calculate the power spectral density
    Halpha = alphaSf5e(1:nfft2/2); % Since the dataa will be a mirror plot we take half
    figure(1);
    plot(xfft2,abs(Halpha));
    xlabel ('Frequency (Hz)');
    ylabel ('Magnitude');
    elseif i == 14
    o1psdxalpha_5e = (1/(fs*nfft2)) * abs(alphaSf5e).^2;
    elseif i == 15
    ozpsdxalpha_5e = (1/(fs*nfft2)) * abs(alphaSf5e).^2;
    elseif i == 16
    o2psdxalpha_5e = (1/(fs*nfft2)) * abs(alphaSf5e).^2;
    elseif i == 26
    f4psdxalpha_5e = (1/(fs*nfft2)) * abs(alphaSf5e).^2;
    elseif i == 30
    fzpsdxalpha_5e = (1/(fs*nfft2)) * abs(alphaSf5e).^2;
    end

    betafiltered5e = filter (Hbpbeta, c05e_e(i, :));
    nfft= length(betafiltered5e); 
    nfft2=2^nextpow2(nfft); 
    betaSf5e=fft(betafiltered5e,nfft2);
    xfft2=256*(0:nfft2/2-1)/nfft2;
    if i == 4
    f3psdxbeta_5e = (1/(fs*nfft2)) * abs(betaSf5e).^2;
    Hbeta = betaSf5e(1:nfft2/2);
    figure(2);
    plot(xfft2,abs(Hbeta));
    xlabel ('Frequency (Hz)');
    ylabel ('Magnitude');
    elseif i == 14
    o1psdxbeta_5e = (1/(fs*nfft2)) * abs(betaSf5e).^2;
    elseif i == 15
    ozpsdxbeta_5e = (1/(fs*nfft2)) * abs(betaSf5e).^2;
    elseif i == 16
    o2psdxbeta_5e = (1/(fs*nfft2)) * abs(betaSf5e).^2;
    elseif i == 26
    f4psdxbeta_5e = (1/(fs*nfft2)) * abs(betaSf5e).^2;
    elseif i == 30
    fzpsdxbeta_5e = (1/(fs*nfft2)) * abs(betaSf5e).^2;
    end

    thetafiltered5e = filter (Hbptheta, c05e_e(i, :));
    nfft= length(thetafiltered5e);
    nfft2=2^nextpow2(nfft);
    thetaSf5e=fft(thetafiltered5e,nfft2);
    xfft2=256*(0:nfft2/2-1)/nfft2;
    if i == 4
    f3psdxtheta_5e = (1/(fs*nfft2)) * abs(thetaSf5e).^2;
    Htheta = thetaSf5e(1:nfft2/2);
    figure(3);
    plot(xfft2,abs(Htheta));
    xlabel ('Frequency (Hz)');
    ylabel ('Magnitude');
    elseif i == 14
    o1psdxtheta_5e = (1/(fs*nfft2)) * abs(thetaSf5e).^2;
    elseif i == 15
    ozpsdxtheta_5e = (1/(fs*nfft2)) * abs(thetaSf5e).^2;
    elseif i == 16
    o2psdxtheta_5e = (1/(fs*nfft2)) * abs(thetaSf5e).^2;
    elseif i == 26
    f4psdxtheta_5e = (1/(fs*nfft2)) * abs(thetaSf5e).^2;
    elseif i == 30
    fzpsdxtheta_5e = (1/(fs*nfft2)) * abs(thetaSf5e).^2;
    end
end
X = size(fzpsdxtheta_5e);
Z = zeros(X);
psd5e = cat(2,fzpsdxtheta_5e', fzpsdxalpha_5e', fzpsdxbeta_5e', f3psdxtheta_5e', f3psdxalpha_5e', f3psdxbeta_5e', o2psdxtheta_5e', o2psdxbeta_5e', o2psdxalpha_5e', f4psdxtheta_5e', f4psdxalpha_5e', f4psdxbeta_5e', o1psdxalpha_5e', o1psdxbeta_5e', o1psdxtheta_5e', ozpsdxtheta_5e', ozpsdxbeta_5e', ozpsdxalpha_5e', Z');
