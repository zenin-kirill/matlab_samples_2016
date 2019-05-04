%% ������������� ����������� Vout(Rx)

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

title ('������ ����������� ��������� ���������� �� ������������� ����');

xlabel('Rx, ���');
ylabel('Uout, ��');

legend(summaryLegend);

axis([0 2000 0 4000]);


%% ������������� ������ ��� ������������ �����������
%  �� ������������ ��������� ����������

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

title ('����� ����� ����������� ���');

xlabel('-');
ylabel('Uout, ��');

disp(['���������� ��� = ', num2str(dV), ' ��']);
disp(['����� ����������� ��� = ', int2str(N), ' ��']);


%% ������������� �������� ��������� ��������� Vout 
%  ��������� ������� � ������ �������� ��������� (��)

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

title ('����� �������� �������� ��� ��������� ������� �������');

xlabel('-');
ylabel('Uout, ��');

disp(['���������� ��� = ', num2str(dV), ' ��']);
disp(['����� ����������� ��� = ', int2str(N), ' ��']);
disp(['����� ����������� ��� ��� ��������� ��������� ������� ������� = ', int2str(Nreal), ' ��']);


%% ���������� Re ��� ��������� ��������� ���������� Vout � Rx

Vout = 3.2;
Vop = 0.1;
Rx = 2000;

Re = (Vop * Rx)/(Vout - Vop)

%% ���������� Vout ��� �������� ��������� ����������

Vop = 0.1;
Rx = 2000;
Re = 68;

Vout = Vop * (1 + (Rx/Re))