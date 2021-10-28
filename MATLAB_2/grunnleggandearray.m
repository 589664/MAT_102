% Dette scriptet demonstrere nokre metodar for � opprette array i MatLab, og
% demonstrerer grunnleggande handlingar p� ein array.

clear all           % T�mme minne
clc                 % Fjerne innhald i workspace
format compact      % Kompakt utskrift i workspace

% Eksempel 1: Metodar for � opprette array med tal.
I  = [1 5 2 4 1]    % Oppretter heiltalsarray I med 5 tall.
I1 = I([1 3 5])     % Oppretter ein array I1 med elementa indeksert 1,3 og 5 fr� I.
S1 = 3:8            % Oppretter heiltalsarray S1 med heiltala fr� 3 til 8
S2 = 3:2:8          % Oppretter heitalsarray S2 med annakvart heiltal fr� og med 3 til og med 8.
D  = 3:0.5:8        % Oppretter desimaltalsarray D fr� 3.0 til 8.0 med steglengde 0.5
N(1:10) = 0         % Oppretter ein array N med lengde 10, der alle verdiane er 0.

% Eksempel 2: Metodar for � opprette array med char
C  = ['m' 'a' 't' 'l' 'a' 'b']   % Oppretter ein chararray C med 6 bokstaver.
C  = 'matlab'                    % Samme chararray som p� forrige linje.
C1 = 'a':'e'        % Oppretter ein chararray med bokstavane fr� og med a til og med e
C2 = 'a':2:'e'      % Oppretter ein chararray med annakvar bokstav fr� og med a til og med e

% Eksempel 3: Telle antall element i ein array
nI = length(I)      % Antall element i array I
nC = length(C)      % Antall element i array C

% Eksempel 4: I MatLab er array indexert fr� index 1 til index length(array).
I(3)           % Leser elementet med index 3 i array I.
S1(length(S1)) % Leser det siste element i S1
C(1)           % Henter det f�rste elementet i array C.
S1(1:3)        % Leser elementa fr� index 1 til 3 fr� S1.
C(2:2:6)       % Leser annakvart element av C fr� og med index 2 til og med index 6.

% Eksempel 5: Endre og legge til/fjerne element fr� ein array.
I(3) = 5    % Endrar verdien av elementet med index 3 i array I fr� 2 til 5.
I = [I 10]  % Legger til tallet 10 p� slutten av array I. Fr� no av har array I 6 element.
C(3) = []   % Fjerner element med index 3 fr� array C. Fr� no av er C = 'malab'. 
C(1:3) = [] % Fjerner elementa med index 1 til 3 fr� C. Fr� no av er C = 'ab'
