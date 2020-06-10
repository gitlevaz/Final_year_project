function varargout = Login(varargin)
% LOGIN MATLAB code for Login.fig
%      LOGIN, by itself, creates a new LOGIN or raises the existing
%      singleton*.
%
%      H = LOGIN returns the handle to a new LOGIN or the handle to
%      the existing singleton*.
%
%      LOGIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LOGIN.M with the given input arguments.
%
%      LOGIN('Property','Value',...) creates a new LOGIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Login_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Login_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Login

% Last Modified by GUIDE v2.5 05-Aug-2017 12:07:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Login_OpeningFcn, ...
                   'gui_OutputFcn',  @Login_OutputFcn, ...
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


% --- Executes just before Login is made visible.
function Login_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Login (see VARARGIN)

% Choose default command line output for Login
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Login wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global hobject;
handles.output = hobject;
axes(handles.app);
vid = videoinput('winvideo',1);
hImage = image(zeros(720,1280,3),'Parent',handles.app);
preview(vid,hImage);

% --- Outputs from this function are returned to the command line.
function varargout = Login_OutputFcn(hObject, eventdata, handles) 
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



% % % function edit2_Callback(hObject, eventdata, handles)
% % % % hObject    handle to edit2 (see GCBO)
% % % % eventdata  reserved - to be defined in a future version of MATLAB
% % % % handles    structure with handles and user data (see GUIDATA)
% % % 
% % % % Hints: get(hObject,'String') returns contents of edit2 as text
% % % %        str2double(get(hObject,'String')) returns contents of edit2 as a double
% % % 
% % % 
% % % % --- Executes during object creation, after setting all properties.
% % % function edit2_CreateFcn(hObject, eventdata, handles)
% % % % hObject    handle to edit2 (see GCBO)
% % % % eventdata  reserved - to be defined in a future version of MATLAB
% % % % handles    empty - handles not created until after all CreateFcns called

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
global im im2
global faceImage;
global facedetector;
global BBOX;
global Box;
global new;
global string;
global db;


a = getframe(handles.app);
Image = frame2im(a);
imwrite(Image, 'Image.jpg');
% image get into frame
im=imread('Image.jpg');
im=im2double(im);
im2=im;


% Face Detecting

facedetector = vision.CascadeObjectDetector();
BBOX = step(facedetector, im)
% crop image into reptangle
Box = insertObjectAnnotation(im,'rectangle',BBOX,'User');
new = size(BBOX, 1);
string = num2str(new);
faceImage = imcrop(im, BBOX(1,:));
axes(handles.app);


%Greyscaling the Image
imgray = (faceImage(:,:,1)+faceImage(:,:,2)+faceImage(:,:,2))/3;
axes(handles.app);
imshow(imgray);
% save gray image in database
imwrite(imgray,'Faces/face.jpg');

%Recognition
Ftest=FeatureStatistical(im);
load db.mat
Ftrain=db(:,1:2);
Ctrain=db(:,3);
for(i=1:size(Ftrain,1))
dist(i,:)=sum(abs(Ftrain(i,:)-Ftest));
end
Min=min(dist);
if(Min<9)
m=find(dist==Min,1);
det_class=Ctrain(m);
msgbox(strcat('Person is detected =', num2str(det_class)));
set(handles.edit1,'String',num2str(det_class));
run lms;
else
    msgbox('This person is not registered');
end
% Saving face data to database
a = getframe(handles.app);
Image = frame2im(a);
imwrite(Image, 'Image.jpg');
im=imread('Image.jpg');
im=im2double(im);
im2=im;

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
% % % --- Register button Executes on button press in pushbutton3.
% % function pushbutton3_Callback(hObject, eventdata, handles)
% % % hObject    handle to pushbutton3 (see GCBO)
% % % eventdata  reserved - to be defined in a future version of MATLAB
% % % handles    structure with handles and user data (see GUIDATA)
% % close;
% % run Register;

% --- Executes when uipanel1 is resized.
function uipanel1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipanel1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
