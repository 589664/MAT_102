% Dette skriptet utfører 3. ordens regresjon y = Ax^3 + Bx^2 + CX + D på N punkt:
% (x1,y1), (x2,y2), ..., (xN,yN). 

% Skriver inn x- og y-verdier i matrisene X og Y:
X = [-1; -0.5; 0; 0.5; 1];
Y = [-0.276; -0.9297; -0.7551; 0.7874; 1.881];

% M-matrisa har forma [x1^3 x1^2 x1 1]
%                     [x2^3 x2^2 x2 1]
%                     ...
%                     [xN^3 xN^2 xN 1]
M = [X.^3 X.^2 X ones(numel(X),1)];

% Teikner punkta (x1,y1), (x2,y2), ..., (xN,yN) i eit koordinatsystem:
plot(X,Y,'or')
hold on

% Bruker metoden X = linsolve(M'M,M'Y) for å finne koeffisientane
% til 2.gradskurva som best tilpasser punkta.
Z=linsolve(M'*M,M'*Y);

% Koeffisientane til 3. gradskurva y = Ax^3 + Bx^2 + CX + D:
A = Z(1)
B = Z(2)
C = Z(3)
D = Z(4)

% Teikner 3. gradskurva y = Ax^3 + Bx^2 + CX + D saman med punkta teikna tidlegare.
x = min(X):0.1:max(X);
y = A*x.^3 + B*x.^2 + C*x + D;
plot(x,y,'y','LineWidth',2)

% Skal finne r^2-koeffisienten:
Ysnitt = mean(Y);
VarY = sum((Y-Ysnitt).^2);
SSE = sum((Y-(A*X.^3+B*X.^2+C*X+D)).^2);
r2 = (VarY - SSE)/VarY
