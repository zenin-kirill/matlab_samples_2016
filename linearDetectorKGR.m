%% Моделирование зависимости Vout(Rx)

Vp = 4000;
Vop = 100;
Rx = 1:1:2000;

figure;
hold on;
grid on;
i = 0;
summaryLegend = {};

colors = ['r','b','g','k','c','m'];

for Re = 68
    Vout = Vop * (1 + (Rx/Re));
    plot(Rx, Vout, colors(rem(i, 6)+1));
    summaryLegend(i+1) = cellstr(['Re = ',int2str(Re)]);
    i = i + 1;
end

line([0 2000],[0 0],'color','black','LineWidth',3)
line([0 2000],[3200 3200],'color','black','LineWidth',3)

title ('График зависимости выходного напряжения от сопротивления кожи');

xlabel('Rx, кОм');
ylabel('Uout, мВ');

legend(summaryLegend);

axis([0 2000 0 4000]);


%% Моделирвоание работы АЦП определенной разрядности
%  на определенном диапазоне напряжений

Vp = 4000;
Nr = 12;
N = 2 ^ Nr;
double dv;

dV = Vp / N;

figure;
hold on;
grid on;

i = 0;
colors = ['r','b','g','k','c','m'];

for v = 0 : dV : Vp
    line([0 1],[v v],'Color',colors(rem(i, 6)+1));
    i = i + 1;
end

axis([0 1 0 100]);

title ('Шкала шагов квантования АЦП');

xlabel('-');
ylabel('Uout, мВ');

disp(['Разрешение АЦП = ', num2str(dV), ' мВ']);
disp(['Шагов квантования АЦП = ', int2str(N), ' шт']);


%% Моделирование процесса измерения диапазона Vout 
%  заданного верхней и нижней границей диапазона (мВ)

Vup = 750;
Vdown = 100;

Vp = 4000;
Nr = 12;
N = 2 ^ Nr;

double dv;
dV = Vp / N;
Nreal = (Vup - Vdown)/dV;

figure;
hold on;
grid on;

for v = 0 : dV : Vdown
    line([0 1],[v v],'Color',[0.9 0.9 0.9]);
end

for v = Vdown : dV : Vup
    line([0 1],[v v],'Color','red');
end

for v = Vup : dV : Vp
    line([0 1],[v v],'Color',[0.9 0.9 0.9]);
end
axis([0 1 0 Vp]);

title ('Шкала покрытия квантами АЦП диапазона величин сигнала');

xlabel('-');
ylabel('Uout, мВ');

disp(['Разрешение АЦП = ', num2str(dV), ' мВ']);
disp(['Шагов квантования АЦП = ', int2str(N), ' шт']);
disp(['Шагов квантования АЦП для заданного диапазона величин сигнала = ', int2str(Nreal), ' шт']);


%% Вычисление Re при граничных значениях параметров Vout и Rx

Vout = 3.2;
Vop = 0.1;
Rx = 2000;

Re = (Vop * Rx)/(Vout - Vop)

%% Вычисление Vout при заданных остальных параметрах

Vop = 0.1;
Rx = 2000;
Re = 68;

Vout = Vop * (1 + (Rx/Re))