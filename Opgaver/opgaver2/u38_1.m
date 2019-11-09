%% E3DSB opgaver uge 38/1
% DFT m.m., Janus Bo Andersen Sep 2019

%% Opg. 2.1
% Samplet digitalt signal transformeres med DFT
clear all; close all; clc;

x = [0 1/sqrt(2) 1 1/sqrt(2) 0 -1/sqrt(2) -1 -1/sqrt(2)]';
stem(x)

% Beregn antal observationer
N = length(x);
n = (0:N-1)';

% Beregn 8-punkts-DFT i hånden
X = zeros(N,1);     % initialisér

% beregn DFT
for k=0:N-1
    wk = exp(j*2*pi/N*k*n); % Fourier basisvektor
    X(k+1) = x' * conj(wk); % DFT X(k) = <x, w_k> (inner product)
end

% Afrunding
X = round(X, 6);

% Relativt amplitudespektrum
k = n;
figure(1)
subplot(2,1,1);
stem(k, abs(X)); xlim([0 N]); grid on;

% Fasespektrum
subplot(2,1,2);
stem(k, angle(X)*180/pi); xlim([0 N]); grid on;

%% Opg. 2.2
% Beregn for signal x(n)=sin(2*pi/N*n), med N=8
clear all; close all;

N = 8;
n = (0:N-1)';
x = sin(2*pi/N*n);      % sampling af kontinuert signal

% Beregn DFT med Matlabs FFT-funktion:
X = fft(x);

% Afrunding
X = round(X, 6);

% Relativt amplitudespektrum fra k=0 til N/2
k = n;
figure(1)
subplot(3,1,1);
stem(k, abs(X)); xlim([0 N/2]); grid on; ylabel('amplitude');

% Skaleret amplitudespektrum
subplot(3,1,2);
stem(k, 2*abs(X)/N); xlim([0 N/2]); grid on; ylabel('skaleret amplitude');

% Fasespektrum fra k=0 til N/2
subplot(3,1,3);
stem(k, angle(X)*180/pi); xlim([0 N/2]); grid on; ylabel('fase');
xlabel('frekvens k');

%% Opg. 3.5 fra Lyons
% Determine the magnitudes of the 8-point DFT samples for the 3 signals
clear all; close all;

N = 8;

x1 = [9 9 9 9 9 9 9 9]';
x2 = [1 0 0 0 0 0 0 0]';
x3 = [0 1 0 0 0 0 0 0]';

% Signal 1 is a DC with A=9, so it should show a X(0) = N*A = 72.
A = 9; X_0 = N*A;
X1 = fft(x1); abs(X1(1))

% Signal 2 is an impulse, and an impulse contains an equal amount of
% "all frequencies", so X should be a vector of equal magnitudes
X2 = fft(x2); abs(X2)

% Signal 3 is an impulse, but it is shifted. Same response in terms of
% magnitudes (phases would be different though). DFT shift theorem.
X3 = fft(x3); abs(X3)