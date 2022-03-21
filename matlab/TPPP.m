%% Realization of a transdimensional Poisson point process
% The transdimensional Poisson point process (TPPP) is the superposition of
% a 1D PPP and a 2D PPP.
% Reference: J. P. Jeyaraj, M. Haenggi, A. H. Sakr and H. Lu, "The
% Transdimensional Poisson Process for Vehicular Network Analysis," 
% IEEE Transactions on Wireless Communications, vol. 20, no. 12, 
% pp. 8023-8038, Dec. 2021.

% 2D PPP
L = 10;
lambda2 = 0.1;
S2 = (2 * L)^2;
N2 = poissrnd(lambda2 * S2);
points2 = unifrnd(-L, L, N2, 2);
scatter(points2(:, 1), points2(:, 2));
xlabel('x'); ylabel('y');
axis square;
box on;
grid on;

% 1D PPP
m = 2;
lambda = 0.2;
lambda1 = m * lambda / 2;
S1 = 2 * L;
N1 = poissrnd(lambda1 * S1);
points1 = unifrnd(-L, L, N1, 1);
points1 = [points1, zeros(N1, 1)];
hold on;
scatter(points1(:, 1), points1(:, 2));

% typical vehicle
typicalPoint = [0, 0];
hold on;
scatter(typicalPoint(:, 1), typicalPoint(:, 2));

% typical street
streetX = [-L L];
streetY = [0 0];
hold on;
line(streetX, streetY);


