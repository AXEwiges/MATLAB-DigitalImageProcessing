function [] = flip_2(img1,img2,m)
I = imread(img1);
J = imread(img2);
[q,w] = size(I);
[e,r] = size(J);
if q<e
    q = e;
end
if w<r
    w = r;
end
I = imresize(I,[q,w]);
J = imresize(J,[q,w]);
%S = ceil(sqrt(m)+1);
for i = 0 : m+1
    P = (1-i/(m+1))*I + i/(m+1)*J;
    %subplot(S,S,i+1);
    imshow(P);
end
%测试样例flip_2('tissue.png','rice.png',10);
%测试样例flip_2('DistortedImage.png','tissue.png',20);