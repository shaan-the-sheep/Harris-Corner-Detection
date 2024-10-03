% Load the x- and y-derivative images
load('Dxf.mat', 'Dxf');
load('Dyf.mat', 'Dyf');

% Calculate the unsmoothed combinations of derivative images
Qxxf = Dxf .* Dxf;
Qxyf = Dxf .* Dyf;
Qyyf = Dyf .* Dyf;

% Display the x-, y-derivative images, and the combinations
figure;
subplot(1, 2, 1);
imshowpair(Dxf, Dyf, 'montage');
title('X- and Y-Derivative Images');

subplot(1, 2, 2);
imshowpair(Qxxf + Qyyf, Qxyf, 'montage');
title('Combinations of Derivative Images');

% Apply Gaussian smoothing (7x7 filter) to the combinations
filterSize = 7;
filterSigma = 1;
SQxxf = imgaussfilt(Qxxf, filterSigma, 'FilterSize', filterSize);
SQxyf = imgaussfilt(Qxyf, filterSigma, 'FilterSize', filterSize);
SQyyf = imgaussfilt(Qyyf, filterSigma, 'FilterSize', filterSize);

% Display the smoothed combinations
figure;
subplot(1, 3, 1);
imshow(SQxxf);
title('Smoothed Qxx');

subplot(1, 3, 2);
imshow(SQxyf);
title('Smoothed Qxy');

subplot(1, 3, 3);
imshow(SQyyf);
title('Smoothed Qyy');

% Save the smoothed combinations
save SQf.mat SQxxf SQxyf SQyyf;
