% Dette skriptet utfører 2. ordens regresjon y = Ax^2 + Bx + C på N punkt:
% (x1,y1), (x2,y2), ..., (xN,yN). 

% Skriver inn x- og y-verdier i matrisene X og Y:
X = [-1; -0.5; 0; 0.5; 1];
Y = [-0.276; -0.9297; -0.7551; 0.7874; 1.881];

% M-matrisa har forma [x1^2 x1 1]
%                     [x2^2 x2 1]
%                     ...
%                     [xN^2 xN 1]
M = [X.^2 X ones(numel(X),1)];

% Teikner punkta (x1,y1), (x2,y2), ..., (xN,yN) i eit koordinatsystem:
plot(X,Y,'or')
hold on

% Bruker metoden X = linsolve(M'M,M'Y) for å finne koeffisientane
% til 2.gradskurva som best tilpasser punkta.
Z=linsolve(M'*M,M'*Y);

% Koeffisientane til 2. gradskurva y = Ax^2 + Bx + C:
A = Z(1)
B = Z(2)
C = Z(3)

% Teikner 2. gradskurva y = Ax^2 + Bx + C saman med punkta teikna tidlegare.
x = min(X):0.1:max(X);
y = A*x.^2 + B*x + C;
plot(x,y,'b','LineWidth',2)

% Skal finne r^2-koeffisienten:
Ysnitt = mean(Y);
VarY = sum((Y-Ysnitt).^2);
SSE = sum((Y-(A*X.^2+B*X+C)).^2);
r2 = (VarY - SSE)/VarY
