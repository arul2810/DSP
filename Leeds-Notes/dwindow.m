
while 1
% ---------- SOME WINDOWS,THEIR DFT's, AND THEIR ABILITY---------
%            TO RESOLVE AND DETECT SINUSOIDAL WAVEFORMS
%
%	(1) Boxcar(rectangular)      (2) Bartlett
%       (3) Hamming                  (4) Blackman
%       (5) Hanning                  (6) Chebyshev (139 dB ripple) 
%       (7) Kaiser (B=6.0)           (8) Nuttall(4 terms)
%       (9) Flattop                 (10) Gaussian(a=2.5)
%      (11) Cauchy(a=4.0)	    (12) Bohman
%      (13) Blackman-Harris(4 term) (14) Kaiser-Bessel(4 sample)
%      (15) Riesz                   (16) Sin^4(n/N*pi)
%      (17) Chebyshev (150 dB ripple)(18) Compare two windows      
%       (0) QUIT 
% 		
%          (range set at 0 to 120  for dB axis)
%	FIRST DISPLAY:  100 point window(sampling freq fs Hz) 
%      SECOND DISPLAY:  512 point DFT of window
%       THIRD DISPLAY:  windowed sine (fs2 = 260Hz)
%      FOURTH DISPLAY:  512 point DFT of windowed sine	 
%       FIFTH DISPLAY:  512 point DFT of sum of seven windowed sines  
%                       ( f=30,190,240,260,350,450,480Hz;
%                         amp=10-6,10-4,1.0,1.0,10-4,10-5,10-5)

clc;
clear; close all
fs2=260;A2=1.0;
fs3=240;A3=1.0;
fs4=350;A4=.0001;
fs5=450;A5=.00001; 
fs6=480;A6=.00001;
fs7=190;A7=.0001;
fs8=30;A8=.000001;



help dwindow



wind = ['boxcar(101)         '
        'bartlett(101)       '
        'hamming(101)        '
        'blackman(101)       '  
        'hanning(101)        '
        'chebwin(101,139)    '
        'kaiser(101,6)       '
        'dnuttall(101)       '
	'dflattop(101)       '
        'dgauss(101)         '
        'dcauchy(101)        '
        'dbohman(101)        '
        'dblackhar(101)      '
        'dkaisbess(101)      '
        'driesz(101)         '
        'dsin4(101)          '
        'chebwin(101,150)    '];  
                         
 
flag1=0;     
while flag1==0;
  m=input('make a selection:     ');
   if(m==0);return
   else
   end
   if(m<0 | m > 18)
   else
   flag1=1;
   end
end


  if m==18
        flag=1;clc;
        flag1=0;
        help dwindow;

                     while flag1==0

	n(1)=input('choose the first window:    ');
        n(2)=input('choose the second window:   ');
          if( n(1)<=0|n(1)>17|n(2)<=0|n(2)>17);
             
           else
            flag1=1;     
           end
                     end
   else
     flag=0;
   end



fs=input('input the sampling freq fs in Hz (try 1000 to begin):    ');
xmin=0;xmax=fs/2;ymin=-125;ymax=0; %scaling for dB plots
f=fs*[0:256]/512;%set freq spacing(dft lines) for plots

clc


              
if flag~=1

wind=wind(m,:);
w=eval(wind);

else

    for i=1:2
       win=wind(n(i),:);
       w=eval(win);

           if i==1
                 w1=w;       
            else
                 w2=w;
            end
     end

end


n=length(w);
p=512-n;
t=[0:n-1]/(fs);

                if flag== 1
                     
                       %take 512 point D.F.T. of window


