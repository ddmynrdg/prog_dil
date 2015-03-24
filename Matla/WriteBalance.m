%DİDEM YANARDAĞ --11060287--
%PERİHAN DEMİRER --11060271--
%MERVE ÖZKAN  --11060288-- 
 
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
 
[m, n]=size(a);
for j=1:m-1
    for z=2:m
        if a(j,j)==0 
            t = a(j, :); a(j, :) = a(z, :);
            a(z, :)=t;
        end
    end
    for i=j+1:m
        a(i,:)=a(i,:)-a(j,:)*(a(i,j)/a(j,j));
    end
end
x=zeros(1,m);
for s=m:-1:1
    c=0;
    for k=2:m
        c =c + a(s,k)*x(k);
    end
    x(s)=(a(s,n)-c)/a(s, s);
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
[m, n]=size(b);
for j=1:m-1
    for z=2:m
        if b(j,j)==0 
            t = b(j, :); b(j, :) = b(z, :);
            b(z, :)=t;
        end
    end
    for i=j+1:m
        b(i,:)=b(i,:)-b(j,:)*(b(i,j)/b(j,j));
    end
end
x=zeros(1,m);
for s=m:-1:1
    c=0;
    for k=2:m
        c =c + b(s,k)*x(k);
    end
    x(s)=(b(s,n)-c)/b(s, s);
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
[m, n]=size(d);
for j=1:m-1
    for z=2:m
        if d(j,j)==0 
            t = d(j, :); d(j, :) = d(z, :);
            d(z, :)=t;
        end
    end
    for i=j+1:m
        d(i,:)=d(i,:)-d(j,:)*(d(i,j)/d(j,j));
    end
end
x=zeros(1,m);
for s=m:-1:1
    c=0;
    for k=2:m
        c =c + d(s,k)*x(k);
    end
    x(s)=(d(s,n)-c)/d(s, s);
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
 WriteBalance.m Raw
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
clear all;
clc;
close all;
% AÇIKLAMA:Veri tabanına yüklenen bütün resimler MATLAB klasöründe "resimmler" adlı bir 
% klasörde toplanıldı.Teker teker bu resimler çağrıldı. Renk paletleri
% resinde bulunduğu pixel aralına göre crop edildi.
 
% 10 isimli resim ve renk paletini crop edilmiş hali
 im_10 = imread('resimmler/10.JPG');
 im2_10 = imcrop(im_10, [610 117 1095 780]);
 imshow(im_10),figure,imshow(im2_10)
 
% 10a isimli resim ve renk paletini crop edilmiş hali
 im_10a = imread('resimmler/10a.JPG');
 im2_10a = imcrop(im_10a, [670 117 1005 720]);
 imshow(im_10a),figure,imshow(im2_10a)
 
% 10b isimli resim ve renk paletini crop edilmiş hali
 im_10b = imread('resimmler/10b.JPG');
 im2_10b = imcrop(im_10b, [440 147 1100 800]);
 imshow(im_10b),figure,imshow(im2_10b)
 
 
% 10c isimli resim ve renk paletini crop edilmiş hali
 im_10c = imread('resimmler/10c.JPG');
 im2_10c = imcrop(im_10c, [590 260 1100 800]);
 imshow(im_10c),figure,imshow(im2_10c)
 
 
% 11 isimli resim ve renk paletini crop edilmiş hali
 im_11 = imread('resimmler/11.JPG');
 im2_11 = imcrop(im_11, [470 117 1205 820]);
 imshow(im_11),figure,imshow(im2_11)
 
 
% 11A isimli resim ve renk paletini crop edilmiş hali
 im_11A = imread('resimmler/11A.JPG');
 im2_11A = imcrop(im_11A, [500 150 1205 820]);
 imshow(im_11A),figure,imshow(im2_11A)
 
% 11B isimli resim ve renk paletini crop edilmiş hali
 im_11B = imread('resimmler/11B.JPG');
 im2_11B = imcrop(im_11B, [540 140 1150 800]);
 imshow(im_11B),figure,imshow(im2_11B)
 
 
