function [] = main(pic)
subplot(2,2,1);rgb_gray(pic);
title('真彩转灰度');
subplot(2,2,2);num_gray('imgray.png');
title('灰度像素统计');
subplot(2,2,3);rgb_bw(pic);
title('真彩转二值');
subplot(2,2,4);num_bw('bww.png');
title('二值像素统计，左0右1');