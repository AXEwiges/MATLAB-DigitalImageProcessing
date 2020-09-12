function [] = ImageT(f)
I = imread(f);
v = size(I,3);
if v == 1
    [m,n] = size(I);
end
if v>1
    [m,n,u] = size(I);
end
BW = im2bw(I, graythresh(I));
[B,L] = bwboundaries(BW,'noholes');
STATS = regionprops(L,'Area');
p = STATS;
c = length(STATS);
for i = 1:c
    pp(i) = p(i,1).Area;
end
for i = 1:c
    for j = 1:c-i
        if pp(j)<pp(j+1)
            t = pp(j);
            pp(j) = pp(j+1);
            pp(j+1)= t;
        end
    end
end
for i = 1:c
    if pp(1) == STATS(i,1).Area
        for k = 1:m
            for j = 1:n
                if L(k,j) == i
                    L(k,j) = 255;
%                     figure(1);
%                     imshow(label2rgb(L, @winter, [1 1 1]));
%                     title('1');
                end
            end
        end
        imshow(label2rgb(L, @winter, [1 1 1]));
    end
    if pp(2) == STATS(i,1).Area
        for k = 1:m
            for j = 1:n
                if L(k,j) == i
                    L(k,j) = 225;
%                     figure(2);
%                     imshow(label2rgb(L, @winter, [1 1 1]));
%                     title('2')
                end
            end
        end 
        imshow(label2rgb(L, @winter, [1 1 1]));
    end
    if pp(3) == STATS(i,1).Area
        for k = 1:m
            for j = 1:n
                if L(k,j) == i
                    L(k,j) = 205;
                    imshow(label2rgb(L, @winter, [1 1 1]));
                end
            end
        end
        imshow(label2rgb(L, @winter, [1 1 1]));
    end
%         imshow(label2rgb(L, @jet, [.5 .5 .5]));
end
end