% 11C isimli resim ve renk paletini crop edilmiş hali
 im_11C = imread('resimmler/11C.JPG');
 im2_11C = imcrop(im_11C, [480 270 1160 800]);
 imshow(im_11C),figure,imshow(im2_11C)
 
% 12 isimli resim ve renk paletini crop edilmiş hali
 im_12 = imread('resimmler/12.JPG');
 im2_12 = imcrop(im_12, [670 450 1005 700]);
 imshow(im_12),figure,imshow(im2_12)
 
% 12a isimli resim ve renk paletini crop edilmiş hali
 im_12a = imread('resimmler/12a.JPG');
 im2_12a = imcrop(im_12a, [650 460 1000 750]);
 imshow(im_12a),figure,imshow(im2_12a)
 
% 12b isimli resim ve renk paletini crop edilmiş hali
 im_12b = imread('resimmler/12b.JPG');
 im2_12b = imcrop(im_12b, [700 550 1005 720]);
 imshow(im_12b),figure,imshow(im2_12b)
 
% 12c isimli resim ve renk paletini crop edilmiş hali
im_12c = imread('resimmler/12c.JPG');
im2_12c = imcrop(im_12c, [590 300 1105 800]);
imshow(im_12c),figure,imshow(im2_12c)
 
 
% 13 isimli resim ve renk paletini crop edilmiş hali
 im_13 = imread('resimmler/13.JPG');
 im2_13 = imcrop(im_13, [750 260 1000 700]);
 imshow(im_13),figure,imshow(im2_13)
 
 
% 13 isimli resim ve renk paletini crop edilmiş hali
 im_13a = imread('resimmler/13a.JPG');
 im2_13a = imcrop(im_13a, [700 200 1005 700]);
 imshow(im_13a),figure,imshow(im2_13a)
 
% 13b isimli resim ve renk paletini crop edilmiş hali
 im_13b = imread('resimmler/13b.JPG');
 im2_13b = imcrop(im_13b, [750 190 1000 670]);
 imshow(im_13b),figure,imshow(im2_13b)
 
% 14 isimli resim ve renk paletini crop edilmiş hali
 im_14 = imread('resimmler/14.JPG');
 im2_14 = imcrop(im_14, [490 280 1000 670]);
 imshow(im_14),figure,imshow(im2_14)
 
% 14a isimli resim ve renk paletini crop edilmiş hali
 im_14a = imread('resimmler/14a.JPG');
 im2_14a = imcrop(im_14a, [550 190 980 650]);
 imshow(im_14a),figure,imshow(im2_14a)
 
% 14b isimli resim ve renk paletini crop edilmiş hali
 im_14b = imread('resimmler/14b.JPG');
 im2_14b = imcrop(im_14b, [600 190 1000 670]);
 imshow(im_14b),figure,imshow(im2_14b)
 
% 14c isimli resim ve renk paletini crop edilmiş hali
 im_14c = imread('resimmler/14c.JPG');
 im2_14c = imcrop(im_14c, [520 300 1000 650]);
 imshow(im_14c),figure,imshow(im2_14c)
 
% 15 isimli resim ve renk paletini crop edilmiş hali
 im_15 = imread('resimmler/15.JPG');
 im2_15 = imcrop(im_15, [790 400 900 600]);
 imshow(im_15),figure,imshow(im2_15)
 
% 15a isimli resim ve renk paletini crop edilmiş hali
 im_15a = imread('resimmler/15a.JPG');
 im2_15a = imcrop(im_15a, [650 300 880 600]);
 imshow(im_15a),figure,imshow(im2_15a)
 
