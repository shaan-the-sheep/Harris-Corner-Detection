% Load the input image
InputImage = imread('Neuschwanstein.png'); % Replace with the desired image

% Convert the image to double for calculations
f = im2double(InputImage);

% Calculate x-derivative using Sobel filter
Dxf = imfilter(f, [-1, 0, 1]);

% Calculate y-derivative using Sobel filter
Dyf = imfilter(f, [-1; 0; 1]);

% Display the x-derivative image
figure;
subplot(1, 2, 1);
imshow(Dxf);
title('X-Derivative Image');

% Display the y-derivative image
subplot(1, 2, 2);
imshow(Dyf);
title('Y-Derivative Image');

% Save the derivative images
save Dxf.mat Dxf;
save Dyf.mat Dyf;
