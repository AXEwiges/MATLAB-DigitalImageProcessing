function [] = pathsearch(path,picture)
pic = imread(picture);
%It takes 15-30 seconds to run 
zi = ['春','凤','见','节','礼','论','日','散','声','石','水','天','万'...
    ,'王','惟','我','无','物','学','仰','以','有','玉','月','者','枝','知','众','重','字',];
ti = ["/cao/","/kai/","/li/","/qita/","/xing/","/zhuan/"];

famax = 0;              %Store maximum similarity
fpart = [" "," "," "];  %The folder part of the path, the three elements are font + body + picture name
for s = 1:length(zi)    %The following two loops are used to traverse word by word and font by font
    for u = 1:length(ti)
        ImgPath = strcat(path,zi(s));
        ImgPath = strcat(ImgPath,ti(u));%struct path    
        ImgList  = dir(ImgPath);          
        similiarity = zeros(1,length(ImgList));
        maxsimi = 0;
        maxposition = 0;
        for i = 1:length(ImgList)                   
            if(isequal(ImgList(i).name,'.')||isequal(ImgList(i).name,'..')) %Skip the.and..two folders        
                continue;
            end                                    
            img = imread(strcat(ImgPath,ImgList(i).name)); 
            similiarity(1,i) = SearchByPic(pic,img);
            [siminow,maxnow] = max(similiarity);
            if siminow>maxsimi    %Store a larger value after searching
                maxsimi = siminow;
                maxposition = maxnow;
            end
            if maxsimi > famax    %Compared with the global maximum, if the similarity is greater, save the path
                    famax = maxsimi;
                    fpart(1) = zi(s);
                    fpart(2) = ti(u);
                    fpart(3) = ImgList(maxposition).name;
            end
        end
    end
end
subplot(131);
imshow(picture);
title('原图片');
subplot(132);
ko1 = strcat(path,fpart(1));
ko2 = strcat(ko1,fpart(2));
ko3 = strcat(ko2,fpart(3));    %Construct the path to the image with the greatest similarity
p1 = fpart(1);
p2 = fpart(2);
p3 = fpart(3);
subplot(132);
imshow(ko3);
title('最相似图片');
xlabel(sprintf("相似余弦值为 = %f",famax));

famax = 0;
fpart = [p1,p2," "];
ImgPath = ko2;
ImgList  = dir(ImgPath);             
similiarity = zeros(1,length(ImgList));
maxsimi = 0;
maxposition = 0;
    for i = 1:length(ImgList)                    
        if(isequal(ImgList(i).name,'.')||isequal(ImgList(i).name,'..')||isequal(ImgList(i).name,p3))              
            continue;
        end                                    
        img = imread(strcat(ImgPath,ImgList(i).name));
        similiarity(1,i) = SearchByPic(pic,img);
        [siminow,maxnow] = max(similiarity);
        if siminow>maxsimi
            maxsimi = siminow;
            maxposition = maxnow;
        end
        if maxsimi > famax
            famax = maxsimi;
            fpart(3) = ImgList(maxposition).name;
        end
    end
subplot(133);
ko1 = strcat(path,fpart(1));
ko2 = strcat(ko1,fpart(2));
ko3 = strcat(ko2,fpart(3));
imshow(ko3);
title('第二相似图片');
xlabel(sprintf("相似余弦值为 = %f",famax));