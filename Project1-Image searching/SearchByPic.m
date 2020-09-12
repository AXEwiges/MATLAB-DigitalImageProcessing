function cos1 = SearchByPic(pic,img)
picture1 = pic;
picture2 = img;

v1 = size(picture1,3);
v2 = size(picture2,3);
if v1>1
    picture1 = rgb2gray(picture1);
end
if v2>1
    picture2 = rgb2gray(picture2);
end

p1=picture1;
[r,c]=size(p1);
p2=picture2;
p2=imresize(p2,[r c],'bicubic'); 

p1=round(p1);
p2=round(p2);

h1=zeros(1,256);
h2=zeros(1,256);

for i=1:r
    for j=1:c
        a=p1(i,j)+1;  
        b=p2(i,j)+1;
        h1(a)=h1(a)+1;
        h2(b)=h2(b)+1;
    end
end

vector1=zeros(1,128); 
vector2=zeros(1,128);

for i=0:127
    vector1(1,i+1)=h1(2*i+1)+h1(2*i+2);
    vector2(1,i+1)=h2(2*i+1)+h2(2*i+2);
end
%Ideas from:https://blog.csdn.net/qq_23100787/article/details/51175775
A=sqrt(sum(sum(vector1.^2)));
B=sqrt(sum(sum(vector2.^2)));
C=sum(sum(vector1.*vector2));
cos1=C/(A*B);  

