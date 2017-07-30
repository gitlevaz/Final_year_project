function varargout = Register(varargin)
% REGISTER MATLAB code for Register.fig
%      REGISTER, by itself, creates a new REGISTER or raises the existing
%      singleton*.
%
%      H = REGISTER returns the handle to a new REGISTER or the handle to
%      the existing singleton*.
%
%      REGISTER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in REGISTER.M with the given input arguments.
%
%      REGISTER('Property','Value',...) creates a new REGISTER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Register_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Register_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Register

% Last Modified by GUIDE v2.5 11-Jul-2017 03:28:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Register_OpeningFcn, ...
                   'gui_OutputFcn',  @Register_OutputFcn, ...
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


% --- Executes just before Register is made visible.
function Register_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Register (see VARARGIN)


% Choose default command line output for Register
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Register wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global hobject;
handles.output = hobject;
axes(handles.axes1);
vid = videoinput('winvideo',1);
hImage = image(zeros(720,1280,3),'Parent',handles.axes1);
preview(vid,hImage);

% --- Outputs from this function are returned to the command line.
function varargout = Register_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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






% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global db;
global im
% global defaultans;
% global prompt;

%global num_line;
% prompt = 'Enter Username';
% c = inputdlg(prompt);

%c=input('Enter Customer Name');
c= str2num(get(handles.edit1,'String'));
F=FeatureStatistical(im);   %Face details extrating
try
    load db;
    F=[F c];
    db=[db;F];          %Saving to the database
    save db.mat db
catch
    db=[F c]; % 10 12 1
    save db.mat db
    
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im im2
global faceImage;
global facedetector;
global BBOX;
global Box;
global new;
global string;

%Image Capturing
% a = getframe(handles.axes1);
% Image = frame2im(a);
% imwrite(Image, 'Image.jpg');
% 
% 
% im=imread('Image.jpg');
% im=im2double(im);
% im2=im;

cam=videoinput('winvideo',2,'USB2.0 PC CAM')
preview(cam)
start(cam)
frame=getsnapshot(cam);
imshow(frame);

% Face Detecting

facedetector = vision.CascadeObjectDetector();
BBOX = step(facedetector, im)
Box = insertObjectAnnotation(im,'rectangle',BBOX,'User');
new = size(BBOX, 1);
string = num2str(new);
faceImage = imcrop(im, BBOX(1,:));
axes(handles.axes1);





