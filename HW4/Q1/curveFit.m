clc, clearvars;

folderPath = '../Datasets';

dataset1 = readtable(fullfile(folderPath, 'dataset1.xlsx'));
dataset2 = readtable(fullfile(folderPath, 'dataset2.xlsx'));
dataset3 = readtable(fullfile(folderPath, 'dataset3.xlsx'));

x1 = dataset1{:, 1};
y1 = dataset1{:, 2};

x2 = dataset2{:, 1};
y2 = dataset2{:, 2};

x3 = dataset3{:, 1};
y3 = dataset3{:, 2};

cftool;