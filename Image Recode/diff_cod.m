function [y] = diff_cod(x)
v = size(x,3);
if v == 1
    x = double(x);
    [m,n] = size(x);
    y = zeros(m,n);
    y(:,1)=x(:,1);
    for i = 2:n
        y(:,i) = x(:,i) - x(:,i-1);
    end
    imwrite(uint8(y),'diff_pic.png');
end

if v>1
    x = double(x);
    [m,n,p] = size(x);
    y = zeros(m,n,p);
    y(:,1,1)=x(:,1,1);
    y(:,1,2)=x(:,1,2);
    y(:,1,3)=x(:,1,3);
    for i = 2:n
        y(:,i,1) = x(:,i,1) - x(:,i-1,1);
        y(:,i,2) = x(:,i,2) - x(:,i-1,2);
        y(:,i,3) = x(:,i,3) - x(:,i-1,3);
    end
    imwrite(uint8(y),'diff_pic.png');
end


% I = imread(img);
% P = I;
% v = size(I,3);
% [m,n] = size(I);
% if v > 1
%     for i=1:m
%         for j=1:n
%             if i == 1 && j == 1
%                 P(i,j,1) = I(i,j,1);
%                 P(i,j,2) = I(i,j,2);
%                 P(i,j,3) = I(i,j,3);
%             end
%             if i ~= 1 && j == 1
%                 P(i,j,1) = I(i,j,1) - I(i-1,n,1);
%                 P(i,j,2) = I(i,j,2) - I(i-1,n,2);
%                 P(i,j,3) = I(i,j,3) - I(i-1,n,3);
%             end
%             if j~=1
%                 P(i,j,1) = I(i,j,1) - I(i,j-1,1);
%                 P(i,j,2) = I(i,j,2) - I(i,j-1,2);
%                 P(i,j,3) = I(i,j,3) - I(i,j-1,3);
%             end
%         end
%     end
% end
% if v == 1
%     for i=1:m
%         for j=1:n
%             if j == 1
%                 P(i,j) = I(i,j);
%             end
%             if j~=1
%                 P(i,j) = I(i,j) - I(i,j-1);
%             end
%         end
%     end
% end
% imwrite(uint8(y),'diff_pic.png');
% imshow(uint8(y));
% y = imread('diff_pic.png');
% [M,N] = size(y);
% I1=y(:);
% P =zeros(1,256);
% for i = 0:255
%     P(i+1)=length(find(I1==i))/(M*N);
% end
% k = 0:255;
% dict = huffmandict(k,P);
% enco = huffmanenco(I1,dict);
% imwrite(enco,'enco.png');
% deco = huffmandeco(enco,dict);
% Ido = col2im(deco,[M,N],[M,N],'distinct');
% subplot(2,2,1);imshow(I);
% subplot(2,2,2);imshow(y);