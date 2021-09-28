function w = driesz(N)
%	This function w = driesz(N) returns a
%	Parzen window of N points

m=[0:N-1];
t=(m-(N-1)/2)/(N-1);
a=2*t;
b=a.*a;
w=1-b;
w=w';