% 15b isimli resim ve renk paletini crop edilmiş hali
im_15b = imread('resimmler/15b.JPG');
im2_15b = imcrop(im_15b, [670 400 900 600]);
imshow(im_15b),figure,imshow(im2_15b)
 
 
% 15c isimli resim ve renk paletini crop edilmiş hali
im_15c = imread('resimmler/15c.JPG');
im2_15c = imcrop(im_15c, [880 350 900 600]);
imshow(im_15c),figure,imshow(im2_15c)
 
 
 
 orjinal_RGB_degerleri Raw
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
66
67
68
69
70
71
72
73
74
75
76
77
78
79
80
81
82
83
84
85
86
87
88
89
90
91
92
93
94
95
96
97
98
99
100
101
102
103
104
105
106
107
108
109
110
111
112
113
114
115
116
117
118
119
120
121
122
123
124
125
126
127
128
129
130
131
132
133
134
135
136
137
138
139
140
141
142
143
144
145
146
147
148
149
150
151
152
153
154
155
156
157
158
159
160
161
162
163
164
165
166
167
168
169
170
171
172
173
174
175
176
177
178
179
180
181
182
183
clc; 
Close all ;
imtool close all; 
clear; 
workspace; 
format longg;
format compact;
 
    chipNames = {
        'Dark Skin';
        'Light Skin';
        'Blue Sky';
        'Foliage';
        'Blue Flower';
        'Bluish Green';
        'Orange';
        'Purple Red';
        'Moderate Red';
        'Purple';
        'Yellow Green';
        'Orange Yellow';
        'Blue';
        'Green';
        'Red';
        'Yellow';
        'Magenta';
        'Cyan';
        'White';
        'Neutral 8';
        'Neutral 65';
        'Neutral 5';
        'Neutral 35';
        'Black'};
 
    sRGB_Values = uint32([...
        115,82,68
        194,150,130
        98,122,157
        87,108,67
        133,128,177
        103,189,170
        214,126,44
        80,91,166
        193,90,99
        94,60,108
        157,188,64
        224,163,46
        56,61,150
        70,148,73
        175,54,60
        231,199,31
        187,86,149
        8,133,161
        243,243,242
        200,200,200
        160,160,160
        122,122,121
        85,85,85
        52,52,52]);
 
defaultValue = {'1280', '26'};
titleBar = 'Enter an integer value';
userPrompt = {'Enter the width of the image in pixels', 'Enter the width of the grid lines in pixels'};
caUserInput = inputdlg(userPrompt, titleBar, 1, defaultValue);
if isempty(caUserInput),return,end; 
imageWidth = round(str2num(cell2mat(caUserInput(1))));
% Check for a valid integer.
if isnan(imageWidth)
    imageWidth = defaultValue;
    message = sprintf('I said it had to be an integer.\nI will use %d and continue.', defaultValue);
    uiwait(warndlg(message));
end
 
gridWidth = round(str2num(cell2mat(caUserInput(2))));
% Check for a valid integer.
if isnan(gridWidth)
    gridWidth = defaultValue;
	   message = sprintf('I said it had to be an integer.\nI will use %d and continue.', defaultValue);
	   uiwait(warndlg(message));
end
 
chipWidth = int32((imageWidth - 7 * gridWidth)/ 6);
imageHeight = 4 * (chipWidth + gridWidth) + gridWidth;
 
promptMessage = sprintf('Do you want to display color chip names and RGB values over the image?');
reply = questdlg(promptMessage, 'Display labels?', 'Yes', 'No', 'Yes');
if strcmpi(reply, 'Yes')
	    displayLabels = true;
else
	    displayLabels = false;
end
 
cols = (gridWidth + 1) : (chipWidth + gridWidth) : imageWidth;
rows = (gridWidth + 1) : (chipWidth + gridWidth) : imageHeight;
% width = max(cols); % Update this to get it accurate.
rgbImage = zeros(imageHeight, imageWidth, 3, 'uint8');
 
