function [sort_1] = sort_all(m)
[r c] = size(m)
q_1 = r*c;
sort_1 = zeros(1,q_1);
o = 1;
d_1 = 0;
for i = 1 : r
    for j = 1 : c
        sort_1(1,o) = m(i,j);
        o = o + 1;
    end;
end;

for i = 1 : o
    for j = 1 : o-i-1
        if sort_1(1,j)<sort_1(1,j+1)
            d_1 = sort_1(1,j);
            sort_1(1,j) = sort_1(1,j+1);
            sort_1(1,j+1) = d_1;
        end;
    end;
end;