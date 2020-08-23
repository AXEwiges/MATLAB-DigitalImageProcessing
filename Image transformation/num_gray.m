function [] = num_gray(m)
img = imread(m);
[m n] = size(img);
level = 0;
pix = zeros(1,256);
for i = 1 : m
    for j = 1 : n
        level = img(i,j) + 1;
        pix(level) = pix(level) + 1;
    end;
end;
bar(pix);