% Assign the chip colors to the proper locations in the RGB image.
chipNumber = 1;
for row = 1 : 4
   	row1 = rows(row);
	   row2 = row1 + chipWidth;
	   for col = 1 : 6
		      col1 = cols(col);
		      col2 = col1 + chipWidth;
		      rgbImage(row1:row2, col1:col2, 1) = sRGB_Values(chipNumber, 1);
	      	rgbImage(row1:row2, col1:col2, 2) = sRGB_Values(chipNumber, 2);
		      rgbImage(row1:row2, col1:col2, 3) = sRGB_Values(chipNumber, 3);
		      chipNumber = chipNumber + 1;
	   end
end
imshow(rgbImage);
axis on;
fontSize = 12;
if displayLabels
	   chipNumber = 1;
	   for row = 1 : 4
		  row1 = rows(row) + chipWidth/2;
		      for col = 1 : 6
			         col1 = cols(col) + 3;
 
         			chipName = chipNames{chipNumber};
		         	textLabel = sprintf('%s\nR=%3d\nG=%3d\nB=%3d', chipName, sRGB_Values(chipNumber, 1), sRGB_Values(chipNumber, 2), sRGB_Values(chipNumber, 3));
 
		         	if sum(sRGB_Values(chipNumber, :)) > 470
			             text(double(col1), double(row1), textLabel, 'Color', 'k', 'FontSize', fontSize);
		         	else
             			text(double(col1), double(row1), textLabel, 'Color', 'w', 'FontSize', fontSize);
			         end
			         chipNumber = chipNumber + 1;
	     	end 
		end 
	set(gca, 'Units', 'Normalized', 'Position', [0.05 0.05 .9 .9]);
	fontSize = 14;
	yTextBottom = 15; %double(gridWidth)
	text(gridWidth, yTextBottom, 'Color Checker Chart', 'Color', 'w', 'FontSize', fontSize);
	yTextBottom = double(imageHeight - gridWidth/2);
	text(gridWidth, yTextBottom, 'X-Rite', 'Color', 'w', 'FontSize', fontSize);
end % of "if displayLabels"
 
% Enlarge window to full screen size.
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
drawnow;
 
promptMessage = sprintf('This is the Color Checker Color Rendition Chart\nusing sRGB color values as defined by X-Rite, Inc.\nwhich is the manufacturer.\n\n Do you want to save this image?');
titleBarCaption = 'Done.  Now Save Image?';
button = questdlg(promptMessage, titleBarCaption, 'Yes, Save', 'No, Quit', 'No, Quit');
if strcmp(button, 'No, Quit')
	   return;
end
promptMessage = sprintf('Do you want to save this image with or without the text?');
titleBarCaption = 'Save text annotations?';
button = questdlg(promptMessage, titleBarCaption, 'With Text', 'Without Text', 'With Text');
startingFolder = pwd;
defaultFileName = fullfile(startingFolder, 'Color Checker Chart.png');
[baseFileName, folder] = uiputfile(defaultFileName, 'Specify a file');
if baseFileName == 0
   	return;
end
fullFileName = fullfile(folder, baseFileName);
set(gcf, 'Pointer', 'watch');
drawnow;	
if exist(fullFileName, 'file')
   	recycle on; % Enable delete to send files to the recycle bin instead of making them totally vanish.
   	delete(fullFileName); % Do the actual delete (recycle).
end
if strcmp(button, 'Without Text')
	  imwrite(rgbImage, fullFileName);
	  message = sprintf('Image has been saved with imwrite() to file:\n\n%s', fullFileName);
else
	  hasExport_fig = ~isempty(which('export_fig'));
  	if hasExport_fig
		     axis('off');
		     export_fig(gca, fullFileName); 
		     message = sprintf('Image has been saved with export_fig() to file:\n\n%s', fullFileName);
	  else
	     saveas(gcf, fullFileName);
		    message = sprintf('Image has been saved with saveas() to file:\n\n%s', fullFileName);
	 end
end
msgbox(message);
set(gcf,'Pointer','arrow');
drawnow;	% Cursor won't change right away unless you do this.
