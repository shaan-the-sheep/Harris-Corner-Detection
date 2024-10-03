% Load the smoothed combinations
load('SQf.mat', 'SQxxf', 'SQxyf', 'SQyyf');

% Calculate the corner score image Rf
k = 0.04; % Empirical constant
Rf = (SQxxf .* SQyyf - SQxyf.^2) - k * (SQxxf + SQyyf).^2;

% Display the corner score image
figure;
imshow(Rf);
title('Corner Score Image');

% Save the corner score image
save Rf.mat Rf;
