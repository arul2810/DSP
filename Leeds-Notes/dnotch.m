

%--------------------------------------------------------------------------------------------------------
% Program dnotch.m
%
%
% This program 'dnotch.m' designs a simple second-order notch filter, H(z), by placing zeros on the unit 
% circle at the centre frequency of the notch (angle 'theta'), and placing the poles at the same angle
% 'theta' and at a radius 'r' where 0<r<1. The sampling frequency of the filter is Fs=1000Hz.
%
% The closer 'r' is to one the better the frequency response (i.e. the flatter the passband, and the narrower 
% the stopband) but the longer will be the transient response of the filter.
%
% The program displays the pole/zero plot for H(z), the impulse response h(n),the frequency response of the 
% notch filter, and finally the filtering operation with two sinusoids at the input.
%
% All the plots are on separate figures, and can be examined after the last figure (Figure 8) has been
% displayed. You can rescale the plots to full screen width so that writing does not overlap.
%------------------------------------------------------------------------------
% NOTE THAT dnotch1 is a similar program but one that allows you to define
% the notch bandwidth, and the notch depth as follows:
%
% NOTCH BANDWIDTH - adjusted by the radius of the poles
% NOTCH DEPTH - adjusted by the radius of both the poles and the zsros
%------------------------------------------------------------------------------
%                                                                                      
% HIT CR TO CONTINUE
%----------------------------------------------------------------------------------------------------------
%
%


clc
clear			% clears all variables
close all		% closes all windows
help dnotch, pause


while 1==1		% continually repeat program

Fs=1000; 		% sampling frequency
flag1=input('type 1 for default values; type 2 to enter your own values:  ');



if flag1==1       	 % choose default values for notch filter

	f0=50;
	r=.97;

else			% enter your own values for notch filter

	f0=input('Give the value for the centre frequency of the notch  ( <500Hz [Fs/2] ):  ');
	r=input('Give the radius for the magnitude of the pole ( r<1 ):  ');

end


% Calculate the filter coefficients
theta=[f0/1000]*2*pi;		% in rads
theta_deg=(theta/pi)*180;	% in degrees
% Numerator coefficients of H(z)
a(1)=1;
a(2)=-2*cos(theta);
a(3)=1;

% Denominator coefficients of H(z)
b(1)=1;
b(2)=-2*r*cos(theta);
b(3)=r^2;

clc
disp('-------------------------------------------------------------------------------------')
disp(' ')
disp(' ')
disp('THE PARAMETERS OF THE NOTCH FILTER H(z) - SAMPLING RATE Fs=1000Hz')
disp(' ')
disp(' ')
disp('The centre frequency of the notch, f0')
disp(f0)
disp('')
disp('The values for the magnitude (r) and angle in degrees (+/- theta) of the poles')
disp(r)
disp(theta_deg)
disp('')
disp('The values for the numerator coefficients of H(z)')
disp(a)
disp('')
disp('The values for the denominator coefficients of H(z)')
disp(b)
disp('')
disp('-------------------------------------------------------------------------------------')
disp('')
disp(' hit CR to continue')
disp('')
disp('')
pause


% --------------------------------------------------------------------------------------
% I have removed this command as there appears to be an erratic error in zplane.m to do
% with ... get(a,'Aspect'). Sometimes it appears and other times not.
% zplane(a,b),pause
%----------------------------------------------------------------------------------------



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

% plot the  zeros of H(z)
figure(1)
polar(zeroangle,zeromag,'Or'), hold on

% plot the poles of H(z)
polar(poleangle,polemag,'Xg');
title('POLE/ZERO PLOT FOR NOTCH FILTER, H(z) ')
disp('')
disp(' hit CR to continue')
pause
hold off

% plot the impulse response of the filter, h(n)
[h,t1]=impz(a,b);
figure(2)
plot(t1,h),grid
xlabel('sample number, n')
ylabel('magnitude')
title('IMPULSE RESPONSE h(n) OF NOTCH FILTER')
disp('')
disp(' hit CR to continue')
pause

%-----------------------------------------------------------------------------------------



% Plot the frequency response of H(z)

figure(3)
freqz(a,b,512,Fs),grid
subplot(211),grid
title('FREQUENCY RESPONSE OF NOTCH FILTER')
disp('')
disp(' hit CR to continue')
pause


%-------------------------------------------------------------------------------------------


% Construct input signal x(n) as the sum of two sinusoids

if flag1==1 		% choose default values for input signal, x(n)


	f1=50; A1=.2;
	f2=5; A2=1;
	N=1000;

else 			% enter your own values for the input signal, x(n)

	f1=input('input the frequency in Hz of sinusoid 1:   ');
	A1=input('input the amplitude of sinusoid 1:   ');
	f2=input('input the frequency in Hz of sinusoid 2:   ');
	A2=input('input the amplitude of sinusoid 2:   ');
	N=input('input the number of samples for the input signal:   ');

end



