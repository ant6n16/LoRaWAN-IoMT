%%%%%%%%%%%%% SCRIPT TO ANALYZE ALL THE TX DATA STORED IN LOG %%%%%%%%%%%%%

% Load the data of the first connection: sensor next to TV
% File sensor_tv.txt
fid = fopen('Log/sensor_tv.txt');

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


% Second connection: Sensor close to stove
% File sensor_estufa.txt
fid = fopen('Log/sensor_estufa.txt');

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


% Third connection: Sensor close to stove, double power
% File sensor_estufa_doble.txt
fid = fopen('Log/sensor_estufa_doble.txt');

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

% Fourth connection: Sensor in room
% File sensor_habitacion.txt
fid = fopen('Log/sensor_habitacion.txt');

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

% Fifth connection: Hub at rooftop
% File sensor_azotea.txt
fid = fopen('Log/sensor_azotea.txt');

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


% Sixth connection: Hub in the car
% File sensor_coche.txt
fid = fopen('Log/sensor_coche.txt');

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

%% Plot received temperature in the different stretches
figure, 
t = datetime(hora);
plot(t(1:separador1),temp(1:separador1),'c','LineWidth',1.5), ylim([min(temp)-1, max(temp)+1]), grid on
hold on
plot(t(separador1+1:separador2),temp(separador1+1:separador2),'m','LineWidth',1.5)
plot(t(separador2+1:separador3),temp(separador2+1:separador3),'r','LineWidth',1.5)
plot(t(separador3+1:separador4),temp(separador3+1:separador4),'k','LineWidth',1.5)
plot(t(separador4+1:separador5),temp(separador4+1:separador5),'g','LineWidth',1.5)
plot(t(separador5+1:separador6),temp(separador5+1:separador6),'b','LineWidth',1.5)
legend('Sensor close','Sensor Stove','Sensor Stove Double','Sensor Room','Hub Rooftop', 'Hub Car')
xlabel('Time','FontSize',15), ylabel('Temp. ºC','FontSize',15)
title('Measured temperature in each communication')


%% Plot RSSI and SNR 

figure,
t = datetime(hora);
plot(t(1:separador1),SNR(1:separador1),'c','LineWidth',2), ylim([min(SNR)-1, max(SNR)+1]), grid on
hold on
plot(t(separador1+1:separador2),SNR(separador1+1:separador2),'m','LineWidth',2)
plot(t(separador2+1:separador3),SNR(separador2+1:separador3),'r','LineWidth',2)
plot(t(separador3+1:separador4),SNR(separador3+1:separador4),'k','LineWidth',2)
plot(t(separador4+1:separador5),SNR(separador4+1:separador5),'g','LineWidth',2)
plot(t(separador5+1:separador6),SNR(separador5+1:separador6),'b','LineWidth',2)
xlabel('Time','FontSize',15), ylabel('SNR','FontSize',15)
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
title('SNR and RSSI in each communication')
 
legend('SNR Sensor close','SNR Sensor Stove','SNR Stove Double', ...
    'SNR Sensor Room','SNR Hub Rooftop', ...
    'SNR Hub Car','RSSI in each stretch')


%% Plot recived packet numbers

figure, hold on, grid on, ylim([min(packet_number), max(packet_number)+1])
stem(t(1:separador1),packet_number(1:separador1),':','LineWidth',2.5)
stem(t(separador1+1:separador2),packet_number(separador1+1:separador2),':','LineWidth',2)
stem(t(separador2+1:separador3),packet_number(separador2+1:separador3),':','LineWidth',2)
stem(t(separador3+1:separador4),packet_number(separador3+1:separador4),':','LineWidth',2)
stem(t(separador4+1:separador5),packet_number(separador4+1:separador5),':','LineWidth',2)
stem(t(separador5+1:separador6),packet_number(separador5+1:separador6),':','LineWidth',2)

legend('SNR Sensor close','SNR Sensor Stove','SNR Stove Double', ...
    'SNR Sensor Room','SNR Hub Rooftop', ...
    'SNR Hub Car')
title('Packet numbers in each stretch')

