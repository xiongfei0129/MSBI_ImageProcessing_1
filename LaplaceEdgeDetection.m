function [edgeMap]= LaplaceEdgeDetection(sigma,thresh,I)

I_GM=GradientMagnitude(sigma,I);% Apply GM filter
I_LoG=ZeroCrossings(I);
edgeMap=[];

for i=1:size(I_GM,1)
    for j=i:size(I_GM,2)
        if I_GM(i,j)>=thresh && I_LoG(i,j)==1
            edgeMap(i,j)=1;
        end
    end
end

end

