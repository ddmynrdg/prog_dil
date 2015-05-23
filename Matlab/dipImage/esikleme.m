clc
clear all;
close all;

I = imread('cameraman.tif');
bw = im2bw(I);
subplot(1, 2, 1); imshow(I);
subplot(1, 2, 2); imshow(bw);

%%%%%tresholding%%%%
T = 0.5;
[x, y] = size(bw);
for i = 1:x
    for j = 1:y
        if bw(x, y) >= T
            Mop = Mop + 1;
        else
            Map = Map + 1;
        end
    end
end
figure();
T2 = (Mop + Map) / 2;
