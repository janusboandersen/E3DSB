%% Opgave 1.7
% Eksponentielt aftagende signal - "ding-lyd"
% KPL 2019-09-10
clear; close all

fs = 44100;   % Hz
f0 = 440;     % Hz
Tdur = 2;     % varighed ("duration") 2 sekunder
N  = Tdur*fs; % samples svarende til 2 sekunder
n  = 0:N-1;
t  = n/fs;

% Firkantsignal med f�rste tre harmoniske (kun de ulige harm.):
x =     sin(2*pi*1*f0/fs*n) + ...
    1/3*sin(2*pi*3*f0/fs*n) + ...
    1/5*sin(2*pi*5*f0/fs*n);

% Envelope
env = exp(-n*5/N); 

xe = x.*env;

figure
plot(t,xe,...
     t,env,...
     t,-env,...
     'LineWidth',2)
xlim([0 Tdur])
legend('Eksponentielt aftagende signal','Envelope','-Envelope',...
       'location','NorthEast')
xlabel('t [s]')
   
sound(xe,fs)

audiowrite('expding.wav',xe,fs)

%% Opgave 1.9
% Benytter LFO til at lave vibrato
% Lav et 5 Hz square wave

LFO = square(2*pi*5*t);

% Paatryk LFO p� oprindeligt signal
z = x.*LFO;
sound(z, fs)