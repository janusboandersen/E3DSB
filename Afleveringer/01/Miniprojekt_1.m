%% E3DSB miniprojekt 1 - Tidsdom�neanalyse
%%
% <latex>
% \chapter{Indledning}
% Dette f�rste miniprojekt i E3DSB behandler tre lydsignaler med analyser i tidsdom�net.
% Opgaven er l�st individuelt.
% Dette dokument er genereret i Matlab med en XSL-template.
% Matlab-kode og template findes p� \url{https://github.com/janusboandersen/E3DSB}.
% F�lgende lydklip benyttes \\
% \begin{table}[H]
% \centering
% \begin{tabular}{| c | c | c | c |} \hline
% Signal & Sk�ring & Genre & Samplingsfrekv. \\ \hline
% $s_1$ & Spit Out the Bone & Thrash-metal & 44.1 \si{\kilo\hertz} \\ \hline
% $s_2$ & The Wayfaring Stranger & Bluegrass & 96 \si{\kilo\hertz} \\ \hline
% $s_3$ & Svanes�en & Klassisk & 44.1 \si{\kilo\hertz} \\ \hline
% \end{tabular}\caption{3 signaler behandlet i analysen}\label{tab:lydklip}\end{table}
% </latex>
%%
% <latex>
% \chapter{Analyser}
% F�r analyser ryddes der op i \texttt{Workspace}.\\
% </latex>

clc; clear all; close all;
%% Afspilning af lydklip
%%
% <latex>
% Filen med signaler �bnes med \texttt{load}.
% Signaler kan afspilles med \texttt{soundsc(signal, fs)}.
% Samplingsfrekvensen $f_s$ s�ttes efter v�rdi i tabel~\ref{tab:lydklip}.
% Samplingfrekvenser for de tre signaler er inkluderet i
% \texttt{.mat}-filen.
% </latex>

load('miniprojekt1_lydklip.mat');   % �bn .mat-fil
soundsc(s1, fs_s1);                 % playback startes s�dan her
clear('sound');                     % stop playback

%% Bestemmelse af antal samples
% <latex>
% Et sample er en v�rdi, eller s�t af v�rdier, fra et givent punkt i tid.
% Alle tre signaler er i stereo, s� hver sample har to v�rdier.\\\\
% Signalerne er repr�senteret som $N\times M$-matricer.
% Antallet af r�kker, $N$, repr�senterer antallet af samples.
% $N$ kan findes med \texttt{length(matrix)}.
% Antallet af s�ljer, $M$ er antallet af kanaler.
% $N$ og $M$ kan bestemmes p� en gang via \texttt{[N, M] = size(matrix)}.
% Vi kan ogs� bare benytte, at der er to kanaler, s� $M = 2N$. \\\\
% Data samles i en tabel. Den kan udvides med signalernes afspilningstider.\\\\
% Der er alts� fx 1,323 millioner samples i signal $s_1$.
% Signal $s_2$, som dog har h�jere samplingsfrekvens, har 2,5 gange flere
% samples.
% De tre lydklip har afspilningstider p� mellem 30 og 35 sek.\\\\
% </latex>
%
%%
%
signaler = {'s1'; 's2'; 's3'};
N = [length(s1); length(s2); length(s3)];       % antal samples
M = 2*N;                                        % antal v�rdier
samplingsfrek = [fs_s1; fs_s2; fs_s3];          % f_s fra .mat-fil
tid = N./samplingsfrek;                         % spilletid i sek.
T = table(signaler, N, M, samplingsfrek, tid)   % vis en datatabel

%% Plot af signal
% <latex> 
% N�r vi skal plotte signalerne med en tidsakse i sekunder, bruges det at
% $t = n T_s = \frac{n}{f_s}$. Man b�r plotte et diskret signal i et
% stem-diagram, dvs. \texttt{stem}-funktionen, men for at f� noget mindre
% gnidret at se p�, bruges \texttt{plot}. Til at danne akserne bruges
% Matlabs \texttt{:}-operator.\\\\
% </latex>
%
t1 = [0:1:N(1)-1]'/fs_s1;                   % s�jlevektor, dog ej vigtigt
t2 = [0:1:N(2)-1]'/fs_s2;
t3 = [0:1:N(3)-1]'/fs_s3;

% der g�res lidt arbejde for at f� et rent latex layout
set(groot, 'defaultAxesTickLabelInterpreter','Latex');
set(groot, 'defaultLegendInterpreter','Latex');
set(groot, 'defaultTextInterpreter','Latex');

figure(1)                                   % figur med 3 stablede subplots
subplot(3,1,1);
plot(t1,s1);                                % signal 1
ylabel('$s_1$','Interpreter','Latex', 'FontSize', 15);
subplot(3,1,2);
plot(t2,s2);                                % signal 2
ylabel('$s_2$','Interpreter','Latex', 'FontSize', 15);
subplot(3,1,3);
plot(t3,s3);                                % signal 3
ylabel('$s_3$','Interpreter','Latex', 'FontSize', 15);
xlabel('$t [s]$','Interpreter','Latex', 'FontSize', 15);

% og en titel for hele diagrammet
sgtitle('Plot af $s_1$, $s_2$, $s_3$', 'Interpreter', 'Latex', 'FontSize', 20);

%%
% <latex>
% Plots viser ret tydeligt store forskelle i lydklippenes ``intensitet''.
% Forst�et p� den m�de, at lydklippet med thrash-metal har en gennemg�ende
% h�j amplitude (opleves som ``h�jt''), i mods�tning til fx det klassiske stykke. 
% Nogle ville nok bare mene, at plottet over Metallicas nummer ligner ``st�j'' :-).\\\\
% N�ste analyse kan m�ske give numeriske m�l p� disse visuelle observationer.\\
% </latex>
%
%% Min, max, energi og RMS
% <latex>
% I dette afsnit beregnes forskellige m�l p� signalernes lydm�ssige ``karakter''.\\
% </latex>
%
%% 
% <latex>
% \textbf{Overvejelser:}~ 
% Signalerne er i stereo (2 kanaler / s�jler).
% Hvis vi har et system med to h�jttalere, giver det mening at betragte kanalerne separat (ikke sammenlagt).
% Alts�, jeg analyserer kanalerne i forl�ngelse, som en mono serie med $M=2N$ samples.
% Denne l�sning bruges, fordi det er s�dan et menneske med to �rer og s�t hovedtelefoner ville opleve signalet :-).
% Det er ogs� proportionalt til effekt og energiafs�ttelse i et system med to h�jttalere.\\\\
% En sum eller et gennemsnit p� tv�rs af kanalerne ville betyde, at kanaler
% ude af fase kunne cancellere/eliminere hinanden.
% Dette ville m�ske give mening som en simpel konvertering til mono, dvs. vi
% kunne beregne m�l p� hvad der ville ske i et simpelt mono-system.\\
% </latex>
%%
% <latex>
% \textbf{Beregning:}~ 
% Minimum og maksimum findes med hhv. \texttt{min()}~ og \texttt{max()}.
% I tidsdom�net er effekten af et signal proportionalt til kvadratet p�
% amplituden. For en sekvens $x(n) \in \mathbb{R}$, $n = 0,\ldots,N-1$ 
% defineres effekten som $x_{pwr}(n) = |x(n)|^2 = x(n)^2 $.
% I diskret tid er energien i signalet summen af ``effekterne'', dvs.
% $E_x = \sum_{n=0}^{N-1} |x(n)|^2 $.
% Dette er ogs� det indre produkt $\langle x(n), x(n) \rangle$.
% RMS-v�rdien kan beregnes som kvadratroden af middeleffekten, dvs.
% $x_{RMS} = \sqrt{\frac{1}{N}E_x}$.
% Nu regnes alle serier s� blot over $n = 0, \ldots, 2(N-1)$ jf. overvejelserne ovenfor.\\
% </latex>
%

