% Dette scriptet demonstrere nokre metodar for å opprette array i MatLab, og
% demonstrerer grunnleggande handlingar på ein array.

clear all           % Tømme minne
clc                 % Fjerne innhald i workspace
format compact      % Kompakt utskrift i workspace

% Eksempel 1: Metodar for å opprette array med tal.
I  = [1 5 2 4 1]    % Oppretter heiltalsarray I med 5 tall.
I1 = I([1 3 5])     % Oppretter ein array I1 med elementa indeksert 1,3 og 5 frå I.
S1 = 3:8            % Oppretter heiltalsarray S1 med heiltala frå 3 til 8
S2 = 3:2:8          % Oppretter heitalsarray S2 med annakvart heiltal frå og med 3 til og med 8.
D  = 3:0.5:8        % Oppretter desimaltalsarray D frå 3.0 til 8.0 med steglengde 0.5
N(1:10) = 0         % Oppretter ein array N med lengde 10, der alle verdiane er 0.

% Eksempel 2: Metodar for å opprette array med char
C  = ['m' 'a' 't' 'l' 'a' 'b']   % Oppretter ein chararray C med 6 bokstaver.
C  = 'matlab'                    % Samme chararray som på forrige linje.
C1 = 'a':'e'        % Oppretter ein chararray med bokstavane frå og med a til og med e
C2 = 'a':2:'e'      % Oppretter ein chararray med annakvar bokstav frå og med a til og med e

% Eksempel 3: Telle antall element i ein array
nI = length(I)      % Antall element i array I
nC = length(C)      % Antall element i array C

% Eksempel 4: I MatLab er array indexert frå index 1 til index length(array).
I(3)           % Leser elementet med index 3 i array I.
S1(length(S1)) % Leser det siste element i S1
C(1)           % Henter det første elementet i array C.
S1(1:3)        % Leser elementa frå index 1 til 3 frå S1.
C(2:2:6)       % Leser annakvart element av C frå og med index 2 til og med index 6.

% Eksempel 5: Endre og legge til/fjerne element frå ein array.
I(3) = 5    % Endrar verdien av elementet med index 3 i array I frå 2 til 5.
I = [I 10]  % Legger til tallet 10 på slutten av array I. Frå no av har array I 6 element.
C(3) = []   % Fjerner element med index 3 frå array C. Frå no av er C = 'malab'. 
C(1:3) = [] % Fjerner elementa med index 1 til 3 frå C. Frå no av er C = 'ab'
