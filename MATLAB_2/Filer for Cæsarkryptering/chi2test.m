% Scriptet utf�rer ein chi2-test mellom relative frekvenser av bokstavar i
% ein referansetekst (bibel.txt) og tekst kryptert med Cesarkode med 
% ukjent koden�kkel k. M�let er � finne koden�kkel k ved � bruke ein chi2-test.

clear all           % T�mme minne
clc                 % Fjerne innhald i workspace
format compact      % Kompakt utskrift i workspace

% Oppretter to chararray "tekst" og "kyptert".
% "tekst" inneheld referanseteksten vi skal bruke til � sammenlikne den
% reletive frekvensen til bokstavane i den krypterte teksten "kryptert". 
% Desse chararray'ene inneheld bokstavane i det engelske alfabetet 'a' -> 'z'. 
% I MatLab svarer char(a->z) til heiltala 97->122, der 'a'=97 og 'z'=122.
fil = 'bible.txt';      % Relativt filnamn til referanseteksten.
tekst = fileread(fil);  % Leser fil
tekst = lower(tekst);   % Gjer om alle bokstavane til sm� bokstaver.
tekst(~(isletter(tekst)))=[];   % Fjerner innhald som ikkje er bokstaver (mellomrom, teikn,...)

fil = 'bokkryptert.txt';       % Relativt filnamn til kryptert tekst.
kryptert = fileread(fil);       % Leser fil
kryptert = lower(kryptert);     % Gjer om alle bokstavane til sm� bokstaver.
kryptert(~(isletter(kryptert)))=[]; % Fjerner innhald som ikkje er bokstaver (mellomrom, teikn,...)

% Oppretter ein array R for � telle f�rekomsten av kvar bokstav i
% referanseteksten, og ein array O for � telle bokstaver i den krypterte teksten.
% Index er mellom 1 og 26, der index 1 representerer boktaven 'a', index 2
% svarer til 'b', osv....
R(1:26) = 0;
O(1:26) = 0;
       
% Bruker ei for-l�kke for � finne antall f�rekomster av kvar bokstav a->z.
% Forskyver med -96 for at 'a' skal f� indeks 1, b indeks 2,....
for c='a':'z'   
    R(c-96)=count(tekst,c);
    O(c-96)=count(kryptert,c);
end

N = sum(R); % Summerer elementa i R. N = antall bokstaver i referanseteksten.
R=R/N;      % Empirisk sannsynlighet/relativ frekvens for kvar bokstav i 
            % referanseteksten. R(1) = sannsynlighet for bokstaven 'a', ...
            
M = sum(O); % Summerer elementa i O. M = antall bokstaver i referanseteksten.
O=O/M;      % Empirisk sannsynlighet/relativ frekvens for kvar bokstav i 
            % den krypterte teksten. O(1) = sannsynlighet for bokstaven 'a', ...

% Chi2-test mellom referansetabell R og obsertvert tabell O rotert j-plasser.
% Verdiane C(j) i array C svarer til chi2-test mellom R og O, der O er
% rotert j plassar.
C(1:26) = 0;

for j=1:26
    C(j)=sum((R-circshift(O,-j)).^2./R);
end

bar(C)

% Dekryptering. Kvar bokstav i koden blir erstatta med bokstaven som er k
% plasser foran i alfabetet.
[minimum,k] = min(C)    % Bruker funksjonen minimum for � finne minste chi2-verdi
                        %og indeksen k (koden�kkel).

dekryptert = char(mod(kryptert-97-k,26)+97)

% Lagrer den dekrypterte teksten i ei fil
fid = fopen('bokdekryptert.txt','w');
fprintf(fid,dekryptert);
fclose(fid);

clear all   % Fjerner alle variablar. Dekrypteringa er avslutta.