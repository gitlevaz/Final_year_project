function [F]=FeatureStatistical(go)
%im=double(im);
% m=mean(mean(im));
% s=std(std(im));


m=mean2(go);
 s=std2(go);
F=[m s];