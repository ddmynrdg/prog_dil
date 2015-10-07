clear all;
close all;
clc;

% AÇIKLAMA: [RGB]out 3x1 lik matrisi gerçek rgb değerlerimiz "orjinal_RGB_degerleri.m"
% kodunda bilinen değerlerim.[RGB]in 3x1 lik matrisi ise benim bozuk çıkan
% resmimdeki renk değerleridir.Hedefimiz;[RGB]out = T*[RGB]in formulünden T matrisini
% bulmaktır.Elde edilen dokuz bilinmeyen denklem için Gauss elimination
% yöntemi uyguandı.

% x1, y1, z1 değerlerini bulalım.
% 158x+112y+90z=115
% 255x+200y+190z=194
% 160x+130y+230z=98
a = [
    158 112 90 115
    255 200 190 194
    160 130 230 98 ];

[m, n] = size(a);
for j = 1:m - 1
    for z = 2:m
        if a(j, j) == 0 
            t = a(j, :); a(j, :) = a(z, :);
            a(z, :) = t;
        end
    end
    for i = j + 1:m
        a(i, :) = a(i, :) - a(j, :) * (a(i, j) / a(j, j));
    end
end
x = zeros(1, m);
for s = m: -1:1
    c = 0;
    for k = 2:m
        c = c + a(s, k) * x(k);
    end
    x(s) = (a(s, n) - c) / a(s, s);
end
disp('gauss elimination method:');
a
x' 

% x1 = (115-112*y1-90*z1)/158
% x1  = 0.1420
% y1 = (8.3987 - 44.7468*z1)/ 19.2405   
% y1 =   1.0323
% z1=-25.6941/100.2961
% z1 = -0.2562
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % 


% x2, y2, z2 değerlerini bulalım.
% 158x+112y+90z=82
% 255x+200y+190z=150
% 160x+130y+230z=122
b = [
    158 112 90 112
    255 200 190 200
    160 130 230 190 ];
[m, n] = size(b);
for j = 1:m - 1
    for z = 2:m
        if b(j, j) == 0 
            t = b(j, :); b(j, :) = b(z, :);
            b(z, :) = t;
        end
    end
    for i = j + 1:m
        b(i,:) = b(i,:) - b(j, :) * (b(i, j) / b(j, j));
    end
end
x = zeros(1, m);
for s = m:-1:1
    c = 0;
    for k = 2 :m
        c = c + b(s, k) * x(k);
    end
    x(s) = (b(s, n) - c) / b(s, s);
end
disp('gauss elimination method:');
b
x' 

% x2 =(112-90*z2-112*y2)/158
% x2 = 0.6455
% y2 = (19.2405-44.7468*z2)/19.2405
% y2 = -0.3913
% z2= 60/100.2961
% z2 =0.5982
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 


% x3, y3, z3 değerlerini bulalım.
% 158x+112y+90z=68
% 255x+200y+190z=130
% 160x+130y+230z=157
d = [
    158 112 90 68
    255 200 190 130
    160 130 230 157 ];
[m, n] = size(d);
for j = 1:m - 1
    for z = 2:m
        if d(j, j) == 0 
            t = d(j, :); d(j, :) = d(z, :);
            d(z, :) = t;
        end
    end
    for i = j + 1:m
        d(i,:) = d(i, :) - d(j, :) * (d(i, j) / d(j, j));
    end
end
x = zeros(1, m);
for s = m:-1:1
    c = 0;
    for k = 2:m
        c = c + d(s, k) * x(k);
    end
    x(s) = (d(s, n) - c) / d(s, s);
end
disp('gauss elimination method:');
d
x'

%  x3 = (68-90*z3-112*y3)/158
% x3 = 0.4446
% y3 = (20.2532-44.7468*z3)/19.2405
% y3 = -0.5864
% z3 = 70.6842/100.2961
% z3 = 0.7048
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

% T =[
%   x1 y1 z1 
%   x2 y2 z2
%   x3 y3 z3 ]; --3x3 lük T matrisim 
T = [
   0.1420 1.0323 -0.2562
   0.6455 -0.3913 0.5982
   0.446 -0.5864 0.7048 ];
Ttersi = inv(T);
Ttersi
