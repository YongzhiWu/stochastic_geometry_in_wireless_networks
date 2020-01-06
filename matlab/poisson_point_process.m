%% Simulate a Poisson point process of density \lambda on A = [-L, L]^2

% parameters
lambda = 1; % Density of PPP
L = 5; % Length of square

Sa = L^2; % Area of A

% number of points follows the Poisson distribution
N = poissrnd(lambda * Sa);

% points is uniformly distributed on A
Points = unifrnd(-L, L, N, 2); % a N*2 matrix

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

%% Simulation a Poisson point process at K-dimension space

% parameters
K = 2;
R = 2.5;

center = zeros(1, K); % center

if mod(K, 2) == 0
    % for even dimension
    volume_of_ball = pi^(K/2) / gamma(K / 2 + 1) * R^K;
else
    % for odd dimension
    volume_of_ball = 1 / gamma(K + 1) * pi^( ( K - 1) / 2) * 2^(K) * gamma( ( K - 1) / 2 + 1) * R^K;
end

lambda = 0.5;

% simulate number of points
N = poissrnd(lambda * volume_of_ball);

% generate radii of points;
rho = R * power(rand(N, 1), 1/K);

% generate angles of points
theta = unifrnd(0, pi, N, K - 2);
azimuth_angle = unifrnd(0, 2 * pi, N, 1);

rectangular_coordinate = zeros(N, K);
for Kindex = 1:K
    if Kindex < K
        temp = ones(N, 1);
        for i = 1:Kindex - 1
            temp = temp .* sin(theta(:, i));
        end
        if Kindex < K - 1
            temp = temp .* cos(theta(:, Kindex));
        else
            temp = temp .* cos(azimuth_angle);
        end        
    else
        temp = ones(N, 1);
        for i = 1:Kindex - 2
            temp = temp .* sin(theta(:, i));
        end
        temp = temp .* sin(azimuth_angle);
    end
    rectangular_coordinate(:, Kindex) = rho .* temp;
end

% shift center
rectangular_coordinate = rectangular_coordinate + center;

if K == 3
    % for 3d space
    scatter3(rectangular_coordinate(:, 1), rectangular_coordinate(:, 2), rectangular_coordinate(:, 3));
    xlabel('x'); ylabel('y'); zlabel('z');
    axis square;
elseif K == 2
    % for 2d space
    scatter(rectangular_coordinate(:, 1), rectangular_coordinate(:, 2));
    xlabel('x'); ylabel('y');
    axis square;
end
    
      
