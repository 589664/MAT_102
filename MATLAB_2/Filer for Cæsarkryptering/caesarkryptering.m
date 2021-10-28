% Skriptet demonstrerer korleis ein kan kryptere og dekryptere ein tekst
% ved å bruke Cæsarkryptering. Krypteringsnøkkel er k.

clear all           % Tømme minne
clc                 % Fjerne innhald i workspace
format compact      % Kompakt utskrift i workspace

% Klartekst
klar = 'dennetekstenskalkrypterast';

% Kodenøkkel. Kvar bokstav i klartekst blir erstatta med bokstaven som er k plasser 
% etter i alfabetet: a<->a+k, b<->b+k, ...
k = 20;

% Kryptering av klartekst.
kryptert = char(mod(klar-97+k,26)+97)

% Dekryptering. Kvar bokstav i koden blir erstatta med bokstaven som er k
% plasser foran i alfabetet.
dekryptert = char(mod(kryptert-97-k,26)+97)


% Viss kodenøkkelen k ikkje er kjent kan ein bruke ei forløkke for å prøve
% alle kodenøklane, for deretter å sjå kor tid vi får ein klartekst som gir
% meining.

% for k=0:25
%  dekryptert = char(mod(kryptert-97-k,26)+97)     
% end