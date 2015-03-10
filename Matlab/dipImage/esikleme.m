clc
clear all
imge = imread('cameraman.tif');
imge2 = im2bw(imge,0.5);
imshow(imge2),title('eşiklenmiş görüntü')
Mop = imge2<0.5;
Map = imge2>0.5;
T = (Mop+Map)/2;
