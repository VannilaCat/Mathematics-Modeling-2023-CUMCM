% T=skinT(110.9+0.1*x,8.329+0.001*y); %这里的 skinT 函数的输出已经进行过更改
x=[0.0006,0.006,0.0036,0.005]; %每层的宽度
dx=[0.0001,0.001,0.0006,0.001];
x1=dx(1):dx(1):x(1);
x2=x(1)+dx(2):dx(2):x(1)+x(2);
x3=x(1)+x(2)+dx(3):dx(3):x(1)+x(2)+x(3);
x4=x(1)+x(2)+x(3)+dx(4):dx(4):x(1)+x(2)+x(3)+x(4);
x=[0,x1,x2,x3,x4];
% mesh(x,1:5400,T)
T=skinT(113,8.344);
%绘制稳态时的温度分布截面图，
T=T(end,:);
plot(x,T,'LineWidth',1.5),hold on;
plot([0.0006,0.0006],[37,75],'r:','LineWidth',1.5),hold on;
plot([0.0066,0.0066],[37,75],'r:','LineWidth',1.5),hold on;
plot([0.0102,0.0102],[37,75],'r:','LineWidth',1.5),hold on;
axis([0,0.0152,37,75])