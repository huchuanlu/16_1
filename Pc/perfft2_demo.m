function perfft2_demo()
clc;clear all;close all;
%% load images
im = rgb2gray(imread('0047.jpg'));
%% computes phase congruency via monogenic filters
tic;
imf= fft2(im);
LogAmplitude = log(abs(imf));
toc;
tic;
[P, S, p, s] = perfft2(im);
Amplitude = log(abs(P));
toc;

figure,
subplot(2,2,1)
imshow(im);
subplot(2,2,2)
imagesc(LogAmplitude);
subplot(2,2,3)
imagesc(p);
subplot(2,2,4)
imagesc(Amplitude);