s1_vec = reshape(s1,[],1);      % Reshape matricer til s�jlevektorer:
s2_vec = reshape(s2,[],1);      % De har nu hver M = 2N r�kker og 1 s�jle
s3_vec = reshape(s3,[],1);      % N, M er selvf�lgelig forskellige for hver

minima = [min(s1_vec); min(s2_vec); min(s3_vec)];
maxima = [max(s1_vec); max(s2_vec); max(s3_vec)];
energi = [sum(s1_vec.^2); sum(s2_vec.^2); sum(s3_vec.^2)];     % kvadratsum
rms = [energi(1)/M(1); energi(2)/M(2); energi(3)/M(3)].^(1/2); % kv.rod

T = table(signaler, N, M, minima, maxima, energi, rms)         % resultater

%%
% Resultaterne (i tabellen) viser det, som plots ogs� illustrerede:
% Der er mere energi i metal end i klassisk og bluegrass :-)
% Og h�jttalerne bliver varmere af at spille Metallica end af Tchaikovsky.
% 
%% Venstre vs. h�jre kanal (for $s_1$)
%
%
%% Nedsampling af signal (for $s_1$)
% 
%
%% Fade-out med envelopes (for $s_2$)
%
%
%%
% <latex>\chapter{Konklusion}</latex>
% 