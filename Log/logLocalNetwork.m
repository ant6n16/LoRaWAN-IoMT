%%%%%%% SCRIPT PARA ANALIZAR LOS DATOS DE LA TX RECOGIDOS EN EL LOG %%%%%%%

% Cargar los datos de la primera conexión con el sensor al lado de la TV:
% Fichero sensor_tv.txt
fid = fopen('sensor_tv.txt');

hora = [];
packet_number = [];
RSSI = [];
SNR = [];
temp = [];

while 1
    tline = fgetl(fid);
    if ~ischar(tline), break, end
    out = regexp(tline, ',', 'split');
    hora = [hora; convertCharsToStrings(out{1}(1:8))];
    packet_number = [packet_number; hex2dec(out{2})];
    RSSI = [RSSI; str2double(out{4})];
    SNR = [SNR; str2double(out{5})];
    temp = [temp; str2double(out{6}(2:end))];
end

separador1 = length(RSSI);
fclose(fid);


% Segunda conexión: Sensor cerca de la estufa
% Fichero sensor_estufa.txt
fid = fopen('sensor_estufa.txt');

while 1
    tline = fgetl(fid);
    if ~ischar(tline), break, end
    out = regexp(tline, ',', 'split');
    hora = [hora; convertCharsToStrings(out{1}(1:8))];
    packet_number = [packet_number; hex2dec(out{2})];
    RSSI = [RSSI; str2double(out{4})];
    SNR = [SNR; str2double(out{5})];
    temp = [temp; str2double(out{6}(2:end))];
end

separador2 = length(RSSI);
fclose(fid);


% Tercera conexión: Sensor estufa doble fase
% Fichero sensor_estufa_doble.txt
fid = fopen('sensor_estufa_doble.txt');

while 1
    tline = fgetl(fid);
    if ~ischar(tline), break, end
    out = regexp(tline, ',', 'split');
    hora = [hora; convertCharsToStrings(out{1}(1:8))];
    packet_number = [packet_number; hex2dec(out{2})];
    RSSI = [RSSI; str2double(out{4})];
    SNR = [SNR; str2double(out{5})];
    temp = [temp; str2double(out{6}(2:end))];
end

separador3 = length(RSSI);
fclose(fid);

% Cuarta conexión: Sensor habitación
% Fichero sensor_habitacion.txt
fid = fopen('sensor_habitacion.txt');

while 1
    tline = fgetl(fid);
    if ~ischar(tline), break, end
    out = regexp(tline, ',', 'split');
    hora = [hora; convertCharsToStrings(out{1}(1:8))];
    packet_number = [packet_number; hex2dec(out{2})];
    RSSI = [RSSI; str2double(out{4})];
    SNR = [SNR; str2double(out{5})];
    temp = [temp; str2double(out{6}(2:end))];
end

separador4 = length(RSSI);
fclose(fid);


% Quinta conexión: Concentrador en la azotea
% Fichero sensor_azotea.txt
fid = fopen('sensor_azotea.txt');

while 1
    tline = fgetl(fid);
    if ~ischar(tline), break, end
    out = regexp(tline, ',', 'split');
    hora = [hora; convertCharsToStrings(out{1}(1:8))];
    packet_number = [packet_number; hex2dec(out{2})];
    RSSI = [RSSI; str2double(out{4})];
    SNR = [SNR; str2double(out{5})];
    temp = [temp; str2double(out{6}(2:end))];
end

separador5 = length(RSSI);
fclose(fid);


% Sexta conexión: Concentrador en el coche
% Fichero sensor_coche.txt
fid = fopen('sensor_coche.txt');

while 1
    tline = fgetl(fid);
    if ~ischar(tline), break, end
    out = regexp(tline, ',', 'split');
    hora = [hora; convertCharsToStrings(out{1}(1:8))];
    packet_number = [packet_number; hex2dec(out{2})];
    RSSI = [RSSI; str2double(out{4})];
    SNR = [SNR; str2double(out{5})];
    temp = [temp; str2double(out{6}(2:end))];
end

