function w = dflattop(N);
%	function w=dflattop(N) returns a flat-top	
%	window of length N

m=[0:N-1];
t=m/(N-1);
m=m+1;    %zero indxes not allowed for matrices
w(m) = 1-1.93*cos(2*pi*t)+1.29*cos(4*pi*t)...
        -0.388*cos(6*pi*t)+0.0322*cos(8*pi*t);
w=w';

