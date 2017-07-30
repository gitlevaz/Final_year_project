function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 18-Jul-2017 20:56:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% standard size of image is 300 *300
global co
clc
warning off
st = version;
if str2double(st(1)) < 8 
    beep
    hx  = msgbox('PLEASE RUN IT ON MATLAB 2013 or Higher','INFO...!!!','warn','modal');
    pause(3)
    delete(hx)
    close(gcf)
    return
end
co = get(hObject,'color');
addpath(pwd,'database','codes')
if size(ls('database'),2) == 2
    delete('features.mat');
    delete('info.mat');
end
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
p  = get(handles.edit1,'UserData');
if strcmp(p,'123') == 1
    delete(hObject);
    delete(handles.pushbutton2)
    delete(handles.edit1);
    delete(handles.text2);
    delete(handles.text3);
    delete(handles.text1);
    delete(handles.text4);
    msgbox('You must Register befor Login','HELP....!!!','help','modal')
    set(handles.Login,'enable','on')
    set(handles.Register,'enable','on')
    set(handles.Exam,'enable','on')
    set(handles.Result,'enable','on')
    set(handles.RESET_ALL,'enable','on')
    set(handles.EXI_T,'enable','on')
    set(handles.HE_LP,'enable','on')
    set(handles.DATA_BASE,'enable','on')
    set(handles.text5,'visible','on')
else
    msgbox('INVALID PASSWORD FRIEND... XX','WARNING....!!!','warn','modal')
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close gcf

% --------------------------------------------------------------------
function Login_Callback(hObject, eventdata, handles)
% hObject    handle to Login (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run Login;


% --------------------------------------------------------------------
function Register_Callback(hObject, eventdata, handles)
% hObject    handle to Register (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run Register;

% --------------------------------------------------------------------
function Exam_Callback(hObject, eventdata, handles)
% hObject    handle to Exam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run Login;

% --------------------------------------------------------------------
function Result_Callback(hObject, eventdata, handles)
% hObject    handle to Result (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run Login;

% % --------------------------------------------------------------------
% function DATA_BASE_Callback(hObject, eventdata, handles)
% % hObject    handle to DATA_BASE (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% 
% % --------------------------------------------------------------------
% function RESET_ALL_Callback(hObject, eventdata, handles)
% % hObject    handle to RESET_ALL (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function EXI_T_Callback(hObject, eventdata, handles)
% hObject    handle to EXI_T (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





% % --------------------------------------------------------------------
% function READ_ME_Callback(hObject, eventdata, handles)
% % hObject    handle to READ_ME (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% winopen('help.pdf')



% --- Executes on key press with focus on edit1 and none of its controls.
function edit1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
pass = get(handles.edit1,'UserData');
v = double(get(handles.figure1,'CurrentCharacter'));
if v == 8
    pass = pass(1:end-1);
    set(handles.edit1,'string',pass)
elseif any(v == 65:90) || any(v  == 97:122) || any(v == 48:57)
    pass = [pass  char(v)];
elseif v == 13
    p  = get(handles.edit1,'UserData');
    if strcmp(p,'123') == true
        delete(hObject);
        delete(handles.pushbutton2)
        delete(handles.pushbutton1);
        delete(handles.text2);
        delete(handles.text3);
        delete(handles.text1);
        delete(handles.text4);
        msgbox('WHY DONT U READ HELP BEFORE STARTING','HELP....!!!','help','modal')
        set(handles.Login,'enable','on')
        set(handles.Register,'enable','on')
        set(handles.Exam,'enable','on')
        set(handles.Result,'enable','on')
        set(handles.RESET_ALL,'enable','on')
        set(handles.EXI_T,'enable','on')
        set(handles.HE_LP,'enable','on')
        set(handles.DATA_BASE,'enable','on')
        set(handles.text5,'visible','on')
        return
    else
        beep
        msgbox('INVALID PASSWORD FRIEND... XX','WARNING....!!!','warn','modal')
        uiwait;
        set(handles.edit1,'string','')
        return
    end
else
    msgbox({'Invalid Password Character';'Can''t use Special Character'},'warn','modal')
    uiwait;
    set(handles.edit1,'string','')
    return
end
set(handles.edit1,'UserData',pass)
set(handles.edit1,'String',char('*'*sign(pass)))


% --------------------------------------------------------------------
function VI_EW_Callback(hObject, eventdata, handles)
% hObject    handle to VI_EW (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
run Login; 

f = dir('database');
if length(f) == 2
    msgbox('YOUR DATA BASE HAS NO IMAGE TO DISPLAY','SORRY','modal')
    return
end
l = length(f)-2;
while 1
    a = factor(l);
    if length(a) >= 4
        break
    end
    l = l+1;
end
d  = a(1: ceil(length(a)/2));
d = prod(d);
d1 = a(ceil(length(a)/2)+1  : end);
d1 = prod(d1);
zx = sort([d d1]);
figure('menubar','none','numbertitle','off','name','Images of Database','color',[0.0431  0.5176  0.7804],'position',[300 200 600 500])
for k = 3:length(f)
    im = imread(f(k).name);
    subplot(zx(1),zx(2),k-2)
    imshow(im)
    title(f(k).name,'fontsize',10,'color','w')
end






% % --------------------------------------------------------------------
% function ATTENDENCE_Callback(hObject, eventdata, handles)
% % hObject    handle to ATTENDENCE (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% if  exist('attendence_sheet.txt','file') == 2
%     winopen('attendence_sheet.txt')
% else
%     msgbox('NO ATTENDENCE SHEET TO DISPLAY','INFO...!!!','HELP','MODAL')
% end
% 
% % --------------------------------------------------------------------
% function DEL_ATTENDENCE_Callback(hObject, eventdata, handles)
% % hObject    handle to DEL_ATTENDENCE (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% if  exist('attendence_sheet.txt','file') == 2
%    delete('attendence_sheet.txt')
%    msgbox('ATTENDENCE DELETED','INFO...!!!','MODAL')
% else
%     msgbox('NO ATTENDENCE SHEET TO DELETE','INFO...!!!','HELP','MODAL')
% end


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x  = questdlg({'Resetting will Clear the followings: ';'1. Attendence_sheet';'2. Database';'3. features.mat';'4. Info.mat';'Do u want to continue?'},'Please select...!!');
if strcmpi(x,'yes') == 1
    delete('attendence_sheet.txt')
    delete('features.mat')
    delete('info.mat')
    cd ([pwd, '\database'])
    f = dir(pwd);
    for k = 1:length(f)
        delete(f(k).name)
    end
    cd .. 
    cla(handles.axes1);
    reset(handles.axes1);
    set(handles.axes1,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
    cla(handles.axes2);
    reset(handles.axes2);
    set(handles.axes2,'box','on','xcolor','w','ycolor','w','xtick',[],'ytick',[],'color',[0.0431  0.5176  0.7804],'linewidth',1.5)
    set(handles.text5,'string','')
    beep
    msgbox('All Reset','Info','modal')
end





% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, ~)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
