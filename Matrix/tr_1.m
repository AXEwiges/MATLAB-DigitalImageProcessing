function [s] = tr_1(m)
[r c] = size(m);
q = c;
w = r;
s = zeros(q,w);
for i = 1 : q
    for j = 1 : r
        s(i,j) = m(j,i);
    end;
end;