%% E3DSB miniprojekt 1 - Tidsdomæneanalyse
%%
% <latex>
% \chapter{Indledning}
% Dette første miniprojekt i E3DSB behandler tre lydsignaler med analyser i tidsdomænet.
% Opgaven er løst individuelt.
% Dette dokument er genereret i Matlab med en XSL-template.
% Matlab-kode og template findes på \url{https://github.com/janusboandersen/E3DSB}.
% Følgende lydklip benyttes \\
% \begin{table}[H]
% \centering
% \begin{tabular}{| c | c | c | c |} \hline
% Signal & Skæring & Genre & Samplingsfrekv. \\ \hline
% $s_1$ & Spit Out the Bone & Thrash-metal & 44.1 \si{\kilo\hertz} \\ \hline
% $s_2$ & The Wayfaring Stranger & Bluegrass & 96 \si{\kilo\hertz} \\ \hline
% $s_3$ & Svanesøen & Klassisk & 44.1 \si{\kilo\hertz} \\ \hline
% \end{tabular}\caption{3 signaler behandlet i analysen}\label{tab:lydklip}\end{table}
% </latex>
%%
% <latex>
% \chapter{Analyser}
% Før analyser ryddes der op i \texttt{Workspace}.\\
% </latex>

clc; clear('all'); close('all');
%% Afspilning af lydklip
%%
% <latex>
% Filen med signaler åbnes med \texttt{load}.
% Signaler kan afspilles med \texttt{soundsc(signal, fs)}.
% Samplingsfrekvensen $f_s$ sættes efter værdi i tabel~\ref{tab:lydklip}.
% Samplingfrekvenser for de tre signaler er inkluderet i
% \texttt{.mat}-filen.
% </latex>

load('miniprojekt1_lydklip.mat');
soundsc(s1, fs_s1);
clear('sound');

%% Bestemmelse af antal samples
%
%
%% Plot af signal
%
%
%% Min, max, RMS og energi
%
%
%% Venstre vs. højre kanal (for $s_1$)
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