x=[1 2 3 4 5 6 7];
y1=[4.55E+05 7.83E+05 9.53E+05 9.80E+05 7.91E+05 5.75E+05 3.59E+05
];

y2 = [4.55E+05 7.83E+05 9.53E+05 9.80E+05 7.91E+05 5.75E+05 3.59E+05
];

plot(x, y1, 'ok-', 'linewidth', 1.1, 'markerfacecolor', [36, 169, 225]/255)
hold on
plot(x, y2, 'ok-', 'linewidth', 1.1, 'markerfacecolor', [29, 191, 151]/255)
xlim([0 8])
ylim([1E+05 1E+06])
xlabel('试探点位置')
ylabel('应力大小 (N/m^2)')
legend('普通下底应力')