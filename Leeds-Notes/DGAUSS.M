function w = dgauss(N)

%	function w = dgauss(N) returns a truncated
% 	gaussian window of length N

a=2.5;
m=[0:N-1];
t=(m-(N-1)/2)/(N-1);
m=m+1;
b=2.0*a*t;
c=b.*b;
w(m)=exp(-0.5*c);
w=w';
