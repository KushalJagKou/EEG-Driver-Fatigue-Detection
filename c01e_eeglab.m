
signalNoise = c01efatigueeeglab' - mean(c01efatigueeeglab');
% nfft= length(signalNoise); %Length of Signal (Tim)e Domain)
% nfft2=2^nextpow2(nfft); % Length of singal In power Two to get a good resolution of the signal
% f=fft(signalNoise,nfft2); % taking fft of the signal (y-signal and nfft2 length of signal)
% ff=f(1:nfft2/2); % since to plot shows mirror data we divide(starting point of the signal and the length/2
% xfft=256*(0:nfft2/2-1)/nfft2; % to plot Frequency(Divide to find frequency Per sample) (Equation correct to make sample of x axis and y asix equal)
% %plot(xfft,abs(ff)); % abs plotting frequency and Magnitude
[b,c] = butter(2,[3.5/256/2 30/256/2],'bandpass');
signal = filter(b,c,signalNoise);
nfft3= length(signal); %Length of Signal (Tim)e Domain)
nfft4=2^nextpow2(nfft3); % Length of singal In power Two to get a good resolution of the signal
f2=fft(signal,nfft4); % taking fft of the signal (y-signal and nfft2 length of signal)
ff2=f2(1:nfft4/2); % since to plot shows mirror data we divide(starting point of the signal and the length/2
xfft2=256*(0:nfft4/2-1)/nfft4; % to plot Frequency(Divide to find frequency Per sample) (Equation correct to make sample of x axis and y asix equal)
%plot(xfft2,abs(ff2)); % abs plotting frequency and Magnitude
psdx_fatigue_eeglab = (1/(fs*nfft3)) * abs(ff2).^2;
A_eeglab = ones(1,2048);
B_eeglab = zeros(1,2048);
psd_fatigue_eeglab_1e = cat(2,psdx_fatigue_eeglab',B_eeglab');
T1e_eeglab = array2table (psd_fatigue_eeglab_1e, 'VariableNames', {'PSD','Fatigue'});
writetable(T1e_eeglab,'psdc1e_eeglab.xlsx','Sheet',1);

