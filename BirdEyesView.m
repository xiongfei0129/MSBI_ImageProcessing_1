%% MRI Basics FT-Bird's Eyes View
clear all;close all

% Create a sine waveform
f=5; % Hz affects the distance between two delta functions after FTT
Fs=30;
Ts=1/Fs;
t=[0:Ts:6];
y=sin(2*pi*f*t);

% Horizontal grating - sine waveform repetition
f1Horizontal=zeros(length(y));
f1Horizontal=repmat(y,length(y),1);
imagesc(f1Horizontal);colormap gray;
title('frequency=1Hz, Horizontal Grating')

% FFT & Shift
f1Horizontal_fft=fft2(f1Horizontal);
figure()
imagesc(abs(f1Horizontal_fft));colormap gray % Discarding the complex number
title('2D FFT of frequency at 1Hz, horizontal frequency')

% In practice, k-space data get shifted by a center frequency. 
% Following step is necessary to return frequency range to COI.
f1Horizontal_fft_shift=fftshift(f1Horizontal_fft);
imagesc(abs(f1Horizontal_fft_shift));colormap gray 
title('2D FFT of frequency at 1Hz after shift, horizontal frequency')