clc
disp('-------------------------------------------------------------------------------------')
disp(' ')
disp(' ')
disp(' THE PARAMETERS OF THE INPUT SIGNAL x(n)')
disp(' ')
disp(' ')
disp('The values for the amplitude and frequency (Hz) of sinusoid one')
disp(A1)
disp(f1)
disp('')
disp('The values for the amplitude and frequency (Hz) of sinusoid two')
disp(A2)
disp(f2)
disp('')
disp('')
disp('')
disp('')
disp('-------------------------------------------------------------------------------------')
disp('')
disp('')
disp(' hit CR to continue')
pause


% Generate x(n) as the sum of two sinusoids, and calculate the output
% from the notch filter y(n)

t=[0:1:N-1];
x1=A1*sin(2*pi*f1*t/Fs);
x2=A2*sin(2*pi*f2*t/Fs);x=x1+x2;
figure(4), plot(x), grid
xlabel('sample number, n')
ylabel('magnitude')

if (flag1==1)			% choose default title
title('INPUT x(n) - 5Hz CORRUPTED BY 50Hz MAINS NOISE')
else
title('INPUT x(n) - THE SUM OF TWO SINUSOIDS')
end
pause
y=filter(a,b,x);
figure(5), plot(y),grid
xlabel('sample number, n')
ylabel('magnitude')
title('y(n) - OUTPUT FROM THE NOTCH FILTER')
disp('')
disp(' hit CR to continue')
pause



% Plot the Fourier Transforms of x(n) and y(n) - scale by 1/N so that
% result resembles two-sided complex Fourier Series coefficients.

N2=N/2;
f=[1:N/2]*Fs/N;
Fx=abs(fft(x))/N;Fx=Fx(1:N/2); 
Fx_dB=20*log10(Fx);

Fy=abs(fft(y))/N;Fy=Fy(1:N/2); 
Fy_dB=20*log10(Fy);

% plot FFT on linear scale
figure(6)
subplot(211), plot(f,Fx),grid
xlabel('frequency(Hz)'), ylabel('Mag. of F.T.')
title('FOURIER TRANSFORM OF INPUT x(n)')
subplot(212), plot(f,Fy),grid
xlabel('frequency(Hz)'), ylabel('Mag. of F.T.')
title('FOURIER TRANSFORM OF OUTPUT y(n)')
pause

% plot FFT in dB's
figure(7)
subplot(211), plot(f,Fx_dB),grid
xlabel('frequency(Hz)'), ylabel('F.T. in dBs')
title('FOURIER TRANSFORM OF INPUT x(n)')
subplot(212), plot(f,Fy_dB),grid
xlabel('frequency(Hz)'), ylabel('F.T. in dBs')
title('FOURIER TRANSFORM OF OUTPUT y(n)')
pause


% Finally put all plots together 
figure(8)

subplot(221)
plot(x), grid
xlabel('sample number, n')
title('Input x(n)')

subplot(222)
% recalculate notch filter frequency response using same number of points
% as fft of input so that they can both be overlaid.
h=freqz(a,b,f,Fs);
h=20*(log10(abs(h)));
plot(f,h,'r-');hold
plot(f,Fx_dB),xlabel('frequency(Hz)')
ylabel('dBs'),grid
title('Input spectrum (y) and notch filter (r)'),hold off

subplot(223)
plot(y), grid
xlabel('sample number, n')
title('Output y(n)')

subplot(224)
plot(f,Fy_dB),grid
xlabel('frequency(Hz)'), ylabel('dBs')
title('Fourier Transform of output y(n)'),pause
close all
% subplot



% NOW USE NOTCH FILTER TO REMOVE$ SINUSOID FROM MUSIC

FFs=Fs;   % original sampling frequency FFs=100Hz
load perfectday  % new sampling frequency downloaded Fs=11025 Hz - data stored as y(n)
tt=[1:length(y)];
f0=f0*(Fs/FFs);   % new centre frequency for notch filter
ymax=max(y);%  find peak value of sound.
noise=0.25*ymax*sin(tt*2*pi*(f0/Fs))';  % add noise to music
yy=y+noise;  % add noise to music
yyy=filter(a,b,yy); % filter noisey signal
ttt=(1/Fs)*tt;


subplot(211)
plot(ttt,y), grid
xlabel('TIME IN SECS')
title('ORIGINAL MUSIC')
subplot(212)
specgram(y,500,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
title('SPECTOGRAM OF ORIGINAL MUSIC')
pause,soundsc(y,Fs),pause





subplot(211)
plot(ttt,yy), grid
xlabel('TIME IN SECS')
title(' MUSIC PLUS NOISE')
subplot(212)
specgram(yy,500,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
title('SPECTOGRAM OF MUSIC PLUS NOISE')
pause,soundsc(yy,Fs),pause


subplot(211)
plot(ttt,yyy), grid
xlabel('TIME IN SECS')
title('FILTERED MUSIC PLUS NOISE')
subplot(212)
specgram(y,500,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
title('SPECTOGRAM OF FILTERED MUSIC PLUS NOISE')
pause,soundsc(yyy,Fs),pause


subplot


close all



% Ask if you want to repeat program
clc
flag3=input('TYPE 1 TO REPEAT PROGRAM; TYPE 2 TO END PROGRAM:   ');
if flag3~=1
return
else
end


end

