function [] = main
disp('输入行数m');
m = input('m =')
disp('输入列数n');
n = input('n =')
disp('随机数组');
p = randn(m,n)
disp('矩阵转置');
transposition = tr_1(p)
disp('最小元素');
min = sort_min(p)
disp('最大元素');
max = sort_max(p)
disp('矩阵排序');
sort_matrix = sort_all(p)