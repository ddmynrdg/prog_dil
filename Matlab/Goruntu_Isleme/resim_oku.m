clear all;
close all;
clc

a = imread('sunum.jpg');  % Renkli resim
b = rgb2gray(a);
c = im2bw(b);
subplot(2, 2, 1), imshow(a);
subplot(2, 2, 2), imshow(b);
subplot(2, 2, 3), imshow(c);
