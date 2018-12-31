%% Reduced K-space Processing
clear all;close all

% Randomly sample k-space data and recontruct image after sampling.
I=imread('AxT1_brain.jpg');
I=rgb2gray(I);
I_fft=fft2(I);
I_fftS=fftshift(I_fft);

figure()
subplot(2,2,1)
imagesc(I);colormap gray;

subplot(2,2,2)
imagesc(abs(I_fftS),[1,10000]);colormap gray;

sample_mask=randi([0 1],size(I));% Subsampling to reduce time for image processing
I_fft_sampled=I_fftS.*sample_mask;

subplot(2,2,3)
imagesc(abs(I_fft_sampled),[1,10000]);colormap gray;

I_noise=ifft2(fftshift(I_fft_sampled));% ifft2 has inbuilt shift function???

subplot(2,2,4)
imagesc(abs(I_noise));colormap gray;
