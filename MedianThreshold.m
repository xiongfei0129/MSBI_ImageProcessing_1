%% Median Threshold Filter 
function [I_threshold]=MedianThreshold(I)
threshold=median(I,'all');
I_threshold=I;
for i=1:size(I,1)
    for j=1:size(I,2)
        if I(i,j)<=threshold
            
            I_threshold(i,j)=0;
        else
            I_threshold(i,j)=255;
        end
    end
end
end