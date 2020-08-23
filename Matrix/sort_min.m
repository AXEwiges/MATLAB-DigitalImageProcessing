function [s] = sort_min(m)
[r c] = size(m);
s = m(1,1);
o = 0;
for i = 1 : r
    for j = 1 : c
        if m(i,j)<s
            s = m(i,j);
        end;
    end;
end;