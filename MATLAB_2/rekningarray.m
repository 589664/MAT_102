% Dette scriptet demonstrerer grunnleggjande rekneoperasjonar i med array's
% i MatLab. Scriptet demonstrerer addisjon, multiplikasjon,
% modulusrekning, og metodar for å summere tal i ein array.

I = [1 3 2 4 5 2]   % Heiltalsarray.
J = 1:6             % Heiltalsarray
C = 'matlab'        % Chararray

% Grunnleggande rekneoperasjonar.
I+J                 % Adderer elementa i I og J. Berre mogleg viss array har lik lengde.
I+10                % Adderer 10 til kvart element i I.
I*2                 % Multipliserer kvart element i I med 2.
I.*J                % Multipliserer elementa i I og J. Berre mogleg viss array har lik lengde.
I./J                % Dividerer elementa i I og J. Berre mogleg viss array har lik lengde.
I.^2                % Opphøger elementa i array I i 2. potens

C + 1               % Legger til 1 til kvar bokstav i chararray C. (a = 97 .... z = 122)
char(C+1)           % Samme som forrige, men viser svaret som char-type.
C + 'abcdef'        % Legger sammen to chararray. Berre mogleg viss array har lik lengde.
char(C + 'abcdef')  % Legger sammen to chararray, og viser resultatet som char-type

% Summere element i ein array.
sum(I)              % Summen av tala i I.
sum(I(2:4))         % Summerer tala i I med index mellom 2 og 4.
sum(I([1 3 6]))     % Summerer tala i I med index 1, 3 og 6.

% Demonstrerer modulu etter divisjon/rest.
mod(9,4)    % Rest av 9 delt på 4. (9 modulus 4). 9:4 = 1 med rest 1.
mod(I,3)    % Array som inneheld rest av tala i I delt på 3 ( I modulus 3).


