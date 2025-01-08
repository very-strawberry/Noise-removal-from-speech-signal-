[DataIn, fs] = audioread('test.wav');
[N, P] = size(DataIn);  % N is the number of samples
ts = 1 / fs;  % Sampling period
tmax = (N - 1) * ts;  % Maximum time
t = 0:ts:tmax;  % Time vector

fc = 0.4;  % Normalized cutoff frequency
N_order = 10;  % Filter order
[b, a] = butter(N_order, fc, 'low');  % Butterworth lowpass filter
filtered_audio = filter(b, a, DataIn);  % Apply the filter

% Play the filtered audio
soundsc(filtered_audio, fs);

% Write the filtered audio to a file
audiowrite('filtered.wav', filtered_audio, fs);

% Frequency vector for plotting
f = linspace(-fs / 2, fs / 2, length(filtered_audio));

% Plotting the filtered audio
figure;
plot(t, filtered_audio);
xlabel('Time (s)');
ylabel('Amplitude');
title('Filtered Speech Signal in Time Domain');

% Power spectrum of the filtered signal
Filtered_FFT = abs(fftshift(fft(filtered_audio)));  % Compute FFT and shift
figure;
plot(f, Filtered_FFT);  % Plot the power spectrum
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Filtered Speech Signal in Frequency Domain');
