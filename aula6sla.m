clc
clear all;

syms f(t);
f(t) = cos(2*t);
fplot(f);

%%
pi_simb = sym(pi);
disp(pi_simb);

%% laplace
laplace(f(t));
disp(laplace(f(t)));

%% degrau
u(t) = heaviside(t);
disp(u(t));
disp(laplace(u(t)));

%% transfer function
% h = (laplace(f(t));
s = tf('s');
h = s/(s^2 + 4)

%impulse(h);
impulse(h,10);
step(h,10);

%% polos e zero
% 3s+4
% ------ 
% s³ + 5s² + 8s + 4
NUM = [3 4]
DEN = [1 5 8 4]

H = tf(NUM,DEN)

%% mapa de polos e zero
pzmap(H)
grid on;

%%
%%
%% exemplo
x = laplace(f(t))
NUM2 = [1 0]
DEN2 = [1 0 4]
H2 = tf(NUM2, DEN2)

%% automatizaçao
% limpa tela
clc

syms f(t)
f(t) = cos(2*t)

% f(t) eh symb
x = laplace(f(t))
[num,den] = numden(x)
NUM = sym2poly(num)
DEN = sym2poly(den)

Xtf = tf(NUM,DEN)

%%
H2 = tf([3 2],[1 5 8 4])

y = Xtf * H2

figure
impulse(Xtf,10,'k')
hold
impulse(y,10);

%%
figure
bode(y)
%%
bode(H2)
% saida pico/entrada pico
20*log10(0.35/1)
% = -9.11
%%
%pzmap(H2);
pzmap(y);