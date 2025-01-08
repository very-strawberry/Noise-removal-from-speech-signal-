%clc;
close all;
warning off;
Fs=8000;
ch=1; %number of channels(mono or stereo)
datatype='uint8'; 
nbits=16;
Nseconds=10; 
recorder=audiorecorder(Fs,nbits,ch);
disp('start speaking');
recordblocking(recorder,Nseconds');
disp('end of recording');
x=getaudiodata(recorder,datatype);
%converting audio to a numerical array
audiowrite('test.wav',x,Fs);