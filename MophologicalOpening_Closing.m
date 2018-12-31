%% Morphological opening and closing for segmentation

% Remove bordered object
a=im2double(imread('potatoes12.tif'));
b=a>0.3;

% Morphological Opening - Erosion followed by dialation operation
% Remove bright spots outside potatoes
SE = strel('square',2);
Ie = imerode(double(b),SE);
Id = imdilate(Ie,SE);
figure();
imshowpair(b,Id,'montage');

% Morphological Closing - Dialation followed by erosion operation
% Fill dark holes inside potatoes
Id2=imdilate(Id,SE);
Ie2 = imerode(Id2,SE);
figure()
imshowpair(b,Ie2,'montage')

border = zeros( size(Ie2) );
border(1,:) = 1;
border(end,:) = 1;
border(:,1) =1;
border(:,end) = 1;

Po_border=Ie.*border;
Ibp=imreconstruct(Po_border,Ie2);
imshowpair(Ie2,Ibp,'montage')

% Mask over to remove potato
Icb=Ie2.*imcomplement(Ibp);
imshowpair(Ie2,Icb,'montage')

Iori=Icb.*a;
figure()
imshow(Iori,[])