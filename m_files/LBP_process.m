clc, clear, close all;
addpath ("returnlink\");
load ("DVB_H_10.mat");
H = DVB_H;

load ("LDPCcode&CodeDeIW.mat");
[iter, recoverData] = my_LBP (CodeDeIW, H, 30, 0.8, LDPCcode);