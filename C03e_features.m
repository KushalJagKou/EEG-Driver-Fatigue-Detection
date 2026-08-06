c03e_e = c03eeglabfilteredfatigue';
[r, c] = size (c03e_e);
fs = 256;
duration = c / 256;
t = (0 : (c - 1)) / fs;
for i = [4 15 16 17 27 31]
    alphafiltered3e = filter (Hbpalpha, c03e_e(i, :));
    nfft= length(alphafiltered3e); %Length of Signal
    nfft2=2^nextpow2(nfft); % Length of singal In power Two to get a good resolution of the signal
    alphaSf3e=fft(alphafiltered3e,nfft2); % taking fft of the signal 
    xfft2=256*(0:nfft2/2-1)/nfft2; % to plot PSD against Frequency
    if i == 4
    f3psdxalpha_3e = (1/(fs*nfft2)) * abs(alphaSf3e).^2; % to calculate the power spectral density
    Halpha = alphaSf3e(1:nfft2/2); % Since the dataa will be a mirror plot we take half
    figure(1);
    plot(xfft2,abs(Halpha));
    xlabel ('Frequency (Hz)');
    ylabel ('Magnitude');
    elseif i == 15
    o1psdxalpha_3e = (1/(fs*nfft2)) * abs(alphaSf3e).^2;
    elseif i == 16
    ozpsdxalpha_3e = (1/(fs*nfft2)) * abs(alphaSf3e).^2;
    elseif i == 17
    o2psdxalpha_3e = (1/(fs*nfft2)) * abs(alphaSf3e).^2;
    elseif i == 27
    f4psdxalpha_3e = (1/(fs*nfft2)) * abs(alphaSf3e).^2;
    elseif i == 31
    fzpsdxalpha_3e = (1/(fs*nfft2)) * abs(alphaSf3e).^2;
    end

    betafiltered3e = filter (Hbpbeta, c03e_e(i, :));
    nfft= length(betafiltered3e); 
    nfft2=2^nextpow2(nfft); 
    betaSf3e=fft(betafiltered3e,nfft2);
    xfft2=256*(0:nfft2/2-1)/nfft2;
    if i == 4
    f3psdxbeta_3e = (1/(fs*nfft2)) * abs(betaSf3e).^2;
    Hbeta = betaSf3e(1:nfft2/2);
    figure(2);
    plot(xfft2,abs(Hbeta));
    xlabel ('Frequency (Hz)');
    ylabel ('Magnitude');
    elseif i == 15
    o1psdxbeta_3e = (1/(fs*nfft2)) * abs(betaSf3e).^2;
    elseif i == 16
    ozpsdxbeta_3e = (1/(fs*nfft2)) * abs(betaSf3e).^2;
    elseif i == 17
    o2psdxbeta_3e = (1/(fs*nfft2)) * abs(betaSf3e).^2;
    elseif i == 27
    f4psdxbeta_3e = (1/(fs*nfft2)) * abs(betaSf3e).^2;
    elseif i == 31
    fzpsdxbeta_3e = (1/(fs*nfft2)) * abs(betaSf3e).^2;
    end

    thetafiltered3e = filter (Hbptheta, c03e_e(i, :));
    nfft= length(thetafiltered3e);
    nfft2=2^nextpow2(nfft);
    thetaSf3e=fft(thetafiltered3e,nfft2);
    xfft2=256*(0:nfft2/2-1)/nfft2;
    if i == 4
    f3psdxtheta_3e = (1/(fs*nfft2)) * abs(thetaSf3e).^2;
    Htheta = thetaSf3e(1:nfft2/2);
    figure(3);
    plot(xfft2,abs(Htheta));
    xlabel ('Frequency (Hz)');
    ylabel ('Magnitude');
    elseif i == 15
    o1psdxtheta_3e = (1/(fs*nfft2)) * abs(thetaSf3e).^2;
    elseif i == 16
    ozpsdxtheta_3e = (1/(fs*nfft2)) * abs(thetaSf3e).^2;
    elseif i == 17
    o2psdxtheta_3e = (1/(fs*nfft2)) * abs(thetaSf3e).^2;
    elseif i == 27
    f4psdxtheta_3e = (1/(fs*nfft2)) * abs(thetaSf3e).^2;
    elseif i == 31
    fzpsdxtheta_3e = (1/(fs*nfft2)) * abs(thetaSf3e).^2;
    end
end
X = size(fzpsdxtheta_3e);
Z = zeros(X);
psd3e = cat(2,fzpsdxtheta_3e', fzpsdxalpha_3e', fzpsdxbeta_3e', f3psdxtheta_3e', f3psdxalpha_3e', f3psdxbeta_3e', o2psdxtheta_3e', o2psdxbeta_3e', o2psdxalpha_3e', f4psdxtheta_3e', f4psdxalpha_3e', f4psdxbeta_3e', o1psdxalpha_3e', o1psdxbeta_3e', o1psdxtheta_3e', ozpsdxtheta_3e', ozpsdxbeta_3e', ozpsdxalpha_3e', Z');