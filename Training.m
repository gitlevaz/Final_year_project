clc;
close all;
[fname,path]=uigetfile('*.pgm','open a face as input for Training');
fname=strcat(path,fname);
im=imread(fname);
imshow(im);
title('Input face');
c=input('Enetr the Person ( Number from 1-10)');
%
F=FeatureStatistical(im);
try
    load db;
    F=[F c];
    db=[db;F];
    save db.mat db
catch
    db=[F c]; % 10 12 1
    save db.mat db
    
end