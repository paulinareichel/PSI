%%
clear all; close all; clc;
net=newp([0 1; -2 2],1);
x=[0 0 1 1; 0 1 0 1];
t=[1 0 0 1]
net= init(net);
before=sim(net,x);
net.trainParam.epochs=15

net=train(net,x,t);
after=sim(net,x)