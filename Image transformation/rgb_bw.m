function [] = rgb_bw(pic)
img = imread(pic);
[m n p] = size(img);
imgray = zeros(m,n);
for i = 1 : m
    for j = 1 : n
        imgray(i,j)=0.299*img(i,j,1)+0.587*img(i,j,2)+0.114*img(i,j,3);
    end;
end;
imgray = uint8(imgray);
imwrite(imgray,'imgray1.png');
gray_bw('imgray1.png');