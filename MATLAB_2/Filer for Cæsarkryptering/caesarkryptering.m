% Skriptet demonstrerer korleis ein kan kryptere og dekryptere ein tekst
% ved � bruke C�sarkryptering. Krypteringsn�kkel er k.

clear all           % T�mme minne
clc                 % Fjerne innhald i workspace
format compact      % Kompakt utskrift i workspace

% Klartekst
klar = 'dennetekstenskalkrypterast';

% Koden�kkel. Kvar bokstav i klartekst blir erstatta med bokstaven som er k plasser 
% etter i alfabetet: a<->a+k, b<->b+k, ...
k = 20;

% Kryptering av klartekst.
kryptert = char(mod(klar-97+k,26)+97)

% Dekryptering. Kvar bokstav i koden blir erstatta med bokstaven som er k
% plasser foran i alfabetet.
dekryptert = char(mod(kryptert-97-k,26)+97)


% Viss koden�kkelen k ikkje er kjent kan ein bruke ei forl�kke for � pr�ve
% alle koden�klane, for deretter � sj� kor tid vi f�r ein klartekst som gir
% meining.

% for k=0:25
%  dekryptert = char(mod(kryptert-97-k,26)+97)     
% end