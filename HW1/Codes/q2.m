clc, clearvars, close all;
%% Part A: Least Squares (LS) for Degrees 1, 3, and 9

% Load dataset
data = readmatrix('data_A.csv');
x_unsorted = data(:,1);
y_unsorted = data(:,2);

% Sort data to prevent zig-zag lines in the plot
[x, sortIdx] = sort(x_unsorted);
y = y_unsorted(sortIdx);

N = length(x);

% Initialize variables
deg = [1, 3, 9];
theta_LS = cell(3, 1);
y_est_LS = cell(3, 1);
errors = zeros(3, 1);

figure;
plot(x, y, 'ko', 'MarkerFaceColor', 'k');
hold on;
colors = ['r', 'g', 'b'];

% Loop through each degree to calculate parameters using standard LS
for i = 1:3
    d = deg(i);
    
    % Construct Regressors for polynomial of degree d
    Phi = zeros(N, d+1);
    for j = 0:d
        Phi(:, j+1) = x.^j;
    end
    
    % Calculate theta : (Phi^T * Phi)^-1 * Phi^T * y
    theta_LS{i} = (Phi' * Phi) \ (Phi' * y);
    
    % Estimate y and calculate the error
    y_est_LS{i} = Phi * theta_LS{i};
    errors(i) = sum((y - y_est_LS{i}).^2);
    
    plot(x, y_est_LS{i}, colors(i), 'LineWidth', 1.5);
end

legend('Data', 'Deg 1', 'Deg 3', 'Deg 9');
title('LS Polynomial Fitting');

% Find and report the polynomial degree that resulted in the lowest error
[~, best_idx] = min(errors);
disp(['Best polynomial degree among [1, 3, 9] is: ', num2str(deg(best_idx))]);


%% Part B: Recursive Least Squares (RLS) for Degree 9
d = 9;

% Rebuild Regressors for degree 9
Phi_9 = zeros(N, d+1);
for j = 0:d
    Phi_9(:, j+1) = x.^j;
end

% initial conditions
theta_RLS = zeros(d+1, 1);
P = 10^5 * eye(d+1);

% RLS main loop: Update parameters recursively for each new data point
for k = 1:N
    phi_k = Phi_9(k, :)';
    
    % Calculate the estimator gain (K)
    K = (P * phi_k) / (1 + phi_k' * P * phi_k);
    
    % Update the parameter vector using the prediction error
    theta_RLS = theta_RLS + K * (y(k) - phi_k' * theta_RLS);
    
    % Update the covariance matrix (P) for the next iteration
    P = (eye(d+1) - K * phi_k') * P;
end

y_est_RLS = Phi_9 * theta_RLS;

theta_RLS

%% Part C: Comparing LS and RLS for Degree 9

% Extract LS parameters for degree 9 to compare with RLS results
theta_LS_9 = theta_LS{3};

disp('--- LS (Degree 9) ---');
disp(theta_LS_9);

disp('--- RLS (Degree 9) ---');
disp(theta_RLS);

% Plot both LS and RLS estimations together to visualize their match
figure;
plot(x, y, 'ko', 'MarkerFaceColor', 'k');
hold on;
plot(x, y_est_LS{3}, 'b-', 'LineWidth', 2);
plot(x, y_est_RLS, 'r--', 'LineWidth', 2);
legend('Data', 'LS (Deg 9)', 'RLS (Deg 9)');
title('Comparison between LS and RLS (Degree 9)');
%% Part E: Finding the Best Polynomial Degree using Train/Test Data

% Load training and testing datasets
train_data = readmatrix('data_B_train.csv');
test_data  = readmatrix('data_B_test.csv');

x_train = train_data(:,1);
y_train = train_data(:,2);

x_test  = test_data(:,1);
y_test  = test_data(:,2);

N_train = length(x_train);
N_test  = length(x_test);

% Sort test data for better visualization
[x_test_sorted, idx] = sort(x_test);
y_test_sorted = y_test(idx);

% Maximum polynomial degree to evaluate
max_degree = 12;

% Store errors and parameters
test_errors = zeros(max_degree,1);
theta_all = cell(max_degree,1);

% Loop through polynomial degrees to compute errors
for d = 1:max_degree
    
    % Construct Regressor matrix for training data
    Phi_train = zeros(N_train, d+1);
    for j = 0:d
        Phi_train(:, j+1) = x_train.^j;
    end
    
    % Calculate LS parameters using training data
    theta = (Phi_train' * Phi_train) \ (Phi_train' * y_train);
    theta_all{d} = theta;
    
    % Construct Regressor matrix for test data
    Phi_test = zeros(N_test, d+1);
    for j = 0:d
        Phi_test(:, j+1) = x_test.^j;
    end
    
    % Estimate outputs for test data
    y_est_test = Phi_test * theta;
    
    % Calculate SSE error on test dataset
    test_errors(d) = sum((y_test - y_est_test).^2);
end

% Determine the best polynomial degree
[~, best_degree] = min(test_errors);
disp(['Best polynomial degree based on TEST error: ', num2str(best_degree)]);

% Select a few important degrees to visualize
selected_deg = unique([1, 3, 6, best_degree, 12]);

colors = lines(length(selected_deg));

figure;
plot(x_test_sorted, y_test_sorted, 'ko', 'MarkerFaceColor', 'k');
hold on;

for i = 1:length(selected_deg)
    
    d = selected_deg(i);
    theta = theta_all{d};
    
    % Construct Regressor matrix for test data
    Phi_test = zeros(N_test, d+1);
    for j = 0:d
        Phi_test(:, j+1) = x_test.^j;
    end
    
    y_est_sorted = Phi_test(idx,:) * theta;
    
    plot(x_test_sorted, y_est_sorted, 'Color', colors(i,:), 'LineWidth', 2);
end

legend_entries = [{'Test Data'}, arrayfun(@(d) ['Deg ', num2str(d)], selected_deg, 'UniformOutput', false)];
legend(legend_entries{:});

title('Polynomial Fits (Selected Degrees)');

