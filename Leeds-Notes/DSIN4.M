function w = dsin4(N)
%	This function w = dsin4(N) returns a sine to the
%       fourth power window of length N.

t=[0:N-1]/(N-1);
w=sin(pi*t).^4;
w=w';

