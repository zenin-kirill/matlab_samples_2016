    function [numin] = getSignalFrequence(s, l, fd, fmin, fmax)
    %% ���������
    Signal=s;   % ������ �������
    Tm=l;     % ����� ������� (����)
    Fd=fd;      % ������� ������������� (��)
    FftL=1024;  % ���������� ����� ����� �������

    %% ��������� ������� ��������
    T=0:1:Tm-1;             % ������ �������� �������
    F=0:Fd/FftL:Fd/2-1/FftL;% ������ ������ ������������ ������� �����

    %% ������������ ������������� �������
    FftS=abs(fft(Signal,FftL)); % ��������� �������������� ����� �������
    FftS=2*FftS./FftL;          % ���������� ������� �� ���������
    %FftS(1)=FftS(1)/2;          % ���������� ���������� ������������ � �������
    %% ���������� �������� ������� � ���./60�.


    maxfreq = 0;
    maxval = 0;

    for i=1:1:length(F)
        if (F(i) > fmin && F(i) < fmax && FftS(i) > maxval)
            maxfreq = F(i);
            maxval = FftS(i);
        end
    end

    numin = maxfreq * 60;
    end
