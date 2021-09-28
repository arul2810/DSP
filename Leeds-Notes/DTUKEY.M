function w = dtukey(N)
%	function w=dtukey(N) returns a tukey (50 per cent
%       cosine taper) window of length N.
%       NOT FINISHED YET - MISTAKE IN HARRIS'S PAPER

a=0.5;
b=fix(a*N/2);
c=N/2-b-1;
for n=0:N-1
  l=n+1;
   m= (n-(N-1)/2)/(N-1);
  if n <= c
     n1=m-a/2;
     d1=(1-a);
     w(l)=0.5*(1.0+cos(pi*n1/d1));
  elseif (c<=n<=(N-1-c))
     w(l)=1.0;
  else
     w(l)=0.5*(1.0+cos(pi*n1/d1));
   end
end

