% Load the corner score image
load('Rf.mat', 'Rf');

% Define a threshold for corner detection
threshold = 0.1 * max(Rf(:));

% Generate CornerFlagImage (1 for corners, 0 otherwise)
CornerFlagImage = Rf > threshold;

% Display the detected corners
figure;
imshow(CornerFlagImage);
title('Detected Corners');

% Additional visualization of red dots on the original image
[PosC, PosR] = find(CornerFlagImage);
figure;
imshow(InputImage);
hold on;
plot(PosR, PosC, 'r.', 'Markersize', 15);
title('Detected Corners on Original Image');

% Save the matrix of corner flags
save CornerFlagImage.mat CornerFlagImage;
