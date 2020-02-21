% Clear workspace and command screen
clear all;clc;
% Get image from user
I = im2double(imread(GetFilePath()));
% I = rgb2gray(im2double(imread('football.jpg')));
% I = im2double(imread('football.jpg'));
OENL = NLEstimate(I);
% Noise level to be estimated
TNL = [5,10,20,40];   % True Noise Level
% Number of channel in image ch = 3 for RGB and ch = 1 for grayscale
ch = size(I,3);
% Preallocating memory for noise level results
ENL = zeros(length(TNL),ch);
tic;
% Start estimating noise
for k = 1:length(TNL)
    % Adding Noise
    NI = I + randn(size(I)) * TNL(k);
    % Estimate Noise Level
    ENL(k,:) = NLEstimate(NI);
end
t = toc;
fprintf('Calculation time: %5.2f [sec]\n\n', t );