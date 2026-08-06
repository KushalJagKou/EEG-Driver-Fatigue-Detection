[r, c] = size (c01e);
fs = 256;
duration = c / 256;
t = (0 : (c - 1)) / fs;
for i = [4 15 16 17 27 31]
plot (t, c01e (i, :));
xlabel ('Time (s)');
ylabel ('Amplitude (V)');
grid on;
S = fft (c01e (i, :) - mean (c01e (i, :)));
% Generate a vector of frequencies from 0 to fs
fv = (0 : (c - 1)) / (c - 1) * fs;
% Now plot the spectrum
figure(2);
plot (fv, abs (S));
xlabel ('Frequency (Hz)');
ylabel ('Magnitude');
% Also, when plotting, you will see that the spectrum is symmetric. We only need the first half, up to fs/2.
figure (3);
plot (fv (1 : c / 2), abs (S (1 : c / 2)));
xlabel ('Frequency (Hz)');
ylabel ('Magnitude');
%Filter the signal and plot the transform
alphafiltered1e = filter (Hbpalpha, c01e(i, :));
nfft= length(alphafiltered1e); %Length of Signal (Tim)e Domain)
nfft2=2^nextpow2(nfft); % Length of singal In power Two to get a good resolution of the signal
aplhaSf1e=fft(alphafiltered1e,nfft2); % taking fft of the signal (y-signal and nfft2 length of signal)
ff=aplhaSf1e(1:nfft2/2); % since to plot shows mirror data we divide(starting point of the signal and the length/2
xfft=256*(0:nfft2/2-1)/nfft2; % to plot Frequency(Divide to find frequency Per sample) (Equation correct to make sample of x axis and y asix equal)
psdxalpha = (1/(fs*nfft)) * abs(xfft).^2;
alphaentropy = pentropy(xfft);
figure (4);
plot (fv (1 : c / 2), abs (aplhaSf1e (1 : c / 2)));
xlabel ('Frequency (Hz)');
ylabel ('Magnitude');
betafiltered1e = filter (Hbpbeta, c01e(i, :));
nfft= length(betafiltered1e); %Length of Signal (Tim)e Domain)
nfft2=2^nextpow2(nfft); % Length of singal In power Two to get a good resolution of the signal
betaSf1e=fft(betafiltered1e,nfft2); % taking fft of the signal (y-signal and nfft2 length of signal)
ff=betaSf1e(1:nfft2/2); % since to plot shows mirror data we divide(starting point of the signal and the length/2
xfft=256*(0:nfft2/2-1)/nfft2;
psdxbeta = (1/(fs*nfft)) * abs(xfft).^2;
betaentropy = pentropy(xfft);
figure (5);
plot (fv (1 : c / 2), abs (betaSf1e (1 : c / 2)));
xlabel ('Frequency (Hz)');
ylabel ('Magnitude');
thetafiltered1e = filter (Hbptheta, c01e(i, :));
nfft= length(thetafiltered1e); %Length of Signal (Tim)e Domain)
nfft2=2^nextpow2(nfft); % Length of singal In power Two to get a good resolution of the signal
thetaSf1e=fft(thetafiltered1e,nfft2); % taking fft of the signal (y-signal and nfft2 length of signal)
ff=thetaSf1e(1:nfft2/2); % since to plot shows mirror data we divide(starting point of the signal and the length/2
xfft=256*(0:nfft2/2-1)/nfft2;
psdxtheta = (1/(fs*nfft)) * abs(xfft).^2;
thetaentropy = pentropy(xfft);
figure (6);
plot (fv (1 : c / 2), abs (thetaSf1e (1 : c / 2)));
xlabel ('Frequency (Hz)');
ylabel ('Magnitude');
end