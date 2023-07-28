x = [1 2 3 4 5 6 7 8];
temp_high = [1.90E+05 2.59E+05 2.65E+05 2.55E+05 2.18E+05 1.64E+05 1.12E+05 3.73E+04
]; 
w1 = 0.5; 
bar(x,temp_high,w1,'FaceColor',[0.2 0.2 0.5])

temp_low = [3.76E+05 7.07E+05 8.51E+05 1.01E+06 7.51E+05 6.17E+05 5.53E+05 3.68E+05
];
w2 = .25;
hold on
bar(x,temp_low,w2,'FaceColor',[0 0.7 0.7])
hold off

grid on
ylabel('N/m^2')
legend({'碳板鞋下底应力','无碳板鞋下底应力'},'Location','northwest')

ax = gca;
ax.XTick = [1 2 3 4 5 6 7 8]; 
ax.XTickLabels = {'鞋前1','鞋前2','鞋中1','鞋中2','鞋中3','鞋后1','鞋后2','鞋侧1'};
ax.XTickLabelRotation = 45;