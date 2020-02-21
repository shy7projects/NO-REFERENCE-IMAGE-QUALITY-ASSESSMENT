function varargout = noreference(varargin)
% NOREFERENCE MATLAB code for noreference.fig
%      NOREFERENCE, by itself, creates a new NOREFERENCE or raises the existing
%      singleton*.
%
%      H = NOREFERENCE returns the handle to a new NOREFERENCE or the handle to
%      the existing singleton*.
%
%      NOREFERENCE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NOREFERENCE.M with the given input arguments.
%
%      NOREFERENCE('Property','Value',...) creates a new NOREFERENCE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before noreference_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to noreference_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help noreference

% Last Modified by GUIDE v2.5 25-Jan-2020 21:46:37

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @noreference_OpeningFcn, ...
                   'gui_OutputFcn',  @noreference_OutputFcn, ...
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


% --- Executes just before noreference is made visible.
function noreference_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to noreference (see VARARGIN)

% Choose default command line output for noreference
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes noreference wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = noreference_OutputFcn(hObject, eventdata, handles) 
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
global im im2
[path,user_cance]=imgetfile();
if user_cance
    msgbox(sprintf('Pick image from file please.'),'Error','Error');
    return
end
im=imread(path);
axes(handles.axes1);
imshow(im);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im im2
[path,user_cance]=imgetfile();
if user_cance
    msgbox(sprintf('Pick image from file please.'),'Error','Error');
    return
end
im2=imread(path);
axes(handles.axes2);
imshow(im2);



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


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.radiobuttonBIQI, 'Value') == get(handles.radiobuttonBIQI, 'Max'))
        global im im2
        Quality_Score = jpeg_quality_score(im)
        set(handles.edit1,'string',Quality_Score);
elseif (get(handles.radiobuttonNIQE, 'Value') == get(handles.radiobuttonNIQE, 'Max'))
        global im im2
            load modelparameters.mat
 
                blocksizerow    = 96;
                blocksizecol    = 96;
                blockrowoverlap = 0;
                blockcoloverlap = 0;


quality = computequality(im,blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap, ...
    mu_prisparam,cov_prisparam)
 
     set(handles.edit1,'string',quality);
elseif (get(handles.radiobuttonBRISQUE, 'Value') == get(handles.radiobuttonBRISQUE, 'Max'))
        global im im2
        qualityscore = brisquescore(im)
        set(handles.edit1,'string',qualityscore);
elseif (get(handles.radiobuttonPIQE, 'Value') == get(handles.radiobuttonPIQE, 'Max'))
        global im im2
        score = piqe(im);
        set(handles.edit1,'string',score);
elseif (get(handles.radiobutton5, 'Value') == get(handles.radiobutton5, 'Max'))
        global im im2
        blur = blurMetric(im)
        set(handles.edit1,'string',blur);
elseif (get(handles.radiobutton6, 'Value') == get(handles.radiobutton6, 'Max'))
        global im im2
        I = rgb2gray(im);
        Sigma=estimate_noise(I);
        set(handles.edit1,'string',Sigma);
elseif (get(handles.radiobutton7, 'Value') == get(handles.radiobutton7, 'Max'))
        global im im2
        quality = jpegartifacts(im)
%murat akozlu: iwant to create quality assessment algorithm such as like that
%and my code will measure just 192x192 pixels area because of if user pick
%small picture it may cause always zero mean value which has no pixel value
%than 192x192. but of course i can write more than this easly.

set(handles.edit1,'string',quality);      


end


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(handles.radiobuttonBIQI, 'Value') == get(handles.radiobuttonBIQI, 'Max'))
        global im im2
        Quality_Score = jpeg_quality_score(im2)
        set(handles.edit2,'string',Quality_Score);
    elseif (get(handles.radiobuttonNIQE, 'Value') == get(handles.radiobuttonNIQE, 'Max'))
             global im im2
                     load modelparameters.mat
 
                        blocksizerow    = 96;
                        blocksizecol    = 96;
                        blockrowoverlap = 0;
                        blockcoloverlap = 0;
        

quality = computequality(im2,blocksizerow,blocksizecol,blockrowoverlap,blockcoloverlap, ...
    mu_prisparam,cov_prisparam)
 
     set(handles.edit2,'string',quality);
elseif (get(handles.radiobuttonBRISQUE, 'Value') == get(handles.radiobuttonBRISQUE, 'Max'))
             global im im2
                qualityscore = brisquescore(im2)
                set(handles.edit2,'string',qualityscore);
elseif (get(handles.radiobuttonPIQE, 'Value') == get(handles.radiobuttonPIQE, 'Max'))
        global im im2
        score = piqe(im2);
        set(handles.edit2,'string',score);
elseif (get(handles.radiobutton5, 'Value') == get(handles.radiobutton5, 'Max'))
        global im im2
        blur = blurMetric(im2)
        set(handles.edit2,'string',blur);
elseif (get(handles.radiobutton6, 'Value') == get(handles.radiobutton6, 'Max'))
        global im im2
        I = rgb2gray(im2);
        Sigma=estimate_noise(I);
        set(handles.edit2,'string',Sigma);
elseif (get(handles.radiobutton7, 'Value') == get(handles.radiobutton7, 'Max'))
        global im im2
        quality = jpegartifacts(im2)
        set(handles.edit2,'string',quality);    


end
