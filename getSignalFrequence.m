    function [numin] = getSignalFrequence(s, l, fd, fmin, fmax)
    %% Параметры
    Signal=s;   % Массив сигнала
    Tm=l;     % Длина сигнала (отсч)
    Fd=fd;      % Частота дискретизации (Гц)
    FftL=1024;  % Количество линий Фурье спектра

    %% Генерация рабочих массивов
    T=0:1:Tm-1;             % Массив отсчетов времени
    F=0:Fd/FftL:Fd/2-1/FftL;% Массив частот вычисляемого спектра Фурье

    %% Спектральное представление сигнала
    FftS=abs(fft(Signal,FftL)); % Амплитуды преобразования Фурье сигнала
    FftS=2*FftS./FftL;          % Нормировка спектра по амплитуде
    %FftS(1)=FftS(1)/2;          % Нормировка постоянной составляющей в спектре
    %% Вычисление полезной частоты в кол./60с.


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
