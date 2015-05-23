function varargout = gui_tasarim(varargin)
% GUI_TASARIM M-file for gui_tasarim.file

% Last Modified by GUIDE v2.5 24-Dec-2014 21:19:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_tasarim_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_tasarim_OutputFcn, ...
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
% End initialization code - DO NOT EDIT

% --- Executes just before gui_tasarim is made visible.
function denem1_OpeningFcn(hObject, eventdata, handles, varargin)

% Choose default command line output for gui_tasarim
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = gui_tasarim_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

display('goodbye');
close(gcf);

% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
button_state = get(hObject,'Value');
if button_state == get(hObject, 'Max')
	msgbox('down');
elseif button_state == get(hObject, 'Min')
	msgbox('up');
end

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
  button_state = get(hObject,'Value');
  if button_state == get(hObject,'Max')
  	msgbox('kadın');
  elseif button_state == get(hObject,'Min')
  	msgbox('erkek');
  end
