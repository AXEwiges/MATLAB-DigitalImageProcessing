function [] = gray_bw(m)
img = imread(m);
[m n] = size(img);
imgray = zeros(m,n);
for i = 1 : m
    for j = 1 : n
        if img(i,j) > 0.5*255
            img(i,j) = 255;
        else
            img(i,j) = 0;
        end;
    end;
end;
imshow(img);
imwrite(img,'bww.png');