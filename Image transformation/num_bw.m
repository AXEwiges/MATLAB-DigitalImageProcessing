function [] = num_bw(m)
img = imread(m);
[m n] = size(img);
s1 = 0;
s2 = 0;
for i = 1 : m
    for j = 1 : n
        if img(i,j)==0
            s1=s1+1;
        else
            s2=s2+1;
        end;
    end;
end;
x = [s1 s2];
bar(x);