function [ T ] = skinT( ah1,ah2 )
%skinT 已知 h1,h2 求皮肤表面的温度
% h1 是外界与衣服最外层的对流传热系数
% h2 是空气层与皮肤的对流传热系数
% T 是皮肤的温度
rho=[300,862,74.2,1.18]; %离散格式中的字母替代常数的设置
c=[1377,2100,1726,1005];
lam=[0.082,0.37,0.045,0.028];
x=[0.0006,0.006,0.0036,0.00]; %每层的宽度
dx=[0.0001,0.001,0.0006,0.001]; %空间步长
dt=0.002; %时间步长
Tout=75;Tin=37; %初始温度
LEN1=int8(x(1)/dx(1))+1; %记录每段接触点的位置
LEN2=LEN1+x(2)/dx(2);
LEN3=LEN2+x(3)/dx(3);
LEN4=LEN3+x(4)/dx(4);
T=zeros(5400/dt,LEN4);
T(1,:)=37; %第 0 秒设置所有点的温度是 37
h1=113;h2=8.344; %设置对流交换系数
for n=1:5400/dt-1
 unknow=(h1*(Tout-T(n,1))-lam(1)*(T(n,1)-T(n,2))/dx(1))*dt/(0.5*dx(1)*rho(1)*c(1))+T(n,1);
 T(n+1,1)=unknow;
 for i=2:LEN1 
 if i>=2&&i<=LEN1-1
 unknow=lam(1)*(T(n,i+1)-2*T(n,i)+T(n,i-1))/dx(1)*dt/(dx(1)*rho(1)*c(1))+T(n,i); 
 T(n+1,i)=unknow;
 elseif i==LEN1 
 unknow=(lam(2)*(T(n,i+1)-T(n,i))/dx(2)+lam(1)*(T(n,i-1)-T(n,i))/dx(1))*...
 dt/(0.5*(dx(1)*rho(1)*c(1)+dx(2)*rho(2)*c(2)))+T(n,i);
 T(n+1,i)=unknow;
 end
 end
 for i=LEN1+1:LEN2
     if i>=LEN1+1&&i<=LEN2-1
 unknow=lam(2)*(T(n,i+1)-2*T(n,i)+T(n,i-1))/dx(2)*dt/(dx(2)*rho(2)*c(2))+T(n,i); 
 T(n+1,i)=unknow;
 elseif i==LEN2
 unknow=(lam(3)*(T(n,i+1)-T(n,i))/dx(3)+lam(2)*(T(n,i-1)-T(n,i))/dx(2))*...
 dt/(0.5*(dx(2)*rho(2)*c(2)+dx(3)*rho(3)*c(3)))+T(n,i);
 T(n+1,i)=unknow;
 end
 end
 for i=LEN2+1:LEN3 
 if i>=LEN2+1&&i<=LEN3-1
 unknow=lam(3)*(T(n,i+1)-2*T(n,i)+T(n,i-1))/dx(3)*dt/(dx(3)*rho(3)*c(3))+T(n,i); 
 T(n+1,i)=unknow;
 elseif i==LEN3
 unknow=(lam(4)*(T(n,i+1)-T(n,i))/dx(4)+lam(3)*(T(n,i-1)-T(n,i))/dx(3))*...
 dt/(0.5*(dx(3)*rho(3)*c(3)+dx(4)*rho(4)*c(4)))+T(n,i);
 T(n+1,i)=unknow;
 end
 end
 for i=LEN3+1:LEN4 
 if i>=LEN3+1&&i<=LEN4-1
 unknow=lam(4)*(T(n,i+1)-2*T(n,i)+T(n,i-1))/dx(4)*dt/(dx(4)*rho(4)*c(4))+T(n,i); 
 T(n+1,i)=unknow;
 elseif i==LEN4
 unknow=(lam(4)*(T(n,LEN4-1)-T(n,LEN4))/dx(4)-h2*(T(n,LEN4)-Tin))*...
 dt/(0.5*dx(4)*rho(4)*c(4))+T(n,LEN4);
 T(n+1,i)=unknow;
 end
 end
end
T=T(:,LEN4);
T=T(1:500:5400/dt);
end