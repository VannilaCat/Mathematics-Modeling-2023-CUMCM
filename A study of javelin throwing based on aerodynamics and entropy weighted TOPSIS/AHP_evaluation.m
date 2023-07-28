clc,clear
%准则层判断矩阵
z=[1	4	6	8	5;
  1/4	1	2	4	3;
   1/6	1/2	1	3	2;
   1/8	1/4	1/3	1	1;
   1/5	1/3	1/2	1	1];

RI = [0,0,0.58,0.90,1.12,1.24,1.32,1.41,1.45]; %平均随机一致性指标RI
n = length(z); % 准则层指标数

[x,y]=eig(z);
lamda=max(diag(y))
num=find(diag(y)==lamda)
zw=x(:,num)/sum(x(:,num)) % 准则层权重值
