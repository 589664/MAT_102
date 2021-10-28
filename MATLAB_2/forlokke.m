% Scriptet demonstrerer syntaksen til for-løkker og for-each løkker
% i MatLab. Syntaksen for for-løkke i MatLab er:
%    
%             for i = startverdi:steglengde:stoppverdi
%                 HANDLING
%             end

clear all           % Tømme minne
clc                 % Fjerne innhald i workspace
format compact      % Kompakt utskrift i workspace

% Forløkke for heiltal mellom 1 og 10.
for i=1:10
    i
end

% Forløkke mellom 5 og 0 med steglengde -0.5
for d=5:-0.5:0
    d
end

% Forløkke for bokstavane mellom 'a' og 'k'
for c='a':'k'
    c
end

% Forløkke fom annakvar bokstav mellom 'a' og 'å'
for c='a':2:'å'
    c
end

% For-eachløkke
I = ['a' 'b' 'g'];
for c=I
    c
end