% Dette skriptet utfører sinusoidal regresjon y = a0 + a1*cos(2*pi*x/w) + b1*sin(2*pi*x/w)
% på N punkt:(x1,y1), (x2,y2), ..., (xN,yN). 

% Skriver inn x- og y-verdier i matrisene X og Y:
X = [-1; -0.5; 0; 0.5; 1];
Y = [-0.276; -0.9297; -0.7551; 0.7874; 1.881];

% M-matrisa har forma [1 cos(2*pi*X1/w) sin(2*pi*X1/w)]
%                     [1 cos(2*pi*X2/w) sin(2*pi*X2/w)]
%                     ...
%                     [1 cos(2*pi*XN/w) sin(2*pi*XN/w)]
w = 2.6;    % Gitt i oppgåva
M = [ones(numel(X),1) cos(2*pi*X/w) sin(2*pi*X/w)];

% Teikner punkta (x1,y1), (x2,y2), ..., (xN,yN) i eit koordinatsystem:
plot(X,Y,'or')
hold on

% Bruker metoden X = linsolve(M'M,M'Y) for å finne koeffisientane
% til sinuskurva som best tilpasser punkta.
Z=linsolve(M'*M,M'*Y);

% Koeffisientane til sinusoidalkurva 
% y= a0 + a1*cos(2*pi*x/w) + b1*sin(2*pi*x/w):
A0 = Z(1)
A1 = Z(2)
B1 = Z(3)

% Teikner sinusoidalkurva y= a0 + a1*cos(2*pi*x/w) + b1*sin(2*pi*x/w) 
% saman med punkta eg teikna tidlegare.
x = min(X):0.1:max(X);
y = A0 + A1*cos(2*pi*x/w) + B1*sin(2*pi*x/w);
plot(x,y,'c','LineWidth',2)

% Skal finne r^2-koeffisienten:
Ysnitt = mean(Y);
VarY = sum((Y-Ysnitt).^2);
SSE = sum((Y-(A0 + A1*cos(2*pi*X/w) + B1*sin(2*pi*X/w))).^2);
r2 = (VarY - SSE)/VarY
