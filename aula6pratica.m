clc
clear all
close all

%%
syms x(t) u(t);
x(t) = 0.2*sin(2*t)+1
u(t) = heaviside(t)
time = 20;

figure
fplot(x(t), [0 20])

X = laplace(x(t))

[n,d] = numden(X)
NUM = sym2poly(n)
DEN = sym2poly(d)

Xtf = tf(NUM,DEN)
%xtf = tf([asdasd],[asdsa])

% 5
% ------
% s² + s + 2
H = tf([5],[1 1 2])

figure
pzmap(H)


figure
y = Xtf * H
impulse(y,time)
hold
step(y,time)

figure
bode(H)

figure
pzmap(y)