separador6 = length(RSSI);
fclose(fid);

%% Representar temepratura recibida separada en los diferentes tramos 
figure, 
t = datetime(hora);
plot(t(1:separador1),temp(1:separador1),'c','LineWidth',1.5), ylim([min(temp)-1, max(temp)+1]), grid on
hold on
plot(t(separador1+1:separador2),temp(separador1+1:separador2),'m','LineWidth',1.5)
plot(t(separador2+1:separador3),temp(separador2+1:separador3),'r','LineWidth',1.5)
plot(t(separador3+1:separador4),temp(separador3+1:separador4),'k','LineWidth',1.5)
plot(t(separador4+1:separador5),temp(separador4+1:separador5),'g','LineWidth',1.5)
plot(t(separador5+1:separador6),temp(separador5+1:separador6),'b','LineWidth',1.5)
legend('Sensor Cerca','Sensor Estufa','Sensor Estufa Doble','Sensor Habitacion','Concentrador Azotea', 'Concentrador Coche')
xlabel('Hora','FontSize',15), ylabel('Temperatura ºC','FontSize',15)
title('Temperatura medida en cada comunicación')


%% Representar RSSI y SNR 

figure,
t = datetime(hora);
plot(t(1:separador1),SNR(1:separador1),'c','LineWidth',2), ylim([min(SNR)-1, max(SNR)+1]), grid on
hold on
plot(t(separador1+1:separador2),SNR(separador1+1:separador2),'m','LineWidth',2)
plot(t(separador2+1:separador3),SNR(separador2+1:separador3),'r','LineWidth',2)
plot(t(separador3+1:separador4),SNR(separador3+1:separador4),'k','LineWidth',2)
plot(t(separador4+1:separador5),SNR(separador4+1:separador5),'g','LineWidth',2)
plot(t(separador5+1:separador6),SNR(separador5+1:separador6),'b','LineWidth',2)
xlabel('Hora','FontSize',15), ylabel('SNR','FontSize',15)
title('Temperatura medida en cada comunicación')

hold on
yyaxis right, ylim([min(RSSI)-1, max(RSSI)+1])
plot(t(1:separador1),RSSI(1:separador1),':','LineWidth',2.5)
plot(t(separador1+1:separador2),RSSI(separador1+1:separador2),':','LineWidth',2.5)
plot(t(separador2+1:separador3),RSSI(separador2+1:separador3),':','LineWidth',2.5)
plot(t(separador3+1:separador4),RSSI(separador3+1:separador4),':','LineWidth',2.5)
plot(t(separador4+1:separador5),RSSI(separador4+1:separador5),':','LineWidth',2.5)
plot(t(separador5+1:separador6),RSSI(separador5+1:separador6),':','LineWidth',2.5)
ylabel('RSSI','FontSize',15)
title('SNR y RSSI en cada comunicación')
 
legend('SNR Sensor Cerca','SNR Sensor Estufa','SNR Sensor Estufa Doble', ...
    'SNR Sensor Habitacion','SNR Concentrador Azotea', ...
    'SNR Concentrador Coche','RSSI de cada tramo')


%% Representar numeración de los paquetes recibidos

figure, hold on, grid on, ylim([min(packet_number), max(packet_number)+1])
stem(t(1:separador1),packet_number(1:separador1),':','LineWidth',2.5)
stem(t(separador1+1:separador2),packet_number(separador1+1:separador2),':','LineWidth',2)
stem(t(separador2+1:separador3),packet_number(separador2+1:separador3),':','LineWidth',2)
stem(t(separador3+1:separador4),packet_number(separador3+1:separador4),':','LineWidth',2)
stem(t(separador4+1:separador5),packet_number(separador4+1:separador5),':','LineWidth',2)
stem(t(separador5+1:separador6),packet_number(separador5+1:separador6),':','LineWidth',2)

legend('Sensor Cerca','Sensor Estufa','Sensor Estufa Doble', ...
    'Sensor Habitacion','Concentrador Azotea', ...
    'Concentrador Coche')
title('Numeración de los paquetes en cada tramo')

