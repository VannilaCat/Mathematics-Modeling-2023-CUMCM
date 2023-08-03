clear,clc
data1 = xlsread('data.xlsx',2,'B3:B5402');
F = zeros(31,31);
m = 0; 
for i = linspace(111,113,31)
 n = 0; m = m+1;
 for j = linspace(8.33,8.35,31)
 n = n+1;
 tic
 F(m,n) = (skinT(i,j)-data1)'*(skinT(i,j)-data1);
 toc
 end
end
a=min(min(F));
[x,y]=find(F==a);
%绘制最佳的拟合图
T1=skinT(110.9+0.1*x,8.329+0.001*y);
figure(1)
plot(1:5400,T1,'r','LineWidth',1.5),hold on;
T2=xlsread('data.xlsx',2,'B3:B5402');
plot(1:5400,T2,'b:','LineWidth',1.5)
legend('模拟数据','实测数据','Location','Northwest')
%计算最大级差以及残差的平方和
R = (skinT(110.9+0.1*x,8.329+0.001*y)-data1)'*(skinT(110.9+0.1*x,8.329+0.001*y)-data1);
a=max(skinT(110.9+0.1*x,8.329+0.001*y)-data1);