disp( 'THE FIRST WINDOW IS DISPLAYED IN YELLOW')
disp('')
disp('')
disp( 'THE SECOND WINDOW IS DISPLAYED IN PURPLE')

			ww1=[w1',zeros(1,p)];
			y3=fft(ww1);
			y3=y3(1:257);
			Pww4=y3.*conj(y3);
			Pww4= Pww4/max(Pww4);
			Pw1= 10*log10(Pww4);




			ww2=[w2',zeros(1,p)];
			y3=fft(ww2);
			y3=y3(1:257);
      			Pww4=y3.*conj(y3);
			Pww4= Pww4/max(Pww4);
			Pw2= 10*log10(Pww4);




                        
		%plot the resuts for two windows together
		%note the 'axis' commands to get proper freq/dB scaling
	
		%axis([0 0 0 0]);axis;  %initialises autoranging for axes

figure(1)		% to bring figure to front. This only happens normally on first run of prog.
                plot(t,w1,t,w2);grid
title('101 PT. WINDOW IN THE TIME DOMAIN');xlabel('time(seconds)'); 
                pause;
	
	
		axis([xmin xmax ymin ymax]); 
		plot(f,Pw1,f,Pw2);grid;      %plot D.F.T. of window
title('1024 POINT DFT OF WINDOW');xlabel('freq(Hz)');ylabel('dB');pause;

               
		subplot(211);
               		plot(t,w1,t,w2);grid
axis('auto')
title('101 PT. WINDOW IN THE TIME DOMAIN');xlabel('time(seconds)'); 



		
		subplot(212)
		plot(f,Pw1,f,Pw2);grid;      %plot D.F.T. of window
title('1024 POINT DFT OF WINDOW');xlabel('freq(Hz)');ylabel('dB')
axis([xmin xmax ymin ymax]); pause
                %axis;  %return to autoranging
		subplot  %return plotting window to normal

                else 

%take 512 point D.F.T. of window

w1=[w',zeros(1,p)];
y3=fft(w1);
y3=y3(1:257);
Pww4=y3.*conj(y3);
Pww4= Pww4/max(Pww4);
Pww4= 10*log10(Pww4);



%take n points of windowed data (n=about 100)

x=A2*sin(2*pi*fs2*t);	%data - sine wave of fs2 Hz
x=x.*w';
x1=sin(2*pi*100*t);	%sine wave of 100 Hz used only for display
x1=x1.*w';
z=[x,zeros(1,p)];	%zero pad to 512 points
y=fft(z);
y=y(1:257);
Pww=y.*conj(y);
Pww=Pww/max(Pww);
Pww=10*log10(Pww);	%D.F.T. of windowed sine in dB's

%add six sines, s3,s4,s5,s6,s7 and s8 to the orignal sine,x, and
%repeat the whole proceedure

s8=A8*sin(2*pi*fs8*t);
s7=A7*sin(2*pi*fs7*t);
s6=A6*sin(2*pi*fs6*t);
s5=A5*sin(2*pi*fs5*t);
s3=A3*sin(2*pi*fs3*t);
s4=A4*sin(2*pi*fs4*t);
x3=x+s3+s4+s5+s6+s7+s8;
x3=x3.*w';
z3=[x3,zeros(1,p)];
y3=fft(z3);
y3=y3(1:257);
Pww3=y3.*conj(y3);
Pww3=Pww3/max(Pww3);
Pww3=10*log10(Pww3);	%D.F.T. of windowed signal of 7 sines

%plot the resuts
%note the 'axis' commands to get proper freq/dB scaling

%axis([0 0 0 0]);axis;  %initialises autoranging for axes

figure(1)		% to bring figure to front. This only happens normally on first run of prog.
plot(t,w);grid;       	%plot window in time domain
title('100 PT. WINDOW IN THE TIME DOMAIN');xlabel('time(seconds)'); pause;


axis([xmin xmax ymin ymax]); 
plot(f,Pww4);grid;      %plot D.F.T. of window
title('1024 POINT DFT OF WINDOW');xlabel('freq(Hz)');ylabel('dB');pause;


axis;
plot(t,x,t,w);grid  	%plot windowed sine in time domain
title('100 PT. WINDOWED SINE WAVE OF FREQ 260 HZ');
xlabel('time(seconds)');pause


axis([xmin xmax ymin ymax]); 
plot(f,Pww),grid;     	%plot D.F.T. of windowed sine
title('1024 POINT DFT OF WINDOWED SINE');
xlabel('freq(Hz)');ylabel('dB');  
hold on; plot(260,0,'*g'); %identify sine with green star
pause;


hold off; %note this also switches to auto ranging

plot(t,x3);grid;		%plot windowed sines
title('100 PT. WINDOW OF SUM OF SEVEN SINES');
xlabel('time(seconds)');pause;


axis([xmin xmax ymin ymax]); 
plot(f,Pww3);grid;    	%plot D.F.T. of windowed four windowed sines
title('1024 POINT DFT OF SUM OF SEVEN WINDOWED SINES');
xlabel('freq(Hz)');ylabel('dB');

hold on;
%identify sine positions with green stars
plot(30,-120,'*g',190,-80,'*g',240,0,'*g',260,0,'*g',350,-80,'*g');
plot(450,-100,'*g',480,-100,'*g');
pause;

hold off;
                     end

end


