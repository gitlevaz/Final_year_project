clear all;
obj = webcam(2);
% obj.SelectedSourceName = 'input1';
% src_obj = getselectedsource(obj);
% get(src_obj)
preview(obj);
frame = getsnapshot(obj);
image(frame);
delete(obj);