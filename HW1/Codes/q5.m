clc, clearvars, close all;

%% Part A: Plotting Sensor Data in Given Time Interval

t = (0:0.1:5)'; % Define the time vector from 0 to 5 with steps of 0.1

data_raw = readcell('Data.csv'); % Load dataset

% Extract numerical data for output_1 and output_3
output_1 = cell2mat(data_raw(2:end, 1));
output_3 = cell2mat(data_raw(2:end, 3));

% Replace 'a' with a numerical value
a_value = 1;
output_2 = a_value * ones(length(t), 1);

% --- Plotting ---
figure;

% Plot Output 1
subplot(3, 1, 1);
plot(t, output_1, 'b-', 'LineWidth', 2);
title('Output 1');
ylabel('Amplitude');
grid on;

% Plot Output 2
subplot(3, 1, 2);
plot(t, output_2, 'r-', 'LineWidth', 2);
title(['Output 2 (Constant a = ', num2str(a_value), ')']);
ylabel('Amplitude');
ylim([0, 2]);
grid on;

% Plot Output 3
subplot(3, 1, 3);
plot(t, output_3, 'g-', 'LineWidth', 2);
title('Output 3');
xlabel('Time (t)');
ylabel('Amplitude');
grid on;