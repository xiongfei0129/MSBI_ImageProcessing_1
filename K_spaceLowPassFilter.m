%% Low Pass Filter K-space Processing
function LPFilter_Fei_Xiong(I,A_width,A_length)
% This function allows user to input an image and generate a low pass 
% filtered image with specified inclusive aperture size in k-space. Subplots of all
% images including original,filtered k-space and filterd image are to
% be generated in this function. A filtered image will be save to the local
% directory. 
% e.g I=imread('kangaroo.jpg')
% I_new=LPFilter_Fei_Xiong(I,80,80)returns a filtered image that have
% a rectangular arpeture of 80x80 in k-space to generate a smoothier image.

if size(I,3)==3
    I=rgb2gray(I);
end

I_fft=fft2(I);
I_fftS=fftshift(I_fft);
middle_point=size(I)/2;
low_pass_mask=zeros(size(I));

for i=middle_point(1)-A_width/2:middle_point(1)+A_width/2
    for j=middle_point(2)-A_length/2:middle_point(2)+A_length/2
        low_pass_mask(i,j)=1;
    end
end

I_Kfiltered=I_fftS.*low_pass_mask;
I_filtered=ifft2(I_Kfiltered);
I_new=mat2gray(abs(I_filtered));

subplot(1,3,1)
imagesc(I); colormap gray; title('Original Image')
subplot(1,3,2)
imagesc(abs(I_Kfiltered),[1 1000000]); colormap gray; title('Filtered k-space image')
subplot(1,3,3)
imagesc(abs(I_filtered)); colormap gray; title('Low Pass Filtered Image')
imwrite(I_new,'LPFiltered.jpg')
end

