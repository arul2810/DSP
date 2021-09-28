% 		
%  ------------------------------------------------------------------------
%  
%
%       This introductory program D_FILTER_A_COS.M takes a cosine
% 		x(t) = cos(2pi Fo t)u(t), sampled at Fs=4000Hz and filters 
%       it with a second-order IIR filter implemented as a linear 
%       difference equation. You are asked to input the five coeffs
%       of the second-order filter. You are then asked to enter a value
%       'F0' for the frequency the input cosine, which will be < 500 Hz. 
%       The program plots the input x(n), the impulse response of 
%       the filter h(n), the magnitude and phase response of the filter and 
%       finally, the filter output y(n). You are simply to look at the magnitude
%       and phase response plots and try and predict what y(n) should look like, given
%       the particular frequency of the input signal.
%
%       Then see if you are correct from the time-domain output.
%
%       The ouput should be a sampled version of |H(exp(j2pifT))|cos(2pift +
%       phi(f)), where phi(f) = angle[H(exp(j2pifT))}
%
%       NOMENCLATURE
%       ------------
%       0 < Fo < 500Hz  (to get enough samples per cycle for plotting, because if we go to 2000Hz it will not look good) 
%       Fs=1/T = 4000Hz
%       x(n)= cos(2pi nT)u(n), n=0,1, ... , N-1
%	    y(n)= a0*x(n)+a1*x(n-1)+a2*x(n-2)-b1*y(n-1)-b2*y(n-2), n=0,1, ... ,N-1
%       H(z)=(a0 + a1z-1 + a2z-2)/(1 + b1z-1 + b2z-2)
%       |H(exp(j2pifT))|, 0 =< f <= 2000Hz,  is the magnitude response
%       phi(f) = angle[H(exp(j2pifT))}], 0 =< f <=2000Hz,  is the phase response
%
%		TRY AND PREDICT THE RESULTS IN ADVANCE BY USING PEN AND PAPER! 
%
%  ------------------------------------------------------------------------
%  
%
%
%

help dfilter_a_cos.m, pause

close all		          % closes all windows
clear all


while 1==1		          % continually repeat program


Fs=4000;
              


while 1
		Fo=input('		Choose the frequency (Fo) in Hz of cosine input 0<Fo<500 (try 80Hz) : ');
		if(Fo>0&Fo<500),break,end
end

T1=input('       Choose the duration (T1) in seconds of the cosine input (try 0.1 secs): ');    % sets up length of input in secs

t=[0:1/Fs:T1];   % sampled time vector
x=cos(2*pi*Fo*t);  % input vector


disp(' ')

disp(' ')
disp('   You will now enter the coefficients for the system function, H(z), for a ')
disp('   second-order system:')
disp(' ')
disp(' ')
disp('               H(z)=(a0 + a1z-1 + a2z-2)/(1 + b1z-1 + b2z-2)' )
disp('   ')
disp('   which correspons to the following (recursive) linear difference equation')
disp('  ')
disp('               y(n)=a0*x(n)+a1*x(n-1)+a2*x(n-2)-b1*y(n-1)-b2*y(n-2)' )
disp('	                 ')
disp(' ')
disp(' '),pause



flag11=1;
	while flag11==1
disp(' ')
disp('		Enter the coefficients of a STABLE second-order system  ')
disp('		------------------------------------------------------  ')
disp(' ')

a(1)=input('		Choose the value for the feedforward coefficient a0 (try 1):   ');
a(2)=input('		Choose the value for the feedforward coefficient a1 (try 0):   ');
a(3)=input('		Choose the value for the feedforward coefficient a2 (try 0):   ');
b(2)=input('		Choose the value for the feedback coefficient b1 (try -0.9):   ');
b(3)=input('		Choose the value for the feedback coefficient b2 (try 0):   ');
b(1)=1;

% Check for stability

z=roots(b);

if((abs(z(1))>=1)|(abs(z(2))>=1))

disp(' ')
disp('		---------------------------------------------------------------------  ')
disp(' 		You have entered the coefficients for an unstable system! Please retry. ')
disp('		---------------------------------------------------------------------  ')
pause,home
disp(' ')
disp('		y(n)=a0*x(n)+a1*x(n-1)+a2*x(n-2)' )
disp('		            -b1*y(n-1)-b2*y(n-2)' )
disp(' ')

else,flag11=0;end
    end

close all

% PLOT x(n) = COS(2piFonT)
x=cos(2*pi*Fo*t);
figure(1)
plot(t,x,'b'),grid
xlabel('TIME t')
ylabel('x(t)')
title('COSINE INPUT x(t) = cos(2piFot)u(t)'),pause



% calculate the magnitude and angles of the poles and zeros of H(z)
% and plot the result in the z-plane.

zero=roots(a);
pole=roots(b);

% ensure that poles and zeros that coincide are cancelled out and not plotted
if zero(1)==pole(1)
   zero=zero(2)
   pole=pole(2)
	elseif zero(1)==pole(2)
   zero=zero(2)
   pole=pole(1)
	elseif zero(2)==pole(1)
   zero=zero(1)
   pole=pole(2)
   elseif zero(2)==pole(2)
   zero=zero(1)
   pole=pole(1)
end
   
zeroangle=angle(zero);
zeromag=abs(zero);

poleangle=angle(pole);
polemag=abs(pole);

% plot the unit circle
%alpha=[0:399]/(2*pi);
%polar(alpha,ones(1,400),'.w');grid,hold on

% plot the  zeros of H(z)
figure(2)
polar(zeroangle,zeromag,'Ob'), hold on

% plot the poles of H(z)
polar(poleangle,polemag,'Xb');
title('POLE/ZERO PLOT FOR FILTER, H(z) ')
disp('')
disp(' hit CR to continue')
pause
hold off





% Calculate the filter magnitude and phase response  
Z=2000;
[H,F] = freqz(a,b,Z,Fs);
figure(3)
plot(F,abs(H)),grid
xlabel('FREQUENCY IN Hz')
ylabel('GAIN')
title('SYSTEM MAGNITUDE RESPONSE'),pause
PHASE=angle(H);
PHASE=(PHASE/pi)*180;
figure(4)
plot(F,PHASE),grid
xlabel('FREQUENCY IN Hz')
ylabel('PHASE IN DEGREES')
title('SYSTEM PHASE RESPONSE'),pause
figure(5)
subplot(2,1,1)
plot(F,abs(H)),grid
xlabel('FREQUENCY IN Hz')
ylabel('GAIN')
title('SYSTEM MAGNITUDE RESPONSE')
subplot(2,1,2)
plot(F,PHASE),grid
xlabel('FREQUENCY IN Hz')
ylabel('PHASE IN DEGREES')
title('SYSTEM PHASE RESPONSE'),pause,subplot


% Plot the filter impluse response
L=length(x);
x1=zeros(1,L);x1(1)=1;
h=filter(a,b,x1);
figure(6)
plot(t,h,'b'),grid
xlabel('TIME t')
title('IMPULSE RESPONSE h(nT) FROM FILTER')
pause
disp(' ')
disp(' ')



% Now filter x(n) with H(z)
y=filter(a,b,x);
figure(7)
plot(t,y,'r'),grid
xlabel('TIME t')
ylabel('y(t)')
title('FILTERED OUTPUT y(t) FROM COSINE INPUT x(t) = cos(2piFot)u(t)')
hold
plot(t,x,'b')
legend('output y(t)','input x(t)')
pause
hold off




               end

