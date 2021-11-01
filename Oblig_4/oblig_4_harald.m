% laster inn datamatrisen
load('Arbeidskrav3.mat')

%a)
%Standardisere datamatrisen
[n,m] = size(X1);

                    
meanX = mean(X1); % Gjennomsnitt av hver kolonne
stdX = std(X1); % Standardavvik av hver kolonne

for j = 1:m
    X1(:,j) = X1(:,j) - meanX(j); % Trekker fra gjennomsnittet
    
    if( stdX(j)~= 0)
        X1(:,j) = X1(:,j)/stdX(j);
    end
end
Xnorm = X1; % Prosessert matrise


%     0.1307   -1.0232    0.8794    0.6405    0.4933   -0.3297    0.5568   -0.5559    1.0755   -0.0068
%    -0.0105    0.2717   -0.2572   -0.1820   -0.0834   -0.0887   -0.1821    0.0622   -0.3689    0.1145
%    -0.1929    0.8380   -0.6288   -0.5070   -0.4140    0.1544   -0.4652    0.2051   -0.9809    0.1825
%    -0.0185   -0.4656    0.4680    0.4391    0.5184   -0.3733    0.2231   -0.4383    0.4424    0.1357
%    -0.1269    0.1016    0.0347   -0.0557   -0.2175    0.1542   -0.0007   -0.1048   -0.0945   -0.0003
%    -0.0541    0.1872   -0.1270   -0.1371   -0.1289    0.1367   -0.1048    0.0832   -0.2131    0.0455
%    -0.0589    0.2908   -0.2322   -0.1459   -0.1644    0.3407   -0.1087    0.3206   -0.1627   -0.1949
%     0.3312   -0.2005   -0.1370   -0.0519   -0.0035    0.0057    0.0815    0.4279    0.3020   -0.2762

%b)
% Variablene inneholder forskjellige egenskaper og enheter. Vi må derfor
% preprosessere matrisen for å få variablene på samme form.

%c)

a = 2; % Antall prinsipialkomponenter

% Initialiserer loading og scoringmatrisen for forsøket uten tilsetning av
% søtningstoff

T = zeros(n,a);
P = zeros(m,a);

% NIPAL
for i = 1:a
    t_old = rand(n,1);
    p = Xnorm'*t_old;
    p = p /norm(p);
    t = Xnorm*p;
    while(norm(t-t_old)<0.00001)
        p = Xnorm'*t;
        p = p/norm(p);
        t_old = t;
        t = Xnorm*p;
    end
    T(:,i) = t;
    P(:,i) = p;
    Xnorm = Xnorm - t*p';
end

% Plotter scorematrisen T
figure('Name','Scorematrisen før tilsetning av søtningstoff','NumberTitle','off');
scatter(T(:,1),T(:,2))
text(T(:,1)+0.15,T(:,2),objNames1)
hold on
plot(0,0, 'or') % Tegner origo

%d) Smakspanelet heller mot cocoasmaken hver kjøring. De er en gjeng med
%   biased sjokoladefanboys.

%e)
% Regner ut forklart variasjon
fprintf('Forklart variasjon med %d prinsipialkomponenter er %4.2f',a,trace(T'*T)/trace(X1'*X1)*100)

%f)
% Plotter loadingmatrisen P
figure('Name','Loadingmatrisen før tilsetning av søtningstoff','NumberTitle','off');
scatter(P(:,1),P(:,2))
text(P(:,1)+0.15,P(:,2),varNames1)
hold on
plot(0,0, 'or') % Tegner origo

% Ser ut som smakene sukker,kakao og melk stemmer godt overens med testpanelet fra
% scoringmatrisen.

%g)

%Standardisere datamatrisen
[n2,m2] = size(X2);
                    
meanX2 = mean(X2); % Gjennomsnitt av hver kolonne
stdX2 = std(X2); % Standardavvik av hver kolonne

for j = 1:m2
    X2(:,j) = X2(:,j) - meanX2(j); % Trekker fra gjennomsnittet
    
    if( stdX2(j)~= 0)
        X2(:,j) = X2(:,j)/stdX2(j);
    end
end

Xnorm2 = X2; % Prosessert matrise

% Initialiserer loading og scoringmatrisen for forsøket med tilsetning av
% søtningstoff

T2 = zeros(n2,a);
P2 = zeros(m2,a);

% NIPAL
for i = 1:a
    t_old = rand(n2,1);
    p = Xnorm2'*t_old;
    p = p /norm(p);
    t = Xnorm2*p;
    while(norm(t-t_old)<0.00001)
        p = Xnorm2'*t;
        p = p/norm(p);
        t_old = t;
        t = Xnorm2*p;
    end
    T2(:,i) = t;
    P2(:,i) = p;
    Xnorm2 = Xnorm2 - t*p';
end

% Plotter scorematrisen T2
figure('Name','Scorematrisen etter tilsetning av søtningstoff','NumberTitle','off');
scatter(T2(:,1),T2(:,2))
text(T2(:,1)+0.15,T2(:,2),objNames2)
hold on
plot(0,0, 'or') % Tegner origo

% Plotter loadingmatrisen P2
figure('Name','Loadingmatrisen etter tilsetning av søtningstoff','NumberTitle','off');
scatter(P2(:,1),P2(:,2))
text(P2(:,1)+0.15,P2(:,2),varNames2)
hold on
plot(0,0, 'or') % Tegner origo

% Ser ut som du kan skille målingene på hver side av origo etter
% gjennomkjøring. Litt forskjellig hvor skillet går etter hver skjøring.
% Konklusjon av hele oppgaven : Mennesker elsker ting som smaker søtt.
