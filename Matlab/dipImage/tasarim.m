function varargout = tasarim(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @deneme3_OpeningFcn, ...
                   'gui_OutputFcn',  @deneme3_OutputFcn, ...
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

function deneme3_OpeningFcn(hObject, eventdata, handles, varargin)
  handles.output = hObject;
  guidata(hObject, handles);
  
function varargout = deneme3_OutputFcn(hObject, eventdata, handles) 
  varargout{1} = handles.output;

function filter_Callback(hObject, eventdata, handles)
  a = get(handles.popmenu1,'value');
switch a
     case salt & paper
         
            axes(handles.axes2);
            
     case binary
         
            axes(handles.axes2);
       
     case gauss
         
            axes(handles.axes2);
       
	 case median
         
            axes(handles.axes2);
        
	otherwise
	
end

function choose_image_Callback(hObject, eventdata, handles)
  axes(handles.axes1);
  resim = imread('C:\Users\Didem\Documents\MATLAB\madlabodevi\Resimler\IMG-20140614-WA0004.jpg');
  imshow(resim);

function popupmenu1_Callback(hObject, eventdata, handles)
  a = get(handles.popmenu1, 'value');
switch a
     case salt & paper
        resim = imread('C:\Users\Didem\Documents\MATLAB\madlabodevi\Resimler\IMG-20140614-WA0004.jpg');
        resim = rgb2gray(resim);
        imshow(resim)
	
	case binary
        resim = imread('C:\Users\Didem\Documents\MATLAB\madlabodevi\Resimler\IMG-20140614-WA0004.jpg');
        resim = rgb2gray(resim);
        imshow(resim)
		
    case gauss
        resim = imread('C:\Users\Didem\Documents\MATLAB\madlabodevi\Resimler\IMG-20140614-WA0004.jpg');
        resim = rgb2gray(resim);
        imshow(resim);
	
	 case median
        %axes(handles.axes2);
        resim = imread('C:\Users\Didem\Documents\MATLAB\madlabodevi\Resimler\IMG-20140614-WA0004.jpg');
        resim = rgb2gray(resim);
        imshow(resim)
	
	otherwise
	
end

function popupmenu1_CreateFcn(hObject, eventdata, handles)

  if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
  end

function colorspace_Callback(hObject, eventdata, handles)

function lab_Callback(hObject, eventdata, handles)
  % handles    structure with handles and user data (see GUIDATA)

% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)

  if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
  end

% --- Executes on button press in detection.
function detection_Callback(hObject, eventdata, handles)

function uipanel2_CreateFcn(hObject, eventdata, handles)
