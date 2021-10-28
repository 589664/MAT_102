% Scriptet demonstrerer syntaksen til for-l�kker og for-each l�kker
% i MatLab. Syntaksen for for-l�kke i MatLab er:
%    
%             for i = startverdi:steglengde:stoppverdi
%                 HANDLING
%             end

clear all           % T�mme minne
clc                 % Fjerne innhald i workspace
format compact      % Kompakt utskrift i workspace

% Forl�kke for heiltal mellom 1 og 10.
for i=1:10
    i
end

% Forl�kke mellom 5 og 0 med steglengde -0.5
for d=5:-0.5:0
    d
end

% Forl�kke for bokstavane mellom 'a' og 'k'
for c='a':'k'
    c
end

% Forl�kke fom annakvar bokstav mellom 'a' og '�'
for c='a':2:'�'
    c
end

% For-eachl�kke
I = ['a' 'b' 'g'];
for c=I
    c
end