%% Exercises week 35 Thursday
% E3DSB, Janus Bo Andersen, 2019
format compact;

%% DSB Exercise 1.4
% Make a sinewave with $f_0 = 500$ Hz. amplitude $2.5$, phase $120\degr$
% and a DC-offset of $1$. Call it $s_3[n]$. Time duration must be $1$ sec,
% and the sampling frequncy should be $4$ kHz.

clear all; close all; clc;

% Given values
f03 = 500; %Hz
A = 2.5;
phi = 2*pi*120/360; % 120 deg.
dc_offset = 1;
Tdur = 1
fs3 = 4e3; %Hz
Ts3 = 1/fs3;

% Compute the number of samples and make sample vector
N3 = Tdur/Ts3;
n3 = 0:(N3-1);

% Build discrete signal
s3 = A*sin(2*pi*f03/fs3*n3 + phi) + dc_offset;

% Recreate the signal from ex. 1.3
f02 = 350; %Hz
fs2 = 4000;       % Sampling freq 2: 4 kHz
Ts2 = 1/fs2;      % Sampling time in sec
N2 = Tdur / Ts2;
n2 = 0:(N2-1);    % Sample point vector
s2 = sin(2*pi*f02/fs2*n2);

% Sum of the signals -- only OK because fs2 == fs3 and N2 == N3.
s_sum = s2 + s3;

% Show the signal
stem(n3, s3);
xlim([0 40]);
hold on
stem(n2, s2);
stem(n2, s_sum);
legend('s_3', 's_2', 's_2 + s_3', 'location', 'best')
grid on;
hold off

figure(2)
plot(n3*Ts3, s_sum);
xlim([0 0.10])

%%
% Try to play the sounds from the sum
fs = 4e3;
soundsc(s_sum, fs);