function w=dnuttall(N);
%		This function returns an N-point
%		Nuttall window of four terms.


m=[0:N-1];
t=(m-(N-1)/2)/(N-1);
m=m+1;
w(m)= 0.3635819+0.4891775*cos(2*pi*1*t)+0.1365995*cos(2*pi*2*t)+...
0.0106411*cos(2*pi*3*t);
w=w';

