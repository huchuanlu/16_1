function gaborconvolve_demo()
clc;clear all;close all;
im = imread('0120.jpg');
[EO, BP] = gaborconvolve(im, 5, 6, 3, 1.07,0.65, 1.3, 0, 1);
figure();
subplot(2,3,1),
imshow(im);
subplot(2,3,2),
imshow(BP{1});
subplot(2,3,3),
imshow(BP{2});
subplot(2,3,4)
imshow(BP{3});
subplot(2,3,5),
imshow(BP{4});
subplot(2,3,6),
imshow(BP{5});