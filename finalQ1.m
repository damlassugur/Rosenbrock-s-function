
%% 01.07.2020
clear all;
clc;
close all;
format long g

f =@(x,y)((x-1).^2 + 5.*(y-4*x.^2).^2);
%gradient
dx = @(x,y)(320*x^3+2*x-2-8*x*y);
dy = @(x,y)(10*y-80*x*y);
%hessian
dxx= @(x,y)(960*x^2+2-8*y);
dxy=@(x)(-8*x);
dyx=@(y)(-80*y);
dyy=@(x)(10-80*x);

x(1)=0.5;
y(1)=2;
x(2)=0.125;
y(2)=-1.125;
%gradient matrix
j=[dx(x(1),y(1)),dy(x(1),y(1))]
%hessian matrix
H=[dxx(x(1),y(1)),dxy(x(1));dyx(y(1)),dyy(x(1))]
%for minimum points
H1=[dxx(x(2),y(2)),dxy(x(2));dyx(y(2)),dyy(x(2))]
j1=[dx(x(2),y(2)),dy(x(2),y(2))]
%eigenvalues of hessian
e=eig(H1)
d=[1;1];
alpha=0;
%defining d based functions ?(??+??).
xd=@(d) x(1)+d*alpha;
yd=@(d) y(1)+d*alpha;
fd=@(d) f(xd(d),yd(d))
     val=fminsearch(fd,0)
     %alpha=val

