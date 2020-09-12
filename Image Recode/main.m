function [] = main(img)
x = imread(img);
y = diff_cod(x);
z = de_cod(y);
figure(1);
subplot(1,3,1);imshow(x);
subplot(1,3,2);imshow(uint8(y));
subplot(1,3,3);imshow(uint8(z));