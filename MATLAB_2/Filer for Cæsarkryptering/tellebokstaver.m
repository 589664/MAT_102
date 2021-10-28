% Dette scriptet finner den relative frekvensen av bokstavene i det
% enkelske alfabetet i ein tekst. 

%clear all           % Tømme minne
%clc                 % Fjerne innhald i workspace
%format compact      % Kompakt utskrift i workspace

% Oppretter ein chararray "tekst" som inneheld teksten der vi skal telle
% bokstaver. Denne chararray'en inneheld bokstavar i det engelske alfabetet 
% 'a' -> 'z'. I MatLab svarer char(a->z) til heiltala 97->122, 
% der 'a'=97 og 'z'=122.
fil = 'bible.txt';      % Relativt filnamn til teksten som skal analyserast.
tekst = fileread(fil);  % Leser fil
tekst = lower(tekst);   % Gjer om alle bokstavane til små bokstaver.
tekst(~(isletter(tekst)))=[]; % Fjerner innhald som ikkje er bokstaver (mellomrom, teikn,...)

% Oppretter ein array for å telle førekomsten av kvar bokstav i teksten.
% Index er mellom 1 og 26, der index(1) representerer boktaven 'a', index(2)
% svarer til 'b', osv....
I(1:26)=0;  
       
% Bruker ei for-løkke for å finne antall av kvar bokstav a->z.
% Forskyver med -96 for at 'a' skal få indeks 1, b indeks 2,....
for c='a':'z'   
    I(c-96)=count(tekst,c);
end

N = sum(I); % Summerer elementa i I. N = antall bokstaver i teksten.
P=I/N;      % Empirisk sannsynlighet/relativ frekvens av kvart elementa i array I. 
            % P(1) = sannsynlighet for bokstaven 'a', ...
bar(P)      % Grafisk framvisning av sannsynlighet.
