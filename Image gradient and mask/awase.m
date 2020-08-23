function [] = awase(img,mask)
I = imread(img);
J = imread(mask);
[q,w] = size(I);
[e,r] = size(J);
v = size(I,3);
if q<e
    q = e;
end
if w<r
    w = r;
end
I = imresize(I,[q,w]);
J = imresize(J,[q,w]);
P = I;
for i = 1 : q
    for j = 1 : w
        if J(i,j) == 0
            if v > 1
            P(i,j,1) = 0;
            P(i,j,2) = 0;
            P(i,j,3) = 0;
            end
            if  v == 1
            P(i,j) = 0;
            end
        end
    end
end
imshow(P);
%测试样例awase('DistortedImage.png','circles.png');
%测试样例awase('DistortedImage.png','hands1-mask.png');
%测试样例awase('coloredChips.png','hands1-mask.png');
%测试样例awase('coloredChips.png','circles.png');
%测试样例awase('rice.png','circles.png');