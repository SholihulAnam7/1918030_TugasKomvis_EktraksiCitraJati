function varargout = ektraksicitrajati(varargin)
% EKTRAKSICITRAJATI MATLAB code for ektraksicitrajati.fig
%      EKTRAKSICITRAJATI, by itself, creates a new EKTRAKSICITRAJATI or raises the existing
%      singleton*.
%
%      H = EKTRAKSICITRAJATI returns the handle to a new EKTRAKSICITRAJATI or the handle to
%      the existing singleton*.
%
%      EKTRAKSICITRAJATI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EKTRAKSICITRAJATI.M with the given input arguments.
%
%      EKTRAKSICITRAJATI('Property','Value',...) creates a new EKTRAKSICITRAJATI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ektraksicitrajati_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ektraksicitrajati_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ektraksicitrajati

% Last Modified by GUIDE v2.5 28-May-2022 09:16:07

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ektraksicitrajati_OpeningFcn, ...
                   'gui_OutputFcn',  @ektraksicitrajati_OutputFcn, ...
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


% --- Executes just before ektraksicitrajati is made visible.
function ektraksicitrajati_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ektraksicitrajati (see VARARGIN)

% Choose default command line output for ektraksicitrajati
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ektraksicitrajati wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ektraksicitrajati_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile('*.jpg');
 
if ~isequal(filename,0)
    Img = imread(fullfile(pathname,filename));
    axes(handles.axes1)
    imshow(Img)
else
    return
end
 
handles.Img = Img;
guidata(hObject, handles)

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Img = handles.Img;
 
Img_gray = rgb2gray(Img);
axes(handles.axes2)
imshow(Img_gray)
 

 
handles.Img_gray = Img_gray;
guidata(hObject, handles)


function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open=guidata(gcbo);
gray = handles.Img_gray;
t=graythresh(gray);
biner=im2bw(gray,t);
set(open.figure1,'CurrentAxes',open.axes3);
set(imagesc(biner));colormap('gray');
set(open.axes3,'Userdata',biner);
open=guidata(gcbo);
a = handles.Img;
b = rgb2gray(a);
level = graythresh(b);
c = im2bw(b,level);
area = bwarea(c);
perim = bwperim(c);
perimeter = sum (sqrt(sum(area,2)));
set(open.edit2,'string',area);
set(open.edit1,'string',bwarea(perim));


function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
