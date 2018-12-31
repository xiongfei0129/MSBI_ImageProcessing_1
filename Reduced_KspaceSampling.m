%% Reduced K-space Processing
%% Randomly sample k-space data and recontruct image after sampling.
clear all;close all
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

%% Selectively sample k-space data and reconstruct image after sampling. 
clear all;close all
I=imread('AxT1_brain.jpg');
I=rgb2gray(I);
I_fft=fft2(I);
I_fftS=fftshift(I_fft);

rows=size(I_fftS,1);
columns=size(I_fftS,2);
I_fftS_new=zeros(size(I_fftS));

mask_matrix=zeros(1,columns);

% Alternating
for i=1:rows
    if rem(i,2)==0
        I_fftS_newA(i,:)=I_fftS(i,:).*mask_matrix;
    else
        I_fftS_newA(i,:)=I_fftS(i,:);
    end
end

% Upper&Lower
for i=1:rows
    if i<220||i>660
        I_fftS_newB(i,:)=I_fftS(i,:).*mask_matrix;
    else
        I_fftS_newB(i,:)=I_fftS(i,:);
    end
end

I_newA=ifft2(I_fftS_newA);
I_newB=ifft2(I_fftS_newB);

subplot(2,2,1)
imagesc(abs(I_fftS_newA), [0 10000]);colormap gray;

subplot(2,2,2)
imagesc(abs(I_fftS_newB), [0 10000]);colormap gray;

subplot(2,2,3)
imagesc(abs(I_newA), [0 1000]);colormap gray;

subplot(2,2,4)
imagesc(abs(I_newB), [0 1000]);colormap gray;