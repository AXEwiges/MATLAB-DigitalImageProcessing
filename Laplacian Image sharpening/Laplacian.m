function [] = Laplacian(img)
I = imread(img);
I = double(I);
v = size(I,3);
J1 = I;

mask = [0 -1 0;-1 4 -1;0 -1 0];
if v==1
    [r,c] = size(I);
    II = zeros(r+2,c+2);
    II(:,:) = 180;
    II(2:r+1,2:c+1) = I(1:r,1:c);
    for i = 2:r+1
        for j = 2:c+1
            S = 0;
            L = II(i-1:i+1,j-1:j+1);
            for k = 1:9
                S = S + L(k).*mask(k);
            end
            J1(i-1,j-1) = S;
            if J1(i-1,j-1) > 255
                J1(i-1,j-1) = 255;
            end
            if J1(i-1,j-1) <= 0
                J1(i-1,j-1) = 0;
            end
        end
    end
    J2 = J1;
end

if v>1
    [r,c,p] = size(I);
    II = zeros(r+2,c+2,3);
    II(:,:,1) = 150;
    II(:,:,2) = 150;
    II(:,:,3) = 150;
    II(2:r+1,2:c+1) = I(1:r,1:c);
    for i = 2:r+1
        for j = 2:c+1
              S1 = 0;S2 = 0;S3 = 0;
              L1 = II(i-1:i+1,j-1:j+1,1);
              L2 = II(i-1:i+1,j-1:j+1,2);
              L3 = II(i-1:i+1,j-1:j+1,3);
              for k = 1:9
              S1 = S1 + L1(k).*mask(k);
              S2 = S2 + L2(k).*mask(k);
              S3 = S3 + L3(k).*mask(k);
              end
              J1(i-1,j-1,1) = S1;
              J1(i-1,j-1,2) = S2; 
              J1(i-1,j-1,3) = S3;
              if J1(i-1,j-1,1) > 255
                J1(i-1,j-1,1) = 255;
              end
              if J1(i-1,j-1,1) <= 0
                J1(i-1,j-1,1) = 0;
              end
              if J1(i-1,j-1,2) > 255
                J1(i-1,j-1,2) = 255;
              end
              if J1(i-1,j-1,2) <= 0
                J1(i-1,j-1,2) = 0;
              end
              if J1(i-1,j-1,3) > 255
                J1(i-1,j-1,3) = 255;
              end
              if J1(i-1,j-1,3) <= 0
                J1(i-1,j-1,3) = 0;
              end
        end
    end
    J2 = rgb2gray(J1);
end

I = imread(img);
subplot(131);imshow(I);
title('原图');
subplot(132);imshow(J2);
title('滤波后');
I = double(I);
J3 = I + J1;
subplot(133);imshow(uint8(J3));
title('锐化后');

%           J1(i-1,j-1) = 4*II(i,j)-(II(i,j-1)+II(i,j+1)+II(i-1,j)+II(i+1,j));