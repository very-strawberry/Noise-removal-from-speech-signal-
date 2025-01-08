[DataIn,Fs] = audioread('test.wav');
[N,P]=size(DataIn);
ts=1/Fs;
tmax=(N-1)*ts;
t=0:ts:tmax;
plot(t,DataIn)
f=-Fs/2:Fs/(N-1):Fs/2;
z=fftshift(fft(DataIn));
plot(f,abs(z))
xlabel('Frequency');
ylabel('Power');
title('Unfiltered speech signal');