%% Mean Difference Threshold Function
function [I_threshold]=MeanDifferenceThreshold(I)
t=[0:255];
u0=0;
u1=0;
I_low=0;
I_high=0;
c_t=[];
for m=1:size(t,2)
    I_low=[];
    I_high=[];
    for i=1:size(I,1)
        for j=1:size(I,2)       
            if I(i,j)<=t(m)
                I_low = [I_low I(i,j)];
 
            else
                I_high=[I_high I(i,j)];
            end
        end
    end
     u1(m)=mean(I_low,'all');
     u0(m)=mean(I_high,'all');
     p1 = length(I_low)/numel(I);
     p2 = length(I_high)/numel(I);
 
     c_t=[c_t p1*p2*(u0(m)-u1(m))^2];
end
[cmax,threshold]=max(c_t);
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