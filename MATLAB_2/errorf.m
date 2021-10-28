% Scriptet demonstrerer korleis ein kan rekne ut sannsynlighet av ein
% normalfordelt stokastisk variabel med middelverdi u og varians s^2 
% ved å bruke error-funksjonen i matlab.

u=0;            % Middelverdi u=0.
s=1;            % Varians s^2 = 1^2.

% For å finne sannsynligheita P(-inf < X < b):
b=2;
1/2 + 1/2*erf((b-u)/s/sqrt(2))

% For å finne sannsynligheita P(a < X < b) der a<b
a=-1;
b=2;
1/2*erf((b-u)/s/sqrt(2)) - 1/2*erf((a-u)/s/sqrt(2))


