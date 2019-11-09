%% Opgaver uge 35, tirsdag
% E3DSB, Janus Bo Andersen, 29. aug. 2019
format compact;

%% Opgave 1.1
% Lav i Matlab en diskret tidsvektor, $n$, med heltalsvaerdier fra $0$ til $N-1$.
% $N=100$. Brug kolonoperatoren i Matlab: |n=0:N-1|. Brug $n$ til at lave
% signalet:
%
% $$x_1 = sin(\frac{2\pi}{N}n)$$
% 
% Plot sinussen og beskriv hvad du ser. Brug |plot(n,x1)|. Lav nu et andet signal:
%
% $$x_2=2cos(3\frac{2\pi}{N}n)$$
%
% og plot signalet i samme figur som $x_1$.

% Figuren viser to sinusfunktioner med to forskellige amplituder og
% periodetider (vinkelfrekvenser).

clc; clear all; close;

N = 100;
n = 1:N-1;
x1 = sin(2*pi/N*n);
x2 = 2*cos(2*pi*3/N*n);

figure(1)
hold on
grid on
plot(n,x1);
plot(n,x2);
xlim([0,N])
hold off

%% Opgave 1.2
% Lav i Matlab en sampletidsakse, $t$. Varigheden (laengden) skal vaere 0,5
% sekunder og samplingstiden skal vaere Ts=0,0025 sekunder.
% Hvad er samplingfrekvensen, Fs? Hvor mange samples bliver der?
%
% Lad
%
% $$t = \left( 0, 0.0025, 0.0050, \dots, 0.5 \right)$$
%
% og definer saaledes
%
% $$T_s = \frac{1}{400} = 0.0025 \textrm{ [s]} $$
%
% og derfor
% 
% $$f_s = \frac{1}{T_s} = 400 \textrm{ [Hz]} $$
%
% Der bliver derfor $n=f_s \cdot t_{max} + 1 = 400 \cdot 0.5 + 1 = 201$
% samples. Der tillaegges $1$ fordi 0 inkluderes.

clc; clear all; close all;
t_min = 0;      % sec
t_max = 0.5;    % sec
Ts = 1/400;     % sec
fs = 1/Ts;      % Hz
t = t_min:1/400:t_max; % samplingstidsakse

%% Opgave 1.3
% a. Lav en sinuskurve med frekvensen f0=350 Hz. Kald den s1[n]. Varigheden
% skal vaere 1 sekund, og samplingfrekvensen skal vaere 1 kHz.
% Hvor mange samples bliver der?
% 
% b. Lav en sinuskurve med frekvensen f0=350 Hz. Kald den s2[n]. Varigheden
% skal vaere 1 sekund, og samplingfrekvensen skal vaere 4 kHz.
% Hvor mange samples bliver der?
%
% c. Hvad er forskellen mellem de to signaler? Er der forskel?

clear all; close all; clc;

Tdur = 1;      % Duration of signal in sec (also called Tdur)
f0 = 350;       % sine curve base frequency in Hz

% All the sampling stuff
% Sampling 1
fs1 = 1000;        % Sampling freq 1: 1 kHz
Ts1 = 1/fs1;       % Sampling time in sec
N1 = Tdur / Ts1;   % Number of samples
n1 = 0:(N1-1);     % Sample point vector
%t1 = n1 * Ts1;     % Sampling time axis

% Sampling 2
fs2 = 4000;       % Sampling freq 2: 4 kHz
Ts2 = 1/fs2;      % Sampling time in sec
N2 = Tdur / Ts2;
n2 = 0:(N2-1);    % Sample point vector
%t2 = n2 * Ts2;    % Sampling time axis

% Building the signals
s1 = sin(2*pi*f0/fs1*n1);    % Create the signal s1
s2 = sin(2*pi*f0/fs2*n2);    % Create the signal s2


% Question a and b:
txt = sprintf("Samples in s1: %d, s2: %d", N1, N2);
disp(txt)


% Question c:
% Let's take a look and compare s1 and s2
figure(1)
stem(n1*Ts1, s1, '-.or')
hold on
stem(n2*Ts2, s2, 'xb')

xlim([0 0.010])
ylabel('$\sin(2\pi \frac{f_0}{f_{s1}} n_1)$', 'Interpreter', 'latex', 'FontSize', 18)
xlabel('$n$', 'Interpreter', 'latex', 'FontSize', 18)
hold off

% So these are the same signals, sampled at different frequencies.

%% Lyons exercise 2.4
% Consider a continuous time-domain sinewave, whose cyclic frequency is 500
% Hz defined by
%
% $$ x(t) = cos(2\pi(500)t + \frac{\pi}{7}) $$
%
% Write thte equation for the discrete $x(n)$ sinewave sequence that
% results from sampling $x(t)$ at an $f_s$ sample rate of 4000 Hz.
%
% The sampling time is $T_s = \frac{1}{f_s}$ with sample steps being 
% $n={0, 1, 2, \ldots}$, so then $n_i T_s$ represents each time step, and
% thus
%
% $$ x(n) = cos(2\pi(500)n T_s + \frac{\pi}{7}) $$
%
% Which is equivalent to 
%
% $$ x(n) = cos(2\pi\frac{500}{f_s}n + \frac{\pi}{7}) $$
%
% As $\frac{500}{4000}=0.125$ we get
%
% $$ x(n) = cos(2\pi(0.125)n + \frac{\pi}{7}) $$
%