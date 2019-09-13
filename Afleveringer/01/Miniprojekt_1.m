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

clc; clear('all'); close('all');
%% Afspilning af lydklip
%%
% <latex>
% Filen med signaler �bnes med \texttt{load}.
% Signaler kan afspilles med \texttt{soundsc(signal, fs)}.
% Samplingsfrekvensen $f_s$ s�ttes efter v�rdi i tabel~\ref{tab:lydklip}.
% Samplingfrekvenser for de tre signaler er inkluderet i
% \texttt{.mat}-filen.
% </latex>

load('miniprojekt1_lydklip.mat');
soundsc(s1, fs_s1); %playback
clear('sound'); %stop playback

%% Bestemmelse af antal samples
%
%
%% Plot af signal
%
%
%% Min, max, RMS og energi
% <latex>
% Signalerne er i stereo (2 kanaler / kolonner).
% Hvis vi har et system med to h�jttalere, giver det mening at betragte
% kanalerne separat.
% Alts� vi ser kanalerne i forl�ngelse, som en mono serie med $M=2N$
% samples. Denne l�sning bruges, fordi det er s�dan et menneske med to �rer 
% og s�t hovedtelefoner ville opleve signalet :-) \\\\
% En sum eller et gennemsnit p� tv�rs af kanalerne ville betyde, at kanaler
% ude af fase kunne eliminere hinanden.
% Dette ville give mening som en simpel konvertering til mono, dvs. vi
% kunne beregne m�l p� hvad der ville ske i et simpelt mono-system.\\\\
% \textbf{Beregning:}~ Minimum og maksimum findes nemt med hhv. \texttt{min}~ og \texttt{max}.
% I tidsdom�net er effekten af et signal proportionalt til kvadratet p�
% amplituden. For en sekvens $x(n) \in \mathbb{R}$, $n = 0,\ldots,N-1$ 
% defineres $x_{pwr}(n) = |x(n)|^2 = x(n)^2 $.
% I diskret tid er energien i signalet summen af ``effekterne'', dvs.
% $E_x = \sum_{n=0}^{N-1} |x(n)|^2 $. Dette er ogs� det indre produkt <x(n), x(n)>.
% RMS-v�rdien kan s� beregnes som kvadratroden af middeleffekten, dvs.
% $x_{RMS} = \sqrt{\frac{1}{N}E_x}$.\\\\
% </latex>
%
signaler = {'s1'; 's2'; 's3'};
N = [length(s1); length(s2); length(s3)]; % antal diskrete tidsobservat.
M = 2*N;               % beregn samlet antal af datapunkter ~ m�linger

s1_vec = reshape(s1,1,[]); %reshape matricer til s�jlevektorer
s2_vec = reshape(s2,1,[]);
s3_vec = reshape(s3,1,[]);

minima = [min(s1_vec); min(s2_vec); min(s3_vec)];
maxima = [max(s1_vec); max(s2_vec); max(s3_vec)];
energi = [sum(s1_vec.^2); sum(s2_vec.^2); sum(s3_vec.^2)]; % kvadratsum
rms = [energi(1)/M(1); energi(2)/M(2); energi(3)/M(3)].^(1/2);

T = table(signaler, N, M, minima, maxima, energi, rms) % resultater

%%
% Resultaterne (i tabellen) viser de �nskede m�l p� signalerne. Energien
% kunne ogs� v�re beregnet som 
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