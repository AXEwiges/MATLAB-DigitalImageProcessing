function [Re] = de_cod(y)
v = size(y,3);
if v==1
    [M,N] = size(y);
    Re = zeros(M,N);
    Re(:,1) = y(:,1);
    for i = 2:N
        Re(:,i) = Re(:,i-1) + y(:,i);
    end
end

if v>1
    [M,N,P] = size(y);
    Re = zeros(M,N,P);
    Re(:,1,1)=y(:,1,1);
    Re(:,1,2)=y(:,1,2);
    Re(:,1,3)=y(:,1,3);
    for i = 2:N
        Re(:,i,1) = Re(:,i-1,1) + y(:,i,1);
        Re(:,i,2) = Re(:,i-1,2) + y(:,i,2);
        Re(:,i,3) = Re(:,i-1,3) + y(:,i,3);
    end
end
