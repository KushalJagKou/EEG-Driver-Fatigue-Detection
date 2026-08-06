c01e_e = c01efatigueeeglab'; % Data loaded after pre-processing in EEGLAB toolbox
[r, c] = size (c01e_e);
fs = 256; % Sampling rate
duration = c / 256;
t = (0 : (c - 1)) / fs;
for i = [4 15 16 17 26 30] % Location of selected channels after the bd channels have been removed
    alphafiltered1e = filter (Hbpalpha, c01e_e(i, :));
    nfft= length(alphafiltered1e); %Length of Signal
    nfft2=2^nextpow2(nfft); % Length of singal In power Two to get a good resolution of the signal
    alphaSf1e=fft(alphafiltered1e,nfft2); % taking fft of the signal 
    xfft2=256*(0:nfft2/2-1)/nfft2; % to plot PSD against Frequency
    if i == 4
    f3psdxalpha_1e = (1/(fs*nfft2)) * abs(alphaSf1e).^2; % to calculate the power spectral density
    Halpha = alphaSf1e(1:nfft2/2); % Since the dataa will be a mirror plot we take half
    figure(1);
    plot(xfft2,abs(Halpha));
    xlabel ('Frequency (Hz)');
    ylabel ('Magnitude');
    elseif i == 15
    o1psdxalpha_1e = (1/(fs*nfft2)) * abs(alphaSf1e).^2;
    elseif i == 16
    ozpsdxalpha_1e = (1/(fs*nfft2)) * abs(alphaSf1e).^2;
    elseif i == 17
    o2psdxalpha_1e = (1/(fs*nfft2)) * abs(alphaSf1e).^2;
    elseif i == 26
    f4psdxalpha_1e = (1/(fs*nfft2)) * abs(alphaSf1e).^2;
    elseif i == 30
    fzpsdxalpha_1e = (1/(fs*nfft2)) * abs(alphaSf1e).^2;
    end

    betafiltered1e = filter (Hbpbeta, c01e_e(i, :));
    nfft= length(betafiltered1e); 
    nfft2=2^nextpow2(nfft); 
    betaSf1e=fft(betafiltered1e,nfft2);
    xfft2=256*(0:nfft2/2-1)/nfft2;
    if i == 4
    f3psdxbeta_1e = (1/(fs*nfft2)) * abs(betaSf1e).^2;
    Hbeta = betaSf1e(1:nfft2/2);
    figure(2);
    plot(xfft2,abs(Hbeta));
    xlabel ('Frequency (Hz)');
    ylabel ('Magnitude');
    elseif i == 15
    o1psdxbeta_1e = (1/(fs*nfft2)) * abs(betaSf1e).^2;
    elseif i == 16
    ozpsdxbeta_1e = (1/(fs*nfft2)) * abs(betaSf1e).^2;
    elseif i == 17
    o2psdxbeta_1e = (1/(fs*nfft2)) * abs(betaSf1e).^2;
    elseif i == 26
    f4psdxbeta_1e = (1/(fs*nfft2)) * abs(betaSf1e).^2;
    elseif i == 30
    fzpsdxbeta_1e = (1/(fs*nfft2)) * abs(betaSf1e).^2;
    end

    thetafiltered1e = filter (Hbptheta, c01e_e(i, :));
    nfft= length(thetafiltered1e);
    nfft2=2^nextpow2(nfft);
    thetaSf1e=fft(thetafiltered1e,nfft2);
    xfft2=256*(0:nfft2/2-1)/nfft2;
    if i == 4
    f3psdxtheta_1e = (1/(fs*nfft2)) * abs(thetaSf1e).^2;
    Htheta = thetaSf1e(1:nfft2/2);
    figure(3);
    plot(xfft2,abs(Htheta));
    xlabel ('Frequency (Hz)');
    ylabel ('Magnitude');
    elseif i == 15
    o1psdxtheta_1e = (1/(fs*nfft2)) * abs(thetaSf1e).^2;
    elseif i == 16
    ozpsdxtheta_1e = (1/(fs*nfft2)) * abs(thetaSf1e).^2;
    elseif i == 17
    o2psdxtheta_1e = (1/(fs*nfft2)) * abs(thetaSf1e).^2;
    elseif i == 26
    f4psdxtheta_1e = (1/(fs*nfft2)) * abs(thetaSf1e).^2;
    elseif i == 30
    fzpsdxtheta_1e = (1/(fs*nfft2)) * abs(thetaSf1e).^2;
    end
end
X = size(fzpsdxtheta_1e);
Z = zeros(X); % To mark the results as fatigued status (marked with 1s for active state)
psd1e = cat(2,fzpsdxtheta_1e', fzpsdxalpha_1e', fzpsdxbeta_1e', ...
    f3psdxtheta_1e', f3psdxalpha_1e', f3psdxbeta_1e', o2psdxtheta_1e', ...
    o2psdxbeta_1e', o2psdxalpha_1e', f4psdxtheta_1e', f4psdxalpha_1e', ...
    f4psdxbeta_1e', o1psdxalpha_1e', o1psdxbeta_1e', o1psdxtheta_1e', ...
    ozpsdxtheta_1e', ozpsdxbeta_1e', ozpsdxalpha_1e', Z'); % The resulting PSD values are stored in a single array