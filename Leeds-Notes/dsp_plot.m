% 		This introductory program DSP_PLOT.M plots some very simple DISCRETE-TIME
% 		functions.Your choice will be plotted for -16<n<16 
%
%		This program also examines both the time-domain and frequency-domain behaviour
%		of DISCRETE-TIME causal linear time-invaruant systems characterised by linear 
%		difference equations (LDE's).
%
% There is a problem with "hold command" - when the poles
% are plotted if they are larger than the zeros plot does
% not increase. Only a problem with "polar" command and
% not "plot"	
%
%				TRY AND PREDICT THE RESULTS IN ADVANCE BY USING PEN AND PAPER! 

clc			% clears screen
clear			% clears all variables
close all		% closes all windows
help dsp_plot, pause
t=[-15:1:15];		% sets up vector for plotting results

while 1==1		% continually repeat program

home

C={'Impulse' 'Step' 'Sinusoid' 'Ramp' 'Pulse' 'Real Exponential' 'Complex Exponential'...
      'Impulse response of LDE' 'Ouput y(n) from input x(n)' 'Convolution of x(n) with h(n)'...
      'Pole/Zero Plot, Impulse Response and Frequency Response of a Second-Order H(z)' ...
   'End the program'};   
   
   flag1=menu('MAKE YOUR CHOICE' ,C);

%disp('		-------------------------------------------------------------------')
%disp(' ')
%disp('		Some Simple Discrete-Time Functions ')
%disp('		----------------------------------- ')
%disp('  ')
%disp(' 		TYPE 1 FOR AN IMPULSE:  ')
%disp(' 		TYPE 2 FOR A STEP:  ')
%disp(' 		TYPE 3 FOR A SINUSOID:  ')
%disp(' 		TYPE 4 FOR A RAMP:  ')
%disp(' 		TYPE 5 FOR A PULSE:  ')
%disp(' 		TYPE 6 FOR A REAL EXPONENTIAL:  ')
%disp(' 		TYPE 7 FOR A COMPLEX EXPONENTIAL:  ')
%disp(' ')
%disp(' 		Your choice x(n) will be plotted for -16<n<16')
%disp(' ')
%disp('		Linear Time-Invariant Functions')
%disp('		------------------------------- ')
%disp(' ')
%disp(' 		TYPE 8  FOR IMPULSE RESPONSE FROM A LINEAR DIFFERENCE EQUATION:  ')
%disp('		TYPE 9  TO DETERMINE OUTPUT y(n) FOR INPUT x(n):   ')
%disp('		TYPE 10 TO EVALUATE THE CONVOLUTION, x(n)*h(n):   ')
%disp('		TYPE 11 TO EVALUATE THE POLE/ZERO PLOT, IMPULSE RESPONSE AND THE FREQUENCY  ')
%disp('		RESPONSE OF A	DISCRETE-TIME SECOND-ORDER SYSTEM: ')
%disp('	        TYPE 0 TO END PROGRAM:  ')
%disp(' ')

%disp(' ')
%disp('		TRY AND PREDICT THE RESULTS IN ADVANCE BY USING PEN AND PAPER!  ')
%disp(' ')
%disp('		-------------------------------------------------------------------')



close all

% Make your selection

%	while 1
		
%		flag1=input( ' 		Make your selection:  ');
%		if flag1==0,return,end
%		if(flag1<=11&flag1>=1),break,end
%	end




% ----------------------------------------------------------------------------

	if (flag1==1)		% IMPULSE FUNCTION
home
disp(' ')
disp('		You will see the impulse function x(n) = A*delta(n+N)')
disp(' '),pause
A=input('		Choose the amplitude (A) of the impulse (positive or negative):   ');

	while 1
		N=input('		Choose the value for -16<N<16 : ');
		if(N<=15&N>=-15),break,end
	end

x=zeros(1,31);
x(16-N)=A;

figure(1)
stem(t,x),grid
xlabel('sample number n')
ylabel('x(n)')
title('IMPULSE FUNCTION x(n) = A*delta(n+N)'),pause

% ----------------------------------------------------------------------------


	elseif (flag1==2)	% STEP FUNCTION


home
disp(' ')
disp('		You will see the step function x(n) = A*u(n+N)')
disp(' '),pause
A=input('		Choose the amplitude (A) of the step (positive or negative):   ');

	while 1
		N=input('		Choose the value for -16<N<16 : ');
		if(N<=15&N>=-15),break,end
	end

x1=zeros(1,(15-N));x2=ones(1,(16+N));x=[x1 A*x2];

figure(1)
stem(t,x),grid
xlabel('sample number n')
ylabel('x(n)')
title('STEP FUNCTION x(n) = A*u(n+N)'),pause


% ----------------------------------------------------------------------------

	elseif (flag1==3)	% SINUSOID

home
disp(' ')
disp('		You will see the sinusoidal function x(n) = A*sin(n*theta + phi)' )
disp(' '),pause
A=input('		Choose the amplitude (A) of the sinusoid (positive or negative):   ');
theta=input('		Choose the digital frequency (theta - in rads) of the sinusoid (positive or negative):   ');
phi=input('		Choose the phase (phi - in rads) of the sinusoid (positive or negative):   ');

x=A*sin(t*theta+phi);

figure(1)
stem(t,x),grid
xlabel('sample number n')
ylabel('x(n)')
title('SINUSOIDAL x(n) = A*sin(n*theta + phi)'),pause


% ----------------------------------------------------------------------------

	elseif (flag1==4)	% RAMP

home
disp(' ')
disp('		You will see the ramp function x(n) = A*r(n+N), where r(n)=n for n>=0 ' )
disp(' '),pause
A=input('		Choose the slope (A) of the ramp (positive or negative):   ');
	
	while 1
		N=input('		Choose the value for -16<N<16 : ');
		if(N<=15&N>=-15),break,end
	end

x1=zeros(1,(15-N));x2=[0:1:15+N];x=[x1 A*x2];



figure(1)
stem(t,x),grid
xlabel('sample number n')
ylabel('x(n)')
title('RAMP x(n) = A*r(n+N)' ),pause


% ----------------------------------------------------------------------------

	elseif (flag1==5)	% PULSE

home
disp(' ')
disp('		You will see the pulse function x(n) = A*p(n+N), where p(n)=1 for -3=<n<=3 ' )
disp(' '),pause
A=input('		Choose the amplitude (A) of the pulse (positive or negative):   ');
	
	while 1
		N=input('		Choose the value for -13<N<13 : ');
		if(N<=12&N>=-12),break,end
	end

x1=zeros(1,(12-N));x2=ones(1,7);x3=zeros(1,12+N);x=[x1 A*x2 x3];


figure(1)
stem(t,x),grid
xlabel('sample number n')
ylabel('x(n)')
title('PULSE x(n) = A*p(n+N)' ),pause



% ----------------------------------------------------------------------------


	elseif (flag1==6)	% REAL EXPONENTIAL

home
disp(' ')
disp('		You will see the real exponential x(n) = A^n' )


disp(' '),pause
A=input('		Choose the value for (A) of the exponential (positive or negative):   ');

x=A.^t;

figure(1)
stem(t,x),grid
xlabel('sample number n')
ylabel('x(n)')
title('REAL EXPONENTIAL x(n) = A^n'),pause


% ----------------------------------------------------------------------------


	elseif (flag1==7)	% COMPLEX EXPONENTIAL

home
disp(' ')
disp('		You will see the complex exponential x(n) = A*exp(j*n*theta + phi)' )


disp(' '),pause
A=input('		Choose the value for the amplitude (A) (positive or negative):   ');
theta=input('		Choose the digital frequency (theta - in rads) of the complex exponential (positive or negative):   ');
phi=input('		Choose the phase (phi - in rads) of the complex exponential (positive or negative):   ');


realx=A*cos(t*theta+phi);imagx=A*sin(t*theta+phi)

figure(1)
subplot(211)
stem(t,realx),grid
xlabel('sample number n')
title('REAL PART OF A*exp(j*n*theta + phi)')
subplot(212)
stem(t,imagx),grid
xlabel('sample number n')
title('IMAG. PART OF A*exp(j*n*theta + phi)')
pause,subplot

% ----------------------------------------------------------------------------


	elseif (flag1==8)	% LINEAR DIFFERENCE EQUATION

home
disp(' ')
disp('		You will see the weighted impulse response [A*h(n)] of the system with the   ')
disp('		following causal second-order linear difference equation with zero initial ')
disp('		conditions:' )
disp(' ')
disp('		y(n)=a0*x(n)+a1*x(n-1)+a2*x(n-2)' )
disp('		            -b1*y(n-1)-b2*y(n-2)' )
disp(' ')
disp('		The output y(n)(=A*h(n), the weighted impulse response) will be displayed for  ')
disp('		0=<n<=N-1 due to an input impulse of weight A applied at n=0  ') 
disp(' '),pause

N=input('		Choose the value for N, the number of samples to be displayed:	  ');
A=input('		Choose the value for A, the weight of the impulse:	  ');

disp(' ')
a(1)=input('		Choose the value for the feedforward coefficient a0:   ');
a(2)=input('		Choose the value for the feedforward coefficient a1:   ');
a(3)=input('		Choose the value for the feedforward coefficient a2:   ');
b(2)=input('		Choose the value for the feedback coefficient b1:   ');
b(3)=input('		Choose the value for the feedback coefficient b2:   ');
b(1)=1;

x=zeros(1,N);x(1)=A;
y=filter(a,b,x);
t1=[-5:1:N-1];
y1=[0 0 0 0 0 y];
figure(1)
stem(t1,y1),grid
xlabel('sample number n')
title('IMPULSE RESPONSE h(n) FROM LINEAR DIFFERENCE EQUATION')
pause
disp(' ')
disp(' ')
flag2=input('		Type 1 to show values of y(n)=A*h(n) [0=<n<=N-1] :	  ');
	if (flag2==1)
	disp(' '),disp(y),pause,else,end
close all, clc	

% ----------------------------------------------------------------------------

	elseif (flag1==9)	% INPUT/OUTPUT CONDITION
home

disp(' ')
disp('		You will be select the coefficients for a secon-order recursive system' )
disp('		with input x(n) and output y(n). The initial conditions are zero.' )
disp(' ')
disp('		y(n)=a0*x(n)+a1*x(n-1)+a2*x(n-2)' )
disp('		            -b1*y(n-1)-b2*y(n-2)' )
disp(' ')
disp('		You will then select the values for x(n), and using these, calculate the ') 
disp('		output values y(n) ')
disp(' '),pause



disp(' ')
a(1)=input('		Choose the value for the feedforward coefficient a0:   ');
a(2)=input('		Choose the value for the feedforward coefficient a1:   ');
a(3)=input('		Choose the value for the feedforward coefficient a2:   ');
b(2)=input('		Choose the value for the feedback coefficient b1:   ');
b(3)=input('		Choose the value for the feedback coefficient b2:   ');
b(1)=1;

disp('  ')
N=input('		Choose the value for N, the number of ouput samples to be displayed:    ');
x=zeros(1,N);
disp('  ')
disp('		Enter the values for x(n):  '),disp(' ')
for n=1:1:N
fprintf('		Give the value for x(%-1.0f',n-1),disp(')')
disp('') 
x(n)=input('		');
end

y=filter(a,b,x);
t1=[-5:1:N-1];
y1=[0 0 0 0 0 y];
x1=[0 0 0 0 0 x];
figure(1)
stem(t1,x1),grid
xlabel('sample number n')
title('INPUT x(n) TO FILTER'),pause
figure(2)
stem(t1,y1),grid
xlabel('sample number n')
title('OUTPUT y(n) FROM FILTER'),pause
figure(2)
subplot(2,1,1)
stem(t1,x1),grid
xlabel('sample number n')
title('INPUT x(n) TO FILTER')
subplot(2,1,2)
stem(t1,y1),grid
xlabel('sample number n')
title('OUTPUT y(n) FROM FILTER'),pause
subplot,home
flag2=input('		Type 1 to show values of y(n) [0=<n<=N-1] :	  ');
	if (flag2==1)
	disp(' ')
	y,pause,else,end
close all, clc	

% ----------------------------------------------------------------------------


	elseif (flag1==10)	% CONVOLVE x(n) WITH y(n)
home

disp(' ')
disp('		This part of the program allows you to convolve x(n) with h(n) to get x(n)*h(n)' )
disp('		and simulates the operation of a filter with input x(n) and impulse response h(n)')  
disp(' ')
disp('		x(n)*y(n)=sum(from k=-infinity to +infinity) x(k)h(n-k) ')
disp(' ')
disp(' ')
disp('		For simplicity, the number of samples in both x(n) and h(n) will be N, and thus')
disp('		the number of samples in the output will be 2N-1.Three zeros will then be added ')
disp('		to each end for display'  )
disp(' ')
disp(' '),pause


N=input('		Choose the value for N, the number of samples in x(n):    ');
x=zeros(1,N);
disp('  ')
disp('		Enter the values for x(n)  '), disp('  ')
for n=1:1:N
fprintf('		Give the value for x(%-1.0f',n-1),disp(')')
disp('') 
x(n)=input('		');
end
disp(' ')

h=zeros(1,N);
home
disp('		Enter the values for h(n)  '), disp(' ')
for n=1:1:N
fprintf('		Give the value for h(%-1.0f',n-1),disp(')')
disp('') 
h(n)=input('		');
end
disp(' ')

x1=[0 0 0 x 0 0 0];
h1=[0 0 0 h 0 0 0];
tx=[-3:1:N+2];
stem(tx,x1),grid
xlabel('sample number n')
title('SEQUENCE x(n)'),pause
stem(tx,h1),grid
xlabel('sample number n')
title('SEQUENCE h(n)'),pause
y=conv(x,h);
y1=[0 0 0 y 0 0 0];
ty=[-3:1:2*N+1];
stem(ty,y1),grid
xlabel('sample number n')
title('CONVOLUTION x(n)*h(n)'),pause
subplot(3,1,1)
stem(tx,x1),grid
xlabel('sample number n')
title('x(n)')
subplot(3,1,2)
stem(tx,h1),grid
xlabel('sample number n')
title(' h(n)')
subplot(3,1,3)
stem(ty,y1),grid
xlabel('sample number n')
title(' y(n)'),pause
subplot,home
flag2=input('		Type 1 to show values of x(n), h(n) and y(n) :	  ');
	if (flag2==1)
	disp(' ')
	x,h,y, pause,else,end
close all, clc	



% ----------------------------------------------------------------------------


	elseif (flag1==11)	% POLE/ZERO PLOT, IMPULSE RESPONSE & FREQUENCY RESPONSE

home
disp(' ')
disp('   You will enter the coefficients for the system function, H(z), for a ')
disp('   second-order system:')
disp(' ')
disp(' ')
disp('   H(z)=(a0 + a1z-1 + a2z-2)/(1 + b1z-1 + b2z-2)' )
disp(' ')
disp(' ')
disp('   (1) First you will see the pole/zero plot for H(z), the system function ')
disp(' ')   
disp('   (2) Secondly you will see the weighted impulse response [A*h(n)] of the system ')
disp('   with the following causal second-order linear difference equation with zero initial ')
disp('   conditions:' )
disp(' ')
disp('   y(n)=a0*x(n)+a1*x(n-1)+a2*x(n-2)' )
disp('	     -b1*y(n-1)-b2*y(n-2)' )
disp(' ')
disp('   The output y(n) [=A*h(n), the weighted impulse response] will be displayed for  ')
disp('   0=<n<=N-1, due to an input impulse of weight A applied at n=0  ') 
disp(' ')
disp(' ')
disp('   (3) Thirdly, you will see the frequency response of that system - both magnitude and phase ')
disp('  ')
disp(' -----------------------------------------------------------------------------------------')
disp('   For ease of display, assume a sampling frequency of Fs=1000Hz, and so the')
disp('   upper frequency on the display will be Fs/2=500Hz ')
disp(' -----------------------------------------------------------------------------------------')
disp(' ') 
disp(' '),pause

flag11=1;
	while flag11==1
disp(' ')
disp('		Enter the coefficients of a STABLE second-order system  ')
disp('		------------------------------------------------------  ')
disp(' ')

a(1)=input('		Choose the value for the feedforward coefficient a0:   ');
a(2)=input('		Choose the value for the feedforward coefficient a1:   ');
a(3)=input('		Choose the value for the feedforward coefficient a2:   ');
b(2)=input('		Choose the value for the feedback coefficient b1:   ');
b(3)=input('		Choose the value for the feedback coefficient b2:   ');
b(1)=1;pause

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
   
N=input('		Choose the value for N, the number of samples of the impulse respone to be displayed:	  ');
A=input('		Choose the value for A, the weight of the impulse:	  ');
   
   
    
% calculate the magnitude and angles of the poles and zeros of H(z)
% and plot the result in the z-plane. Plot the impulse response, h(n)

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

% There is a problem with "hold command" - when the poles
% are plotted if they are larger than the zeros plot does
% not increase. Only a problem with "polar" command and
% not "plot"

if zeromag>=polemag
% plot the  zeros of H(z) first
figure(1)
polar(zeroangle,zeromag,'Ob'), hold on

% plot the poles of H(z) second
polar(poleangle,polemag,'Xb');
title('POLE/ZERO PLOT FOR FILTER, H(z) ')
disp('')
disp(' hit CR to continue')
pause
hold off

else
% plot the poles of H(z) first
figure(1)
polar(poleangle,polemag,'Xb'), hold on

% plot the zeros of H(z) second
polar(zeroangle,zeromag,'Ob');
title('POLE/ZERO PLOT FOR FILTER, H(z) ')
disp('')
disp(' hit CR to continue')
pause
hold off

end




% Plot the impluse response

x=zeros(1,N);x(1)=A;
y=filter(a,b,x);
t1=[-5:1:N-1];
y1=[0 0 0 0 0 y];
figure(1)
stem(t1,y1),grid
xlabel('sample number n')
title('IMPULSE RESPONSE h(n) FROM LINEAR DIFFERENCE EQUATION')
pause
disp(' ')
disp(' ')
  
   
   
% Calculate the magnitude and phase response  
   
N=512;Fs=1000;
[H,F] = freqz(a,b,N,Fs);
plot(F,abs(H)),grid
xlabel('FREQUENCY IN Hz')
title('SYSTEM MAGNITUDE RESPONSE'),pause
PHASE=angle(H);
PHASE=(PHASE/pi)*180;
plot(F,PHASE),grid
xlabel('FREQUENCY IN Hz')
ylabel('PHASE IN DEGREES')
title('SYSTEM PHASE RESPONSE'),pause

subplot(2,1,1)
plot(F,abs(H)),grid
xlabel('FREQUENCY IN Hz')
title('SYSTEM MAGNITUDE RESPONSE')
subplot(2,1,2)
plot(F,PHASE),grid
xlabel('FREQUENCY IN Hz')
ylabel('PHASE IN DEGREES')
title('SYSTEM PHASE RESPONSE'),pause,subplot

% ----------------------------------------------------------------------------

	elseif (flag1==12),return	% End the program
% ----------------------------------------------------------------------------


	end	% goes with 'if (flag1==1)'	






	close all
	clc
	end	% goes with 'while 1==1'

