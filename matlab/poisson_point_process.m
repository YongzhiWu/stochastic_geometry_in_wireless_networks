%% Simulate a Poisson point process of density \lambda on A = [-L, L]^2

% parameters
lambda = 1; % Density of PPP
L = 5; % Length of square

Sa = L^2; % Area of A

% number of points follows the Poisson distribution
N = poissrnd(lambda * Sa);

% points is uniformly distributed on A
Points = unifrnd(-L/2, L/2, N, 2); % a N*2 matrix

% Plot points
scatter(Points(:, 1), Points(:, 2));
xlabel('x'); ylabel('y');
axis square;

%% Simulate a Poisson point process of density \lambda on a disk with radius R

% parameters
r = 2.5; % radius of disk
x0 = 0; y0 = 0; % center of disk
area_of_disk = pi * r^2; % area of disk
lambda = 1;

% simulate number of points
N = poissrnd(lambda * area_of_disk);

% generate radii of points
rho = r * sqrt(rand(N, 1));
% rho = sqrt(unifrnd(0, r^2, N, 1));

% generate angles of points
theta = unifrnd(0, 2*pi, N, 1);

% convert from polar to cartesian coordinates
[x, y] = pol2cart(theta, rho);

% shift center of disk to (x0, y0)
x = x + x0;
y = y + y0;

% Plot points
scatter(x, y);
xlabel('x'); ylabel('y');
axis square;
