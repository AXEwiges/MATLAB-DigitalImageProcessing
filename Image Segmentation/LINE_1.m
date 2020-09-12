function [x1,y1,x2,y2,x3,y3] = LINE_1(BW)
BW = edge(BW,'canny');
[n, m] = size(BW);
[H,T,R] = hough(BW);
P  = houghpeaks(H,3,'threshold',ceil(0.3*max(H(:))));
lines= houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);
maxLength = 0;
for k = 1:length(lines)  
    xy = [lines(k).point1; lines(k).point2];
    p(k) = (xy(1,1) - xy(2,1))^2 + (xy(1,2) - xy(2,2))^2;
end  
for k = 1:length(lines)
    for j = 1:length(lines)-k
        if p(j)<p(j+1)
            t = p(j);
            p(j) = p(j+1);
            p(j+1) = t;
        end
    end
end
for k = 1:length(lines)  
    xy = [lines(k).point1; lines(k).point2];
    if p(1) == (xy(1,1) - xy(2,1))^2 + (xy(1,2) - xy(2,2))^2
        x1 = xy(1,:);y1 = xy(2,:);
    end
    if p(2) == (xy(1,1) - xy(2,1))^2 + (xy(1,2) - xy(2,2))^2
        x2 = xy(1,:);y2 = xy(2,:);
    end
    if p(3) == (xy(1,1) - xy(2,1))^2 + (xy(1,2) - xy(2,2))^2
        x3 = xy(1,:);y3 = xy(2,:);
    end
end  
end  