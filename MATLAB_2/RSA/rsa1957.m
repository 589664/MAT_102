% A-00, B-01, C-02, D-03, E-04, F-05, G-06, H-07, I-08, J-09, K-10
% L-11, M-12, N-13, O-14, P-15, Q-16, R-17, S-18, T-19, U-20, V-21, 
% W-22, X-23, Y-24, Z-25, mellomrom-99

% Offentleg kodenøkkel:
n = 115912873;
e = 133;

%a: DEAD <-> 03040003 <-> 3040003
M = int64(3040003);
K = powerMod(M,e,n);

% K = 33398349

%b: Primtal mindre enn sqrt(n)
P = Eratosthenes(sqrt(n));

%c: Finne primtala p og q slik at n=p*q
for i = 1:length(P)
    if(mod(n,P(i))==0)
        p=P(i);
        break;
    end
end
q=n/p;

%d: 
phi = (p-1)*(q-1);
[g,d,y] = EuclideanAlgorithm(e,phi);

if(g==1)
    'e er eit lovleg val'
else
    'e er ikkje eit lovleg val'
end
% (n,e) er eit lovleg val.
% Dekrypteringsnøkkel er: d = 27883597

%e: 
% Dekrypterer svaret i a.
powerMod(K,d,n)
% Vi fekk tilbake den opprinnelege koda 3040003 <-> 03040003
% Dekrypterer meldinga i oppgåva.
U1 = int64(88709091);
U2 = int64(115282881);
U3 = int64(44754833);
U4 = int64(5274204);
U5 = int64(37162740);
U6 = int64(69569552);
U7 = int64(73765472);
% Bruker dekrypteringsnøkkel (n,d) for å dekryptere meldinga.
T1 = powerMod(U1,d,n);
T2 = powerMod(U2,d,n);
T3 = powerMod(U3,d,n);
T4 = powerMod(U4,d,n);
T5 = powerMod(U5,d,n);
T6 = powerMod(U6,d,n);
T7 = powerMod(U7,d,n);

%Den dekrypterte meldinga var:
% [99999902,14050504,4990818,99180417,21040399,199904,8060719]
% Supplerer med ledende 0 slik at kvar kodeblokk blir 8 siffer
% [99 99 99 02,14 05 05 04,04 99 08 18,99 18 04 17,21 04 03 99,00 19 99 04,08 06 07 19]
% [          C, O  F  F  E, E     I  S,    S  E  R, V  E  D   , A  T     E, I  G  H  T] 
% Den hemmelege meldinga var: COFFFEE IS SERVED AT EIGTH
