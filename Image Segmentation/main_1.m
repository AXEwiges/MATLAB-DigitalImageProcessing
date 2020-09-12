function [] = main_1(img)
f = im2bw(uint8(imread(img)));
[x1,y1,x2,y2,x3,y3] = LINE_1(f);

figure(1); imshow(img), hold on
plot([x1(1) y1(1)], [x1(2) y1(2)],'LineWidth',2,'Color','blue');
plot(x1(1),x1(2),'x','LineWidth',2,'Color','red');
plot(y1(1),y1(2),'x','LineWidth',2,'Color','red');
plot([x2(1) y2(1)], [x2(2) y2(2)],'LineWidth',2,'Color','yellow');
plot(x2(1),x2(2),'x','LineWidth',2,'Color','red');
plot(y2(1),y2(2),'x','LineWidth',2,'Color','red');
plot([x3(1) y3(1)], [x3(2) y3(2)],'LineWidth',2,'Color','green');
plot(x3(1),x3(2),'x','LineWidth',2,'Color','red');
plot(y3(1),y3(2),'x','LineWidth',2,'Color','red');
hold off
figure(2);ImageT(img);