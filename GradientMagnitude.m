function [I_GM] = GradientMagnitude(sigma,I)

D=[0.5 0 -0.5];
M=3*sigma*2;
index=-floor(M/2):floor(M/2);
[X Y]=meshgrid(index,index);
kernel_GB=exp(-(X.^2+Y.^2)/(2*sigma*sigma));
kernel_GB=kernel_GB/sum(kernel_GB(:));

I_wrap = repmat(I,3);
margin=floor(size(kernel_GB,1)/2);
x=size(I,1);
y=size(I,2);
I_wrap=I_wrap(x-margin:(2*x+margin)-1,y-margin:(2*y+margin)-1);

G_magx=conv2(kernel_GB,D,'same');
G_magy=conv2(kernel_GB,D','same');


I_GMx=conv2(I_wrap,G_magx,'valid');
I_GMy=conv2(I_wrap,G_magy,'valid');
I_GM=sqrt(I_GMx.^2+I_GMy.^2);

end
