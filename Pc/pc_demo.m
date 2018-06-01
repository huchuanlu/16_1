function pc_demo(im)
clc;clear all;close all;
%% load images
im = imread('21.bmp');
%% computes phase congruency via monogenic filters
[PC, or,ft] = phasecongmono(im);

% nonmaxima suppression
nm = nonmaxsup( PC, or, 1.1);   % nonmaxima suppression
bw = hysthresh(nm, 0.1, 0.3);  % hysteresis thresholding 0.1 - 0.3
% show pc image
figure()
subplot(2,2,1)
imshow(im);
subplot(2,2,2)
imagesc(nm);
subplot(2,2,3)
imagesc(or);
subplot(2,2,4)
imshow(ft);


