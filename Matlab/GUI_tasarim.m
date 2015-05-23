function varargout = deneme2(varargin)
    gui_Singleton = 1;
    gui_State = struct('gui_Name',  mfilename, ...
                      'gui_Singleton',  gui_Singleton, ...
                      'gui_OpeningFcn', @deneme2_OpeningFcn, ...
                      'gui_OutputFcn',  @deneme2_OutputFcn, ...
                      'gui_LayoutFcn',  [] , ...
                     'gui_Callback',   []);
    if nargin && ischar(varargin{1})
         gui_State.gui_Callback = str2func(varargin{1});
    end
 
    if nargout
        [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
    else
        gui_mainfcn(gui_State, varargin{:});
    end
    function deneme2_OpeningFcn(hObject, eventdata, handles, varargin)
        handles.output = hObject;
        guidata(hObject, handles);

    function varargout = deneme2_OutputFcn(hObject, eventdata, handles) 
        varargout{1} = handles.output;

    function resimsec_Callback(hObject, eventdata, handles)
        global im im2 im3 im4 im5 im6 im7 b
        [path,user_cance] = imgetfile();
    if user_cance
        return
    end
        im = imread(path);
        im2 = im;
        im3 = im;
        im4 = im;
        im5 = im;
        im6 = im;
        im7 = im;

        b = imfinfo(path);
    if strcmp(b.PhotometricInterpretation, 'RGB')
        im = rgb2gray(im);
        im = im2double(im);
        axes(handles.axes1);
        imshow(im2);
    else    
        im = im2double(im);
        axes(handles.axes1);
        imshow(im2);
    end

function pushbutton3_Callback(hObject, eventdata, handles)


% --- Executes on selection change in popupmenu3.    

function axes1_CreateFcn(hObject, eventdata, handles)
% --- Executes on selection change in popupmenu1.

function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)

if ispc && isequal(get(hObject, 'BackgroundColor'),  get(0, 'defaultUicontrolBackgroundColor'))
        set(hObject, 'BackgroundColor' , 'white');
end

% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)

if ispc && isequal(get(hObject, 'BackgroundColor'),  get(0, 'defaultUicontrolBackgroundColor'))
      set(hObject, 'BackgroundColor' , 'white');
end

% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)

% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
      set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in sobel.
function sobel_Callback(hObject, eventdata, handles)
% hObject    handle to sobel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        global im degisken
        imsob = edge(im,'sobel');
        degisken = imsob;
        axes(handles.axes2);
        imshow(imsob);

% --- Executes on button press in prewit.
function prewit_Callback(hObject, eventdata, handles)
% hObject    handle to prewit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        global im degisken
        impre=edge(im,'prewitt');
        degisken=impre;
        axes(handles.axes2);
        imshow(impre);

% --- Executes on button press in canny.
function canny_Callback(hObject, eventdata, handles)
% hObject    handle to canny (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        global im degisken
        imcan=edge(im,'canny');
        degisken=imcan;
        axes(handles.axes2);
        imshow(imcan);

% --- Executes on button press in rgb.
function rgb_Callback(hObject, eventdata, handles)
% hObject    handle to rgb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

       global im  degisken
       im2 = rgb2hsv(im);
       hsv_image = rgb2hsv(rgb_image);
       c = colorspace(im, 'RGB');
       [R G B] = hsv2rgb(im);
       axis(handles.axes2);
       imshow([R G B]);
       hsv = rgb2hsv(im);
       h = hsv(:, :, 1);       % Hue image.
       s = hsv(:, :, 2);       % Saturation image.
       v = hsv(:, :, 3);       % Value (intensity) image.
       global im degisken
       gry = rgb2gray(im);
       axes(handles.axes2);
       imshow(gry);
        
% --- Executes on button press in hsv.
function hsv_Callback(hObject, eventdata, handles)
% hObject    handle to hsv (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
       global im im2 degisken 
       [H S V] = rgb2hsv(im);
       axis(handles.axes2);
       imshow([H S V]);
       global Img Img6
       im2 = rgb2hsv(im);
       axes(handles.axes2);
       imshow(im2);

% --- Executes on button press in lab.
function lab_Callback(hObject, eventdata, handles)
% hObject    handle to lab (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% c = colorspace(im,'RGB')
        global im degisken
        c = colorspace(im,'Lab');
        axis(handles.axes2);
        imshow(c);
        imshow(c(:, :, 1), []);

% --- Executes on button press in tuzbiber.
function tuzbiber_Callback(hObject, eventdata, handles)
% hObject    handle to tuzbiber (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        global im degisken
        axes(handles.axes2);
        im2 = imnoise(im,'salt & pepper',0.02);
        imshow(im2);

% --- Executes on button press in binary.
function binary_Callback(hObject, eventdata, handles)
% hObject    handle to binary (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    
       global im degisken
       BW = im2bw(im, graythresh(im));
       axes(handles.axes2);
       imshow(BW);
    
% --- Executes on button press in madian.
function madian_Callback(hObject, eventdata, handles)
% hObject    handle to madian (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
       global im6 b degisken
       if strcmp(b.PhotometricInterpretation, 'RGB')
            A = im6;
            A = rgb2gray(A);
            A = imnoise(A, 'salt & pepper', 0.02);
       else
            A = im6;
            A = imnoise(A, 'salt & pepper', 0.02);
       end
       modifyA = zeros(size(A) + 2);
       B = zeros(size(A));

        %COPY THE ORIGINAL IMAGE MATRIX TO THE PADDED MATRIX
        for x = 1:size(A, 1)
            for y = 1:size(A, 2)
                modifyA(x + 1, y + 1)=A(x, y);
            end
        end
      %LET THE WINDOW BE AN ARRAY
      %STORE THE 3-by-3 NEIGHBOUR VALUES IN THE ARRAY
      %SORT AND FIND THE MIDDLE ELEMENT
       
for i = 1:size(modifyA, 1) - 2
    for j = 1:size(modifyA, 2) - 2
            window = zeros(9, 1);
            inc = 1;
            for x = 1:3
                for y = 1:3
                    window(inc) = modifyA(i + x - 1, j + y - 1);
                    inc = inc + 1;
                end
            end
      med = sort(window);
      %PLACE THE MEDIAN ELEMENT IN THE OUTPUT MATRIX
      B(i, j) = med(5);
    end
end

%CONVERT THE OUTPUT MATRIX TO 0-255 RANGE IMAGE TYPE
B = uint8(B);
axes(handles.axes1);
imshow(im6);
figure, subplot(1, 2, 1), imshow(A), title('tuz & biber gürültüsü');
subplot(1, 2, 2), imshow(B), title('median gürültüsü');

% --- Executes on button press in gauss.
function gauss_Callback(hObject, eventdata, handles)
% hObject    handle to gauss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

        global im2 degisken
        gaussian = fspecial('gaussian', [3 3], 10);
        imgaus = imfilter(im2, gaussian);
        degisken = imgaus;
        axes(handles.axes2);
        imshow(imgaus);
        
% --- Executes on button press in cikis.
function cikis_Callback(hObject, eventdata, handles)
% hObject    handle to cikis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        delete(handles.figure1)

% --- Executes on button press in kaydet.
function kaydet_Callback(hObject, eventdata, handles)
% hObject    handle to kaydet (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
        global degisken
        [FileName, PathName] = uiputfile('filtre.png', 'Farklı Kaydet'); 
        Name = fullfile(PathName, FileName);  
        imwrite(degisken, Name, 'png');
