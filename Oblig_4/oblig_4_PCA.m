% oppg a:

clc
clear
load('Arbeidskrav3.mat')

% Preprosesserer
% Gj.snitt = 0
% Std.avvik = 1
[n,m] = size(X1);                     % n = antall objekt (land)
                                      % m = antall variablar (matvarer)
meanX1 = mean(X1);                    % Gjennomsnittet av kvar kolonne i matrisa X
stdX1 = std(X1);                      % Standardavviket i kvar kolonne i matrisa X.

for j = 1:m
    X1(:,j) = X1(:,j) - meanX1(j);     % Trekker gjennomsnittet av kolonne j 
                                      % frå kolonne j
    if stdX1(j)~=0
        X1(:,j)= X1(:,j)/stdX1(j);     % Dividerer kolonne j med standardavviket 
                                      % til kolonne j.
    end
end
Xnorm = X1;                           % Preprosessert matrise.

% oppg b:

% me må preprossessere datamatrisa for X fordi
% variablane kan måle forskjellige egenskaper, med forskjellige enheter
% preprosessere matrisen for å få variablene på samme form.

% oppg c:

% Antall prinsipalkomponentar eg ønskjer å finne i matrisa X
a = 2;

% Bruker NIPALS-metoden for å finne dei a største eigenvektorane til 
% transponert(X)X (prinsipalkomponentane til X). 
% NIPALS-algoritma er beskrevet i kompendiet på s.331.

% Initialiserer scores/loadingmatrisa som 0-matriser.
T = zeros(n,a); 
P = zeros(m,a);

% NIPAL
for i=1:a
    t_old = rand(n,1);
    p = Xnorm'*t_old;
    p = p/norm(p); % Normaliserer p til lengde 1.
    t = Xnorm*p;
    while (norm(t-t_old)>0.00001)
        p = Xnorm'*t;
        p = p/norm(p);
        t_old = t;
        t = Xnorm*p;
    end
    T(:,i) = t;     % Scores
    P(:,i) = p;     % Loading
    Xnorm = Xnorm - t*p';
end

% Plotter scoresmatrisa (dei to første prinsipalkomponentane).
figure('Name','Scorematrisen før tilsetning av søtningstoff','NumberTitle','off');
scatter(T(:,1), T(:,2))
text(T(:,1)+.1, T(:,2),objNames1)
hold on
plot(0,0,'or')  % Teiknar inn origo (som referanse)
grid on

% oppg d:
% 5a og 5b heller mot cocoa, vil si at instillingen gir cocoa smak

% oppg e:
% Finner forklart variasjon av dei a prinsipalkoeffisientane.
trX = trace(X1'*X1);        % Trace av standardisert matrise X
trT = trace(T'*T);          % Trace av scoresmatrisa
fprintf('Forklart variasjon med %d prinsipalkomponenter er: %4.2f\n',a,trT/trX*100)

% oppg f:
% Plotter loadingmatrisa.
figure('Name','Loadingmatrisa før tilsetning av søtningstoff','NumberTitle','off');
scatter(P(:,1), P(:,2))
text(P(:,1)+.01, P(:,2),varNames1)
hold on
plot(0,0,'or')  % Teiknar inn origo (som referanse)
grid on

% oppg e:

% Preprosesserer
% Gj.snitt = 0
% Std.avvik = 1

[n,m] = size(X2);                     % n = antall objekt (land)
                                      % m = antall variablar (matvarer)
meanX2 = mean(X2);                    % Gjennomsnittet av kvar kolonne i matrisa X
stdX2 = std(X2);                      % Standardavviket i kvar kolonne i matrisa X.

for j = 1:m
    X2(:,j) = X2(:,j) - meanX2(j);     % Trekker gjennomsnittet av kolonne j 
                                      % frå kolonne j
    if stdX2(j)~=0
        X2(:,j)= X2(:,j)/stdX2(j);     % Dividerer kolonne j med standardavviket 
                                      % til kolonne j.
    end
end
Xnorm = X2;                           % Preprosessert matrise.

% Initialiserer scores/loadingmatrisa som 0-matriser.
T = zeros(n,a); 
P = zeros(m,a);

% NIPAL
for i=1:a
    t_old = rand(n,1);
    p = Xnorm'*t_old;
    p = p/norm(p); % Normaliserer p til lengde 1.
    t = Xnorm*p;
    while (norm(t-t_old)>0.00001)
        p = Xnorm'*t;
        p = p/norm(p);
        t_old = t;
        t = Xnorm*p;
    end
    T(:,i) = t;     % Scores
    P(:,i) = p;     % Loading
    Xnorm = Xnorm - t*p';
end

% Plotter scoresmatrisa (dei to første prinsipalkomponentane).
figure('Name','Scorematrisen etter tilsetning av søtningstoff','NumberTitle','off');
scatter(T(:,1), T(:,2))
text(T(:,1)+.1, T(:,2),objNames2)
hold on
plot(0,0,'or')  % Teiknar inn origo (som referanse)
grid on

% Plotter loadingmatrisa.
figure('Name','Loadingmatrisa etter tilsetning av søtningstoff','NumberTitle','off');
scatter(P(:,1), P(:,2))
text(P(:,1)+.01, P(:,2),varNames2)
hold on
plot(0,0,'or')  % Teiknar inn origo (som referanse)
grid on

% ser ut som når det blir tilsatt ekstra stoff i kakaoen får den mer smak og tekstur som
% forskjellige instillinger gir den, også ligger viskositet og sediment helt motsatt
% av hverandre langs y-aksen. Utfra dette vil eg konkludere at forskjellige instillinger
% gir kakaoen tekstur og smak. Uten tilsetting er det mer vanlig kakao med mindre smak
% og mer sediment
