% Dette skriptet utfører lineær regresjon y = Ax + B på N punkt:
% (x1,y1), (x2,y2), ..., (xN,yN). 

% Skriver inn x- og y-verdier i matrisene X og Y:
X = [-1; -0.5; 0; 0.5; 1];
Y = [-0.276; -0.9297; -0.7551; 0.7874; 1.881];

% M-matrisa har forma [x1 1]
%                     [x2 1]
%                     ...
%                     [xN 1]
M = [X ones(numel(X),1)];   % ones(a,b) lager ei aXb-matrise med 1-tall.

% Teikner punkta (x1,y1), (x2,y2), ..., (xN,yN) i eit koordinatsystem:
plot(X,Y,'or')
hold on

% Bruker metoden X = linsolve(M'M,M'Y) for å finne stigningstal og
% konstantledd til den rette linja som best tilpasser punkta.
Z=linsolve(M'*M,M'*Y);

% Stigningstal A og konstantledd B til den rette linja y = Ax + B:
A = Z(1)
B = Z(2)

% Teikner den rette linja y = Ax+B saman med punkta eg teikna tidlegare.
x = min(X):0.1:max(X);
y = A*x + B;
plot(x,y,'k','LineWidth',2)

% Skal finne r^2-koeffisienten:
Ysnitt = mean(Y);
VarY = sum((Y-Ysnitt).^2);
SSE = sum((Y-(A*X+B)).^2);
r2 = (VarY - SSE)/VarY
