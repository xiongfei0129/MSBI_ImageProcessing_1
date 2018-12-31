function [I_GF]=GaussianBlur(sigma,I)
M=2*3*sigma;
index=-floor(M/2):floor(M/2);
[X Y]=meshgrid(index,index);
kernel_GB=exp(-(X.^2+Y.^2)/(2*sigma*sigma));
kernel_GB=kernel_GB/sum(kernel_GB(:));

% To create a wrap image for filtering
I = im2double(I);
I_wrap = repmat(I,3);
margin=floor(size(kernel_GB,1)/2);
x=size(I,1);
y=size(I,2);

I_wrap=I_wrap(x-margin:(2*x+margin)-1,y-margin:(2*y+margin)-1);
I_GF=conv2(I_wrap,kernel_GB,'valid');
end

