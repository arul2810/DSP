function w=dkaisbess(N)
%	This function w=dkaisbess(N) returns a four term
% 	Kaiser-Bessel window.

a0=0.40243;
a1=0.49804;
a2=0.09831;
a3=0.00122;
t=[0:N-1]/(N-1);
w=a0 - a1*cos(2*pi*t)+a2*cos(4*pi*t)-a3*cos(6*pi*t);
w=w';

      
