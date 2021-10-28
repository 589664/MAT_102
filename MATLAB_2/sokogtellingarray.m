% Dette scriptet demonstrerer nokre metodar for å søke etter verdiar i ein
% array, og telle førekomstar av ein gitt verdi i ein array.

clear all           % Tømme minne
clc                 % Fjerne innhald i workspace
format compact      % Kompakt utskrift i workspace

I  = [1 5 2 4 1];                           % Array med tal.
C  = ['m' 'a' 't' 'l' 'a' 'b'];             % Array med char

% Eksempel 1: Søke etter element i ein array
B = I == 1              % Returnerer ein logisk array B der verdien er 1 (sann) 
                        % for elementa som er lik 1, og 0 (usann) for resten.
F = find(I == 1)        % Returnerer indexane til elementa i array I som har verdien 1.
n = numel(find(I==1))   % Antall element i I som har verdien 1.
u = numel(find(C=='a')) % Finner og teller bokstaven 'a' i C.

% Telling i chararray.
m = count(C,'a')        % Teller antall a'ar i chararray C.
k = count(C,'ma')       % Teller antall ganger møsteret 'ma' dukker opp i C
