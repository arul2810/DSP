function dspintro
%       ----------------------------------------------------------------------------
%
%                    THIS PROGRAM IS CALLED  ' DSPINTRO.M '
%
%     * IT INTRODUCES SOME VERY BASIC PRINCIPLES ABOUT CONTINUOUS-TIME AND
%       DISCRETE-TIME SIGNALS THROUGH A SERIES OF TWELVE DEMONSTRATIONS.
%
%     * YOU DO NOT NEED TO UNDERSTAND MATLAB. ALL YOU NEED TO DO IS EITHER
%       HIT 'RETURN' OR USE THE MOUSE!!
%
%     * TO APPRECIATE THE DEMOS, YOU NEED A SOUNDCARD AND SPEAKERS.
%
%     * THE ADVANTAGE OF THESE DEMOS IS THAT YOU BOTH SEE AND HEAR THE RESULTS
%       OF MOST OF THE EXAMPLES.
%
%     * DO NOT JUST GO MECHANICALLY THROUGH EACH DEMO. TRY TO UNDERSTAND WHAT IS
%       HAPPENING; EXAMINE THE GRAPHS/PLOTS - ARE THEY ALL CONSISTENT WITH
%       EACH OTHER?; CONFIRM ALL THE RESULTS FROM THE THEORY THAT YOU HAVE COVERED IN
%       LECTURES, AND REFER TO THE APPROPRIATE TEXT BOOKS.
%
%     * THESE DEMOS ARE SIMPLY TO ILLUMINATE, AND ARE NOT A SUBSTITUTE FOR, 
%       THE THEORY.
%
%     * FINALLY - THERE ARE 8465 LINES OF CODE. THIS IS CRAP
%     "STRAIGHT-LINE" CODE MOST OF THE TIME. IT COULD BE COMPRESSED TO
%     ABOUT 500 LINES, BUT I CANNOT BE BOTHERED. ANYWAY, IT WORKS, AND THAT
%     IS ALL THAT MATTERS.
%
%      
%
%       ----------------------------------------------------------------------------
%
%
%





%			REMEMBER: This program needs the following *.mat files: 
%
%         	    speech.mat
% 				silence.mat
% 				who1.mat
% 				who2.mat
%				vowel.mat
%				vowel1.mat
% 				hello.mat
% 				chirp.mat
% 				gong.mat
% 				car.mat
% 				handel.mat
%              salsa2.mat
%              salsa3.mat
% 				guitar.mat
% 				guitar1.mat
% 				aminor.mat
% 				damp.mat
%				splat.mat
%              train.mat
%              laughter.mat
%				perfectday.mat
%				altan.mat
%				yesterdays.mat
%				miles.mat
%				wyntonkelly.mat
%               prettywoman.mat
%               alien_faces.mat
%               simpsons.mat


% ===================================================================================
%
% ALL THE PROGRAMMING THAT FOLLOWS IS CRAP - BUT IT WORKS! I KNOW THAT THERE ARE LOADS
% OF MISTAKES, AND IF I HAD THE TIME TO RE-WRITE IT ELEGANTLY, IT WOULD PROBABLY
% OCCUPY ONLY 10% OF THE ORIGINAL CODE.
% 
% ===================================================================================




% ===================================================================================
%                         CORRECTIONS
%                         -----------
%
%  This has not been done throughout the program and needs correcting - 29th Nov. 2000
%
% For the single-sided Fourier Series coeffs of x(n) use 2*N*X(k)
% For the single-sided Fourier Transform of x(n) use 2*X(k)/Fs
% For the single-sided PSD estimate from x(n) use 2*|X(k)|^2/N
%
% where X(k) is DFT of x(n), and x(n) is N points long, and Fs is the sampling rate.
%  
% Although this has not been corrected throughout the program, fortuitously we have
% the correct values in all the plots - just a lucky coincidence!!!
% 
% ===================================================================================






hold off
clc									% clears screen
clear all							% clears all variables (but does not seem to work!!!)
close all							% closes all windows
help dspintro.m, pause
home





% ----------------------------------------------------------------------------------

									while 11==11 
    
    
      C11={ 'DEMO 1:    PLOTTING & SOUNDING SINUSOIDAL TONES & SPEECH SIGNALS'...
            'DEMO 2:    FREQUENCY SPECTRA OF SOME FUNDAMENTAL SIGNALS'...
            'DEMO 3:    USING SPECTROGRAMS FOR VARIOUS SOUNDS'...
            'DEMO 4:    THE SPECTRA OF GUITAR SOUNDS'...
           	'DEMO 5:    ADDING NOISE TO SIGNALS'...
		   	'DEMO 6:    FILTERING SPEECH'...
            'DEMO 7:    FILTERING SQUARE WAVES'...
            'DEMO 8:    NOTCH FILTERING A TONE FROM A SPEECH SIGNAL'...
         	'DEMO 9:    ADC: SAMPLING AND ALIASING OF SIGNALS'...
			'DEMO 10:   ADC & DAC: QUANTISATION OF SAMPLED SIGNALS'...
         	'DEMO 11:   DAC & SMOOTHING FILTER "ALIASING" EFFECTS'...
            'DEMO 12:   PSYCHOACOUSTICAL EFFECTS'...
            'DEMO 13:   DSP SOUND EFFECTS'...
            'END'};

flag11=menu('CHOOSE A DEMO  ' ,C11);

   
   if flag11==1; 			%DEMO 1: PLOTTING & SOUNDING SINUSOIDAL TONES & SPEECH SIGNALS
            
      demo1;
      
   elseif flag11==2;		%DEMO 2:  FREQUENCY SPECTRA OF SOME FUNDAMENTAL SIGNALS
      
      demo2;
      
   elseif flag11==3;		%DEMO 3: USING SPECTROGRAMS FOR VARIOUS SOUND      
      
      demo3;
      
   elseif flag11==4;		%DEMO 4: THE SPECTRA OF GUITAR SOUNDS      
      
      demo4;
   
   elseif flag11==5;		%DEMO 5: ADDING NOISE TO SIGNALS
      
      demo5;
      
   elseif flag11==6;		%DEMO 6: FILTERING SPEECH
      
      demo6;
      
   elseif flag11==7;		%DEMO 7: FILTERING SQUARE WAVES
      
      demo7;
      
  elseif flag11==8;		%DEMO 8: NOTCH FILTERING AN INTERFERING TONE FROM A SPEECH SIGNAL'
      
      demo8;

             
   elseif flag11==9;		%DEMO 9: ADC: SAMPLING AND ALIASING OF SIGNALS
      
      demo9;
      
   elseif flag11==10;		%DEMO 10: ADC: QUANTISATION OF SAMPLED SIGNALS
      
      demo10;
      
   elseif flag11==11;		%DEMO 11: DAC & SMOOTHING FILTER "ALIASING" EFFECTS
      
      demo11;
      
      
   elseif flag11==12;		%DEMO 12: PSYCHOACOUSTICAL EFFECTS
      
      demo12;
      
   elseif flag11==13;		%DEMO 13: DSP SOUND EFFECTS
      
      demo13;
      
   elseif flag11==14;		%END THE PROGRAM
      
      close all
      
      return
      
   end	% goes with 'if flag1==1'
   
       



								end 		% goes with 'while 11=11'

% ----------------------------------------------------------------------------------















function demo1
% ----------------------------------------------------------------------------------
%         DEMO 1 : PLOTTING AND SOUNDING SINUSOIDAL TONES AND SPEECH SIGNALS
% ----------------------------------------------------------------------------------


Fs=32000;					% sampling frequency=32000 Hz
Tlength=2;					% Set length of tone to two seconds
Tdisplay=.050;				% Display 50 ms of tone 
t=[0:1:Tlength*Fs-1];	% This is to keep N even, otherwise FFT takes a long time???
t1=[0:1:Tdisplay*Fs];	% Plotting vector - number of samples to make up Tdisplay



% PLOTTING SINUSOIDAL TONES

 
 												while 1==1 
    
                                                                 
   C1={'Fo=50Hz'...
   'Fo=100Hz'...
   'Fo=200Hz'...
   'Fo=500Hz'...
   'Fo=1000Hz'...
   'Fo=2000Hz'...
   'Fo=3000Hz'...
   'Fo=4000Hz'...
   'Fo=6000Hz'...
   'PLOT HISTOGRAM FOR SINE WAVE'...
   'EXPERIMENT WITH LOUDNESS'...
   'CONTINUE WITH THE REST OF DEMO1 - SPEECH SIGNALS'...
   'END'};

flag1=menu('DEMO1: PLOT SOME SINUSOIDS IN THE TIME DOMAIN           ' ,C1);
   
  
if flag1==1;
      Fo=50;
   elseif flag1==2;
      Fo=100;
   elseif flag1==3;
      Fo=200;
 	elseif flag1==4;
      Fo=500;
 	elseif flag1==5;
      Fo=1000;
 	elseif flag1==6;
      Fo=2000;
 	elseif flag1==7;
      Fo=3000;
 	elseif flag1==8;
      Fo=4000;
 	elseif flag1==9;
       Fo=6000;
    		                     
     elseif flag1==12; 		% jump to ?????
      break
      
   elseif flag1==13;		% end program
	close all
	   return
       end					% goes with 'if flag1==1'
       
       

if flag1==10
   Fo=1;    % choose low freq. so that points are sampled close together
      		% to give good histogram

	 y=sin(2*pi*t*Fo/Fs);                            
    plot(t/Fs,y(t+1)),grid
    xlabel('TIME IN SEC'),ylabel('AMPLITUDE')
    title(' TWO SEC SINUSOIDAL TONE, Fo Hz ')
    text(.4,.7,'Frequency Fo=1 Hz','fontsize',13,'color','red')
    pause
   
[NN,XX]=hist(y,200);
bar(XX,100*NN/length(y)),grid   
xlabel('Sinusoidal amplitude'),ylabel('% of occurences')
title(' HISTOGRAM/PDF FOR SINUSOID Fo=1Hz')
text(-0.6,3.5,'\it This is true for any sinusoid;','fontsize',14,'color','red')
pause

subplot(211)
plot(t/Fs,y(t+1)),grid
xlabel('TIME IN SEC'),ylabel('AMPLITUDE')
title(' TWO SEC SINUSOIDAL TONE, Fo Hz ')
text(.4,.7,'Frequency Fo=1 Hz','fontsize',13,'color','red')
subplot(212)
bar(XX,100*NN/length(y)),grid   
xlabel('Sinusoid amplitude'),ylabel('% of occurences')
title(' HISTOGRAM/PDF FOR SINUSOID Fo=1Hz')
text(-0.6,3.5,'\it This is true for any sinusoid;','fontsize',14,'color','red')
pause,subplot

elseif flag1==11
  % LOUDNESS

    Fo=200;
    y=sin(2*pi*t*Fo/Fs);
    plot(1000*t1/Fs,y(t1+1)),hold
    xlabel('TIME IN MS'),ylabel('AMPLITUDE')
    axis([0 50 -1.5 1.5])
    title(' 50 MSEC SAMPLE OF TWO SEC. SINUSOIDAL TONE, Fo=200 Hz ')
    pause,sound(y,Fs),pause
    text(10,1.25, 'Reducing the amplitude, reduces the loudness','fontsize',12,'color','red')
    pause
    y=0.6*sin(2*pi*t*Fo/Fs);
    plot(1000*t1/Fs,y(t1+1),'r')
    pause,sound(y,Fs),pause
	y=0.2*sin(2*pi*t*Fo/Fs);
    plot(1000*t1/Fs,y(t1+1),'g')
    pause,sound(y,Fs),pause,axis off,hold off
 
   





else
   
% Generate, plot and sound sinusoidal tones
 	 y=sin(2*pi*t*Fo/Fs);
    plot(1000*t1/Fs,y(t1+1)),grid
    xlabel('TIME IN MS'),ylabel('AMPLITUDE')
    axis([0 50 -1.5 1.5])
    title(' 50 MSEC SAMPLE OF TWO SEC. SINUSOIDAL TONE, Fo Hz ')
    text(3,1.3, ['Frequency Fo=', num2str(Fo),'Hz'],'fontsize',14,'color','red')
    text(26,1.3, '\it(Could you hear the tone?)','fontsize',12,'color','black')
	 pause(1),soundsc(y,Fs),pause
    
   
end

      
 										end		% goes with while 1==1
  
  
  


% PLOTTING SPEECH SIGNALS

clc									% clears screen
clear									% clears all variables
close all							% closes all windows
load speech;				% loads variable speech, Fs=8000Hz, 8bits PCM, 2.5 secs
x=speech;
Fs=8000;						% sampling frequency=8000 Hz
N=length(x);
t=[0:1:N-1]/Fs;

									while 2==2 
    
    
   
   C2={'Normal playback rate = 8000 samples/sec'...
   'Fast playback rate = 16000 samples/sec'...
   'Slow playback rate = 4000 samples/sec'...
   'Play speech in reverse order'...
   'Plot histogram of speech'...
   'RETURN TO THE MAIN MENU'...
   'END'};

flag2=menu('DEMO1 CONTINUED: PLOT AND PLAY A SPEECH SIGNAL/Fs=8000 SAMPLES/SEC         ' ,C2);
   
  
if flag2==1;
   
plot(t,x),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' 2.5 SECS OF SPEECH/BANDWIDTH=4kHz(8bit PCM, Fs=8000Hz)')
text(0.5,3500,'Playback rate = 8000 samples/sec','fontsize',12,'color','red')
soundsc(x,Fs),pause

elseif flag2==2;
   
plot(t/2,x),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' 2.5 SECS OF SPEECH/BANDWIDTH=4kHz(8bit PCM, Fs=8000Hz)')
text(0.25,3500,'Fast playback rate = 16000 samples/sec','fontsize',12,'color','red')
soundsc(x,16000),pause
   
elseif flag2==3;
   
plot(2*t,x),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' 2.5 SECS OF SPEECH/BANDWIDTH=4kHz(8bit PCM, Fs=8000Hz)')
text(1,3500,'Slow playback rate = 4000 samples/sec','fontsize',12,'color','red')
soundsc(x,4000),pause

elseif flag2==4;
   
xreverse=x(N:-1:1);   
plot(t,xreverse),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' 2.5 SECS OF SPEECH/BANDWIDTH=4kHz(8bit PCM, Fs=8000Hz)')
text(0.5,3500,'Reverse playback at 8000 samples/sec','fontsize',12,'color','red')
text(0.6,-2500,'CANADIAN ACCENT UNCHANGED !','fontsize',14,'color','red')
soundsc(xreverse,8000),pause
  
elseif flag2==5;
   
[NN,XX]=hist(x,50);
bar(XX,100*NN/N),grid   
xlabel('Speech signal amplitude'),ylabel('% of occurences')
title(' HISTOGRAM/PDF FOR 2.5 SECS OF SPEECH/BANDWIDTH=4kHz(8bit PCM, Fs=8000Hz)')
text(-2000,27,'Speech has approx Gaussian pdf; \mu=0 and \sigma=626;','fontsize',12,'color','red')
pause

subplot(211)
plot(t,x),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' 2.5 SECS OF SPEECH/BANDWIDTH=4kHz(8bit PCM, Fs=8000Hz)')
subplot(212)
bar(XX,100*NN/N),grid   
xlabel('Speech signal amplitude'),ylabel('% of occurences')
title(' HISTOGRAM/PDF FOR 2.5 SECS OF SPEECH/BANDWIDTH=4kHz(8bit PCM, Fs=8000Hz)')
text(-2000,27,'Speech has approx Gaussian pdf; \mu=0 and \sigma=626;','fontsize',12,'color','red')
soundsc(x,8000),pause,subplot

elseif flag2==6;		% jump to demo ????
      break
elseif flag2==7;		% end program
    close all
return

end						% goes with 'if flag2==1'







						end		% goes with while 2==2

% -----------------------------------------------------------------------------














  function demo2 
% ----------------------------------------------------------------------------------
%                 DEMO 2 : FREQUENCY SPECTRA OF SOME FUNDAMENTAL SIGNALS
% ----------------------------------------------------------------------------------


clc									% clears screen
clear									% clears all variables
close all							% closes all windows
Fs=16000;							% sampling frequency=16000 Hz
Tlength=2;							% Set length of tone to two seconds
Tdisplay=.050;						% Display 50 ms of tone 
t=[0:1:Tlength*Fs-1];			% This is to keep N even, otherwise FFT takes a long time???
t1=[0:1:Tdisplay*Fs];			% Plotting vector - number of samples to make up Tdisplay

   
 							while 3==3  
    
                         
        C3={'INTRODUCTION TO THE FREQUENCY SPECTRUM'...		
            'FREQUENCY SPECTRA OF VARIOUS SIGNALS'...
  			 	'RETURN TO THE MAIN MENU'...
   			'END'};

flag3=menu('DEMO2: EXAMINE THE FREQUENCY SPECTRA OF VARIOUS SIGNALS          ' ,C3);

                         
                         
if flag3==1 		% Introduction to frequency spectra
   
   
   
Fs=16000;							% sampling frequency=16000 Hz
Tlength=2;							% Set length of tone to two seconds
t=[0:1:Tlength*Fs-1];			% This is to keep N even, otherwise FFT takes a long time???
  
   
   
   
    Tdisplay=.005;						% Display 5 ms of tone 
    t1=[0:1:Tdisplay*Fs];
    Fo=1000;
    y=cos(2*pi*t*Fo/Fs-pi/3);                            
    plot(1000*t1/Fs,y(t1+1))
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 5 -1.5 1.5])
    title(' 5 MS SAMPLE OF COSINE, Fo Hz ')
    text(0.75,1.25,['cos(2\piFot-\pi/3),  Frequency Fo=', num2str(Fo),'Hz'],'fontsize',14,'color','black')    
    text(0.5,-1.25,'cos(2\piFot-\phi) = 0.5[e^{j(2\piFot-\phi)} + e^{-j(2\piFot-\phi)}]','fontsize',14,'color','red')
    pause,soundsc(y,Fs),pause
    N1=length(y);
    
    % Single-sided mag. spectrum of tone
    Y=(2/N1)*fft(y);			% mult by 2 because single-sided spectrum
    Y=abs(Y);
    N=length(Y);
    F=linspace(0,Fs/2,N/2);
    plot(F,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SINGLE-SIDED MAGNITUDE SPECTRUM FOR COSINE Fo=1000Hz')
    axis([0 8000 0 2])
    text(Fo+50,0.45,'\leftarrow+1000Hz component','fontsize',12,'color','red')
    text(Fo+500,0.35,'(magnitude=1.0)','fontsize',12,'color','red')
    hold
    plot([0 0],[0 1],'k'),hold off
    pause
    
    % Double-sided mag. spectrum of tone
    Y=(1/N1)*fft(y);	
    N=length(Y);
    Y=abs(Y);
    Y=Y(1:N/2);
    Y=[Y(N/2:-1:2) Y];
    F=linspace(-Fs/2,Fs/2,length(Y));
    plot(F,Y),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('DOUBLE-SIDED MAGNITUDE SPECTRUM FOR COSINE Fo=1000Hz')
    axis([-8000 8000 0 1])
    text(Fo+50,0.25,'\leftarrow+1000Hz component','fontsize',12,'color','red')
    text(Fo+1200,0.15,'(magnitude=0.5)','fontsize',12,'color','red')
    text(-Fo-50,0.25,'-1000Hz component\rightarrow','fontsize',12,'color','red','HorizontalAlignment','right')
    text(-Fo-800,0.15,'(magnitude=0.5)','fontsize',12,'color','red','HorizontalAlignment','right')  
    hold
    plot([0 0],[0 1],'k'),hold off
    pause
    text(-6000,0.8,'(Periodic signals have discrete line spectra)','fontsize',12,'color','black')
    pause,hold off

    
    
    
    
    
    
    %single-sided phase spectrum of tone
    close all
   plot([1000 1000],[0 -60],'b','LineWidth',2),hold
   axis([0 8000 -100 100])
   plot([0 8000],[0 0],'b','LineWidth',2)
   text(Fo+50,-50,'\leftarrow+1000Hz component','fontsize',12,'color','red')
   text(Fo+50,-60,'(phase = -60 degrees)','fontsize',12,'color','red')
   xlabel('FREQ IN HZ'),ylabel('PHASE IN DEGREES')
   title('SINGLE-SIDED PHASE SPECTRUM FOR COSINE Fo=1000Hz')
   
   pause, hold off,axis normal    
            
        
    %double-sided phase spectrum of tone  
   plot([1000 1000],[0 -60],'b','LineWidth',2),hold
   plot([-1000 -1000],[0 60],'b','LineWidth',2)
   axis([-8000 8000 -100 100])
   text(Fo+50,-50,'\leftarrow+1000Hz component','fontsize',12,'color','red')
   text(Fo+50,-60,'(phase = -60 degrees)','fontsize',12,'color','red')
   text(-7000,40,'-1000Hz component\rightarrow','fontsize',12,'color','red')
   text(-7000,30,'(phase = 60 degrees)','fontsize',12,'color','red')
 
   plot([-8000 8000],[0 0],'b','LineWidth',2)
   plot([0 0],[-100 100],'k','LineWidth',2)
   xlabel('FREQ IN HZ'),ylabel('PHASE IN DEGREES')
   title('DOUBLE-SIDED PHASE SPECTRUM FOR COSINE Fo=1000Hz')
   text(-6000,70,'(Periodic signals have discrete line spectra)','fontsize',12,'color','black')  
   pause, hold off,axis normal    

    
 % Double-sided mag spectrum of a pulse.   
 x=[ones(1,6) zeros(1,2001) ones(1,5)]; 
 N=length(x);
 plot([-1 -0.5],[0 0],'b','LineWidth',2),hold
 plot([-0.5 -0.5],[0 1],'b','LineWidth',2)
 plot([-0.5 0.5],[1 1],'b','LineWidth',2)
 plot([0.5 0.5],[1 0],'b','LineWidth',2)
 plot([0.5 1],[0 0],'b','LineWidth',2)
 axis([-1 1 0 2])
 plot([0 0],[0 2],'k','LineWidth',1.5)
 grid
 xlabel('TIME IN SECS')
 ylabel('AMPLITUDE')
 title('A PULSE OF DURATION ONE SECOND')
 hold off,pause
 
 
    % plot magnitude spectrum of pulse
    Fs=11;
    X=fft(x)/Fs;		% to get true cont-time FT	
    N=length(X); 
    X=abs(X);
    Y=X(1:1:N/2);
    Y=[Y(N/2:-1:2) Y];    
    F=linspace(-Fs/2,Fs/2,length(Y));
    plot(F,Y),hold
    xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('DOUBLE-SIDED MAGNITUDE SPECTRUM FOR ONE SECOND PULSE')
    plot([0 0],[0 1.5],'k','LineWidth',1.5)
    text(-4,1.25,'(Non-periodic signals have continuous spectra)','fontsize',12,'color','red')
    axis([-5 5 0 1.5]), % so that plot goes from -5 t0 5Hz rather than -5.5 to 5Hz
    grid
    pause,hold off, axis normal
 
 
 %double-sided phase spectrum of pulse
   close all
   plot([0 0],[-200 200],'k','LineWidth',2),hold
   plot([-5 -4],[0 0],'b','LineWidth',2)
   plot([-4 -4],[0 180],'b','LineWidth',2)
   plot([-4 -3],[180 180],'b','LineWidth',2)
   plot([-3 -3],[180 0],'b','LineWidth',2)
   plot([-3 -2],[0 0],'b','LineWidth',2)
   plot([-2 -2],[0 -180],'b','LineWidth',2)
   plot([-2 -1],[-180 -180],'b','LineWidth',2)
   plot([-1 -1],[-180 0],'b','LineWidth',2)
   plot([-1 0],[0 0],'b','LineWidth',2)
   plot([0 1],[0 0],'b','LineWidth',2)
   plot([0 0],[1 0],'b','LineWidth',2)
   plot([1 1],[1 180],'b','LineWidth',2)
   plot([1 2],[180 180],'b','LineWidth',2)
   plot([2 2],[180 0],'b','LineWidth',2)
   plot([2 3],[0 0],'b','LineWidth',2)
   plot([3 3],[0 -180],'b','LineWidth',2)
   plot([3 4],[-180 -180],'b','LineWidth',2)
   plot([4 4],[-180 0],'b','LineWidth',2)
   plot([4 5],[0 0],'b','LineWidth',2)
   grid
   xlabel('FREQ IN HZ'),ylabel('PHASE IN DEGREES')
   title('DOUBLE-SIDED PHASE SPECTRUM FOR ONE SECOND PULSE')
   pause, hold off,axis normal   
 
  
% Examine two pulses of different width 
subplot(211)
x=[ones(1,6) zeros(1,2001) ones(1,5)]; 
 N=length(x);
 plot([-1 -0.5],[0 0],'b','LineWidth',2),hold
 plot([-0.5 -0.5],[0 1],'b','LineWidth',2)
 plot([-0.5 0.5],[1 1],'b','LineWidth',2)
 plot([0.5 0.5],[1 0],'b','LineWidth',2)
 plot([0.5 1],[0 0],'b','LineWidth',2)
 axis([-1 1 0 2])
 plot([0 0],[0 2],'k','LineWidth',1.5)
 grid
 xlabel('TIME IN SECS')
 ylabel('AMPLITUDE')
 title('TWO DIFFERENT PULSES'),pause
 subplot(212)
  % plot double-sided magnitude spectrum of one second pulse
    Fs=11;
    X=fft(x)/Fs;		% to get true cont-time FT	
    N=length(X); 
    X=abs(X);
    Y=X(1:1:N/2);
    Y=[Y(N/2:-1:2) Y];    
    F=linspace(-Fs/2,Fs/2,length(Y));
    plot(F,Y,'b'),hold
    xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('DOUBLE-SIDED MAGNITUDE SPECTRUM')
    plot([0 0],[0 1.5],'k','LineWidth',1.5)
    axis([-5 5 0 1.5]), % so that plot goes from -5 t0 5Hz rather than -5.5 to 5Hz
    grid
    pause

 subplot(211)
 x=2*[ones(1,3) zeros(1,2007) ones(1,2)]; 
 N=length(x);
 plot([-1 -0.25],[0 0],'r','LineWidth',2)
 plot([-0.25 -0.25],[0 2],'r','LineWidth',2)
 plot([-0.25 0.25],[2 2],'r','LineWidth',2)
 plot([0.25 0.25],[2 0],'r','LineWidth',2)
 plot([0.25 1],[0 0],'r','LineWidth',2)
 axis([-1 1 0 3])
 plot([0 0],[0 3],'k','LineWidth',1.5)
 pause
 
 subplot(212)
 % plot double-sided magnitude spectrum of 0.5 second pulse
    Fs=10;    % need to change from 11 Hz to 10 Hz to get correct scaling
    X=fft(x)/Fs;		% to get true cont-time FT	
    N=length(X); 
    X=abs(X);
    Y=X(1:1:N/2);
    Y=[Y(N/2:-1:2) Y];    
    F=linspace(-Fs/2,Fs/2,length(Y));
    plot(F,Y,'r')
    xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    plot([0 0],[0 1.5],'k','LineWidth',1.5)
    axis([-5 5 0 1.5]), % so that plot goes from -5 t0 5Hz rather than -5.5 to 5Hz
    pause,close all

    
% Double-sided spectrum of a speech signal

load speech;				% loads variable speech, Fs=8000Hz, 8bits PCM, 2.5 secs
xx=speech/max(speech);
Fss=8000;		
NN=length(xx);
tt=[0:1:NN-1]/Fss;
plot(tt,xx);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH'),pause,soundsc(xx,Fss),pause
 XX=(1/Fss)*fft(xx);		
 XX=abs(XX);
 XX1=[XX(NN/2:-1:1) XX(1:NN/2)];
       FF=linspace(-Fss/2,Fss/2,length(XX1));
      plot(FF/1000,XX1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('DOUBLE-SIDED MAGN. SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, 
      text(-3.5,0.0358,'(Non-periodic signals have continuous spectra)','fontsize',14,'color','red')
		pause
      hold off
      
      
      % plot phase spectrum of speech
      XX=angle(fft(xx))*180/pi;	% phase in degrees		
      XX1=[XX(NN/2:-1:1) XX(1:NN/2)];
      plot(FF/1000,XX1),xlabel('FREQ IN kHZ'),ylabel('PHASE IN DEGREES')
      title('DOUBLE-SIDED PHASE SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[-200 200],'k','LineWidth',2)
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, 
      text(-3,50,'(Speech has random phase spectrum)','fontsize',14,'color','red')
		pause
      hold off
      
      % Zoom in on phase spectrum
      XX2=[-XX(100:-1:2) XX(1:100)];
      FFF=linspace(-40,40,199);
      plot(FFF,XX2),xlabel('FREQ IN HZ'),ylabel('PHASE IN DEGREES')
      title('PART OF THE PHASE SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      text(-20,-50,'ZOOMED IN ON -40 TO +40 HZ','fontsize',12,'color','black')
      hold
      plot([0 0],[-80 80],'k','LineWidth',1)
      plot([-40 40],[0 0],'k','LineWidth',1)
      pause
      hold off

      
      


elseif flag3==2 		% Examine the spectra of various signals	
   
% Sinusoids
Tlength=2;							% Set length of tone to two seconds
Tdisplay=.010;						% Display 50 ms of tone 
t=[0:1:Tlength*Fs-1];			% This is to keep N even, otherwise FFT takes a long time???
t1=[0:1:Tdisplay*Fs];			% Plotting vector - number of samples to make up Tdisplay
N1=length(t);


						while 6==6
   
   
   C4={		'SINUSOIDS'...
  			 	'SQUARE WAVES'...
   			'TRIANGULAR WAVES'...
   			'SPEECH'...
            'NOISE'...
            'PULSE SHAPING FOR DIGITAL TRANSMISSION'...
   			'RETURN TO DEMO2 MENU'...
   			'END'};

flag4=menu('CHOOSE A SIGNAL, AND OBSERVE ITS SPECTRUM            ' ,C4);
  
if flag4==1			% spectra of sinusoids
      
Fs=16000;							% sampling frequency=16000 Hz
Tlength=2;							% Set length of tone to two seconds
Tdisplay=.050;						% Display 50 ms of tone 
t=[0:1:Tlength*Fs-1];			% This is to keep N even, otherwise FFT takes a long time???
t1=[0:1:Tdisplay*Fs];			% Plotting vector - number of samples to make up Tdisplay
  
for Fo=[100 200 400 800 1000 1500 2000 3000 4000]  % activated by hitting CR  
      
    y=sin(2*pi*t*Fo/Fs);                            
    plot(1000*t1/Fs,y(t1+1)),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE OF TWO SEC. SINUSOIDAL TONE, Fo Hz ')
    text(3,1.3, ['Frequency Fo=', num2str(Fo),'Hz'],'fontsize',14,'color','red')
    pause,soundsc(y,Fs),pause
    
    % Single-sided spectrum
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    N=length(Y);
    F=linspace(0,Fs/2,N/2);
    plot(F,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SINGLE-SIDED MAGNITUDE SPECTRUM FOR SINUSOID Fo Hz')
    axis([0 8000 0 2])
    text(Fo+50,0.45,['\leftarrow+', num2str(Fo),'Hz component'],'fontsize',12,'color','red')
    hold
    plot([0 0],[0 1],'k'),hold off
    pause

   
 end  
 
 
 for Fo=[100 200 400 800 1000 1500 2000 3000 4000]  % automatic generation 
      
    
    subplot(211)
    y=sin(2*pi*t*Fo/Fs);                            
    plot(1000*t1/Fs,y(t1+1)),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE OF TWO SEC. SINUSOIDAL TONE, Fo Hz ')
    text(3,1.3, ['Frequency Fo=', num2str(Fo),'Hz'],'fontsize',14,'color','red')
       
    % Single-sided spectrum
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    N=length(Y);
    F=linspace(0,Fs/2,N/2);
    subplot(212)
    plot(F,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SINGLE-SIDED MAGNITUDE SPECTRUM FOR SINUSOID Fo Hz')
    axis([0 8000 0 2])
    text(Fo+50,0.45,['\leftarrow+', num2str(Fo),'Hz component'],'fontsize',12,'color','red')
    pause(1),soundsc(y(1:length(t)/4),Fs)
  
     
 end  
subplot 
 
  
  
elseif flag4==2	% Square Waves
   
   % these values of Fo have been given to ensure 1:1 mark/space ratio for the square
   % wave. They ensure that each step is an integer value of 2pi. If we do not have
   % equal mark/space ratio then sub harmonic components appear. In addition, the
   % term y=square((2*pi*t*Fo/Fs)+.001) has '+.001' to ensure we don't have square(0)
   % which gives 1 and can also lead to non 1:1 mark/space
   % We also need Fs=32000, or we get second harmonic with Fo=3200
   
for Fo=[100 200 400 800 1000 1600 2000 3200 4000]  % activated by hitting CR  
   
Fs=32000;							% sampling frequency=32000 Hz
Tlength=2;							% Set length of tone to two seconds
Tdisplay=.050;						% Display 50 ms of tone 
t=[0:1:Tlength*Fs-1];			% This is to keep N even, otherwise FFT takes a long time???
t1=[0:1:Tdisplay*Fs];			% Plotting vector - number of samples to make up Tdisplay

   
    y=square((2*pi*t*Fo/Fs)+.001);                            
    plot(1000*t1/Fs,y(t1+1)),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE OF TWO SEC. SQUARE WAVE, Fo Hz ')
    text(1.5,1.3, ['Fundamental frequency Fo=', num2str(Fo),'Hz'],'fontsize',14,'color','red')
    pause,soundsc(y,Fs),pause
    
    % Single-sided spectrum
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    N=length(Y);
    F=linspace(0,Fs/2,N/2);
    plot(F,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SINGLE-SIDED MAGNITUDE SPECTRUM FOR SQUARE WAVE Fo Hz')
    axis([0 8000 0 2])
    text(Fo+50,0.8,['\leftarrow+', num2str(Fo),'Hz first harmonic'],'fontsize',12,'color','red')
    text(2*Fo,0.6,['+',num2str(2*Fo),'Hz zero second harmonic'],'fontsize',12,'color','red')
    text(2*Fo-50,0.4,['\downarrow'],'fontsize',12,'color','red')
    text(3*Fo+50,0.4,['\leftarrow+', num2str(3*Fo),'Hz third harmonic'],'fontsize',12,'color','red')
    text(2000,1.6, ['\it(n-th harmonic=4/(npi))'],'fontsize',14,'color','black')

    pause
   
 end  
 
 
for Fo=[100 200 400 800 1000 1600 2000 3200 4000]  % automatic generation 
      
    
    subplot(211)
    y=square((2*pi*t*Fo/Fs)+.001);                            
    plot(1000*t1/Fs,y(t1+1)),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE OF TWO SEC. SQUARE WAVE, Fo Hz ')
    text(1.5,1.3, ['Fundamental frequency Fo=', num2str(Fo),'Hz'],'fontsize',12,'color','red')
   
    
    % Single-sided spectrum
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    N=length(Y);
    F=linspace(0,Fs/2,N/2);
    subplot(212)
    plot(F,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SINGLE-SIDED MAGNITUDE SPECTRUM FOR SQUARE WAVE Fo Hz')
    axis([0 8000 0 2])
    text(Fo+50,0.8,['\leftarrow+', num2str(Fo),'Hz first harmonic'],'fontsize',12,'color','red')
    text(2*Fo,0.6,['+',num2str(2*Fo),'Hz zero second harmonic'],'fontsize',12,'color','red')
    text(2*Fo-50,0.4,['\downarrow'],'fontsize',12,'color','red')		% I seem to have to state x-co-ordinate as 2Fo-50, to position on 2Fo?
    text(3*Fo+50,0.4,['\leftarrow+', num2str(3*Fo),'Hz third harmonic'],'fontsize',12,'color','red')
    text(2000,1.6, ['\it(n-th harmonic=4/(npi))'],'fontsize',12,'color','black')
    pause(1),soundsc(y(1:length(t)/4),Fs)
     
     
 end  
subplot

   
   
   
   
   
elseif flag4==3	% Triangular Waves
   
     
for Fo=[100 200 400 800 1000 1600 2000 3200 4000]  % activated by hitting CR  
   
   % generate triangular wave of correct frequency.
   Fs=32000							% for Fo=1600, we get Nperiod=5
   									% and this does not divide by 2 and so gives additional
                              % harmonics
                          
   Tlength=2;							% Set length of tone to two seconds
	Tdisplay=.010;						% Display 50 ms of tone 
	t=[0:1:Tlength*Fs-1];			% This is to keep N even, otherwise FFT takes a long time???
	t1=[0:1:Tdisplay*Fs];			% Plotting vector - number of samples to make up Tdisplay
                           
   Tlength=2;						% length of triangular wave = 2 secs
   Tp=1/Fo;							% period of triangular wave
   Nperiod=floor(Tp*Fs);		% number of samples per period
   Np2=floor(Tlength/Tp);		% number of periods in two sec signal
   temp=[-round(Nperiod/2):1:round(Nperiod/2)];
   w=tripuls(temp,Nperiod);
   w=w(1:length(w)-1);
   y=2*kron(ones(1,Np2),w);
   y=y-mean(y);
   N=length(y);
                       
    plot(1000*t1/Fs,y(t1+1)),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE OF TWO SEC. TRIANGULAR WAVE, Fo Hz ')
    text(2,1.3, ['Fundamental frequency Fo=', num2str(Fo),'Hz'],'fontsize',14,'color','red')
    pause,soundsc(y,Fs),pause
    
    % Single-sided spectrum
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    N=length(Y);
    F=linspace(0,Fs/2,N/2);
    plot(F,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SINGLE-SIDED MAGNITUDE SPECTRUM FOR TRIANGULAR WAVE, Fo Hz')
    axis([0 8000 0 1.4])
        
    text(Fo+50,0.8,['\leftarrow+', num2str(Fo),'Hz first harmonic'],'fontsize',12,'color','red')
    text(2*Fo,0.3,['+',num2str(2*Fo),'Hz zero second harmonic'],'fontsize',12,'color','red')
    text(2*Fo-50,0.2,['\downarrow'],'fontsize',12,'color','red')
    text(3*Fo+50,0.1,['\leftarrow+', num2str(3*Fo),'Hz third harmonic'],'fontsize',12,'color','red')
    text(2000,1.2, ['\it(n-th harmonic=4/(npi)^2)'],'fontsize',14,'color','black')

    pause
   
 end  
 
 
for Fo=[100 200 400 800 1000 1600 2000 3200 4000]  % automatic generation 
      
    % generate triangular wave of correct frequency.
   
    % generate triangular wave of correct frequency.
   
   Tlength=2;						% length of triangular wave = 2 secs
   Tp=1/Fo;							% period of triangular wave
   Nperiod=floor(Tp*Fs);		% number of samples per period
   Np2=floor(Tlength/Tp);		% number of periods in two sec signal
   temp=[-round(Nperiod/2):1:round(Nperiod/2)];
   w=tripuls(temp,Nperiod);
   w=w(1:length(w)-1);
   y=2*kron(ones(1,Np2),w);
   y=y-mean(y);
   N=length(y);
   
   
    subplot(211)
    plot(1000*t1/Fs,y(t1+1)),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE OF TWO SEC. TRIANGULAR WAVE, Fo Hz ')
    text(2,1.3, ['Fundamental frequency Fo=', num2str(Fo),'Hz'],'fontsize',12,'color','red')
     
    
    % Single-sided spectrum
    subplot(212)
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    N=length(Y);
    F=linspace(0,Fs/2,N/2);
    plot(F,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SINGLE-SIDED MAGNITUDE SPECTRUM FOR TRIANGULAR WAVE, Fo Hz')
    axis([0 8000 0 1.4])
        
    text(Fo+50,0.8,['\leftarrow+', num2str(Fo),'Hz first harmonic'],'fontsize',12,'color','red')
    text(2*Fo,0.3,['+',num2str(2*Fo),'Hz zero second harmonic'],'fontsize',12,'color','red')
    text(2*Fo-50,0.2,['\downarrow'],'fontsize',12,'color','red')
    text(3*Fo+50,0.1,['\leftarrow+', num2str(3*Fo),'Hz third harmonic'],'fontsize',12,'color','red')
    text(2000,1.2, ['\it(n-th harmonic=4/(npi)^2)'],'fontsize',12,'color','black')
    pause(1),soundsc(y(1:length(y)/4),Fs)
 
     
 end  
subplot
    

elseif flag4==4	% Speech Signals
   

   
clc									% clears screen
clear									% clears all variables
close all							% closes all windows
load speech;				% loads variable speech, Fs=8000Hz, 8bits PCM, 2.5 secs
x=speech;
Fs=8000;						% sampling frequency=8000 Hz
N=length(x);
t=[0:1:N-1]/Fs;
plot(t,x);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF SPEECH'),pause,soundsc(x,8000),pause

% Single-sided spectrum
    X=(1/Fs)*fft(x);		
    X=abs(X);
    N=length(X);
    F=linspace(0,Fs/2,N/2);
    plot(F,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR SPEECH SIGNAL')
    text(700,40,'\leftarrow most energy in LF components','fontsize',12,'color','red')
    pause
    
    subplot(211)
    plot(t,x);, xlabel('SAMPLE NUMBER')
	 ylabel('AMPLITUDE'),grid
    title ('2.5 SECONDS OF SPEECH')   
    subplot(212)
    plot(F,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR SPEECH SIGNAL')
    text(700,40,'\leftarrow most energy in LF components','fontsize',12,'color','red')
    pause(1),soundsc(x,8000),pause,subplot

% unvoiced speech
plot(t,x);, xlabel('SECS'),hold
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF SPEECH'),pause,  
t1=6780/Fs;t2=7499/Fs;
plot([t1 t1],[-3000 4000],'r-')
plot([t2 t2],[-3000 4000],'r-')
text(1.05,3500,'ZOOM IN ON AN UNVOICED PART OF SPEECH','fontsize',9,'color','red'),pause
soundsc(x(6780:7499),8000),pause
hold off

y=x(6780:7499);
yzeropadded=[y zeros(1,10*length(y))];
N=length(y);
t=[0:1:N-1]/Fs;
plot(t,y);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
text(.01,700,'APPROX RANDOM','fontsize',12,'color','red')
title ('SAMPLE OF UNVOICED SPEECH'),pause
soundsc(y,8000),pause
Y=(1/Fs)*fft(y);		
Y=abs(Y);
N=length(Y);
F=linspace(0,Fs/2,N/2);
plot(F,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
title('SPECTRUM FOR SAMPLE OF UNVOICED SPEECH')
text(100,1.5,' most energy in HF components\rightarrow','fontsize',12,'color','red')
pause

subplot(211)
plot(t,y);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
text(.01,700,'APPROX RANDOM','fontsize',12,'color','red')
title ('SAMPLE OF UNVOICED SPEECH')
subplot(212)
plot(F,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
title('SPECTRUM FOR SAMPLE OF UNVOICED SPEECH')
text(100,1.5,' most energy in HF components\rightarrow','fontsize',12,'color','red')
pause(1),soundsc(y,8000),pause,subplot

 % Voiced speech
N=length(x);
t=[0:1:N-1]/Fs;   
plot(t,x);, xlabel('SECS'),hold
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF SPEECH'),pause,  
t1=5000/Fs;t2=6119/Fs;
plot([t1 t1],[-3000 4000],'r-')
plot([t2 t2],[-3000 4000],'r-')
text(1.05,3500,'ZOOM IN ON A VOICED PART OF SPEECH','fontsize',9,'color','red'),pause
soundsc(x(5000:6119),8000),pause
hold off

y=x(5000:6119);
yzeropadded=[y zeros(1,10*length(y))];
N=length(y);
t=[0:1:N-1]/Fs;
plot(t,y);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
text(.06,2500,'QUASI PERIODIC','fontsize',12,'color','red')
title ('SAMPLE OF VOICED SPEECH'),pause
soundsc(y,8000),pause
Y=(1/Fs)*fft(y);		
Y=abs(Y);
N=length(Y);
F=linspace(0,Fs/2,N/2);
plot(F,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
title('SPECTRUM FOR SAMPLE OF VOICED SPEECH')
text(1000,10,'\leftarrow most energy in discrete LF components','fontsize',12,'color','red')
pause

subplot(211)
plot(t,y);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('SAMPLE OF VOICED SPEECH')
text(.06,2500,'QUASI PERIODIC','fontsize',12,'color','red')
subplot(212)
plot(F,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
title('SPECTRUM FOR SAMPLE OF VOICED SPEECH')
text(1000,10,'\leftarrow most energy in discrete LF components','fontsize',12,'color','red')
pause(1),soundsc(y,8000),pause,subplot

% plot the SPECTROGRAM of the speech
N=length(x);
t=[0:1:N-1]/Fs;
specgram(x,250,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
title('SPECTROGRAM OF SPEECH')
pause,soundsc(x,8000),pause   
subplot(211)
plot(t,x),xlabel('TIME IN SECS')
ylabel('AMPLITUDE'),grid
title ('SPEECH SAMPLE (ABOVE) & SPECTROGRAM (BELOW)')
subplot(212)
specgram(x,250,Fs) 
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause,soundsc(x,8000),pause,subplot 




   
elseif flag4==5	% Noise
   
clc									% clears screen
clear									% clears all variables
close all							% closes all windows
x=randn(1,20000);
Fs=8000;					      	% sampling frequency=8000 Hz
N=length(x);
t=[0:1:N-1]/Fs;
plot(t,x), xlabel('SECS')
ylabel('AMPLITUDE'),grid
axis([0 2.5 -5 5]);
text(0.5,4.5,'FOR THIS NOISE: \mu=0.0 and \sigma^2=1.0','fontsize',12,'color','red')
title ('2.5 SECONDS OF WHITE GAUSSIAN NOISE (BW: 0 to 4000 HZ)'),pause,soundsc(x,8000),pause
plot(1000*t(1:200), x(1:200)),xlabel('TIME IN MSECS')
ylabel('AMPLITUDE'),grid
title ('FIRST 25 MSECS WHITE GAUSSIAN NOISE (BW: 0 to 4000 HZ)'),pause
tt=[0:1:7999];
xx=ones(1,4000)/4000;
zz=zeros(1,4000);
xx=[xx zz];
plot(tt,xx),hold
xlabel('FREQUENCY IN HZ')
ylabel('PSD MAGNITUDE')
title('POWER SPECTRAL DENSITY (PSD) OF  NOISE')
axis([0 8000 0 .0006])
text(1000,0.0003,'Since noise has \mu=0.0 and \sigma^2=1.0, then area=1','fontsize',12,'color','red')
pause,hold

[NN,XX]=hist(x,50);
bar(XX,100*NN/N),grid   
xlabel('Noise signal amplitude'),ylabel('% of occurences')
title(' HISTOGRAM/PDF FOR 2.5 SECS OF WHITE GAUSSIAN NOISE (BW: 0 to 4000 HZ)')
axis([-5 5 0 8]);
text(-4.9,7.5,'Noise has approx Gaussian pdf \mu=0.0 and \sigma^2=1.0','fontsize',14,'color','red')
soundsc(x,8000),pause

subplot(211)
plot(t,x),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title('2.5 SECONDS OF WHITE GAUSSIAN NOISE (BW: 0 to 4000 HZ)')
subplot(212)
bar(XX,100*NN/N),grid   
xlabel('Noise signal amplitude'),ylabel('% of occurences')
title(' HISTOGRAM/PDF FOR 2.5 SECS OF WHITE GAUSSIAN NOISE(BW: 0 to 4000 HZ)')
axis([-5 5 0 8]);
text(-4,7.5,'Noise has approx Gaussian pdf \mu=0.0 and \sigma^2=1.0','fontsize',12,'color','red')
soundsc(x,8000),pause,subplot

% produce low-pass filtered noise

	 Fc=1000;
    [A,B]=cheby1(15,.01,Fc/4000);
    yLP=filter(A,B,x);
    [H,W] = freqz(A,B,40000,'whole');
    H=abs(H(1:20000));
    f=linspace(0,4000,20000);
    plot(f,2*(H.^2)/Fs), xlabel('FREQ IN HZ'),ylabel('LINEAR'),
    title('PSD OF WHITE GAUSSIAN NOISE (BW: 0 to 1000 HZ)'),grid,pause 
    
plot(1000*t(1:200), yLP(1:200),'r'),grid  
title ('FIRST 25 MSECS OF WHITE GAUSSIAN NOISE (BW: 0 to 1000 HZ)')
ylabel('AMPLITUDE'), xlabel('TIME IN MSECS'),pause
soundsc(yLP,Fs),pause
[NN,XX]=hist(yLP,50);
bar(XX,100*NN/N),grid   
xlabel('Noise signal amplitude'),ylabel('% of occurences')
title(' HISTOGRAM/PDF FOR 2.5 SECS OF WHITE GAUSSIAN NOISE (BW: 0 to 1000 HZ)')
axis([-4 4 0 10]);
text(-3.5,8.5,'Noise has approx Gaussian pdf \mu=0.0 and \sigma^2=0.25','fontsize',12,'color','red')
soundsc(yLP,8000),pause 
subplot(211)    
plot(1000*t(1:200), x(1:200)),xlabel('TIME IN MSECS'),grid
ylabel('AMPLITUDE')
title ('FIRST 25 MSECS OF WHITE GAUSSIAN NOISE (BW: 0 to 4000 HZ)')
pause,soundsc(x,Fs),pause
subplot(212)
plot(1000*t(1:200), yLP(1:200),'r'),xlabel('TIME IN MSECS')
ylabel('AMPLITUDE'),grid
title ('FIRST 25 MSECS OF WHITE GAUSSIAN NOISE (BW: 0 to 1000 HZ)')
 soundsc(yLP,Fs),pause,subplot


% produce high-pass filtered noise

	 Fc=3000;
    [A,B]=cheby1(15,.01,Fc/4000,'high');
    yHP=filter(A,B,x);
    [H,W] = freqz(A,B,40000,'whole');
    H=abs(H(1:20000));
    f=linspace(0,4000,20000);
    plot(f,2*(H.^2)/Fs), xlabel('FREQ IN HZ'),ylabel('LINEAR'),
    title('PSD OF WHITE GAUSSIAN NOISE (BW: 3000 to 4000 HZ)'),grid,pause 
    
plot(1000*t(1:200), yHP(1:200),'r')  
title ('FIRST 25 MSECS OF WHITE GAUSSIAN NOISE (BW: 3000 to 4000 HZ)'),grid
ylabel('AMPLITUDE'), xlabel('TIME IN MSECS'),pause
soundsc(yHP,Fs),pause
   
  
subplot(211)    
plot(1000*t(1:200), x(1:200)),xlabel('TIME IN MSECS'),grid
ylabel('AMPLITUDE')
title ('FIRST 25 MSECS OF WHITE GAUSSIAN NOISE (BW: 0 to 4000 HZ)')
pause,soundsc(x,Fs),pause, 
subplot(212)
plot(1000*t(1:200), yHP(1:200),'r'),xlabel('TIME IN MSECS'),grid
ylabel('AMPLITUDE')
title ('FIRST 25 MSECS OF WHITE GAUSSIAN NOISE (BW: 3000 to 4000 HZ)')
soundsc(yHP,Fs),pause,subplot


% produce band-pass filtered noise

	 W1=[950/(Fs/2) 1050/(Fs/2)];
    [A,B]=cheby1(5,.1,W1);
    yBP=filter(A,B,x);
    [H,W] = freqz(A,B,40000,'whole');
    H=abs(H(1:20000));
    f=linspace(0,4000,20000);
    plot(f,2*(H.^2)/Fs), xlabel('FREQ IN HZ'),ylabel('LINEAR'),
    title('PSD OF WHITE GAUSSIAN NOISE (BW: 950 to 1050 Hz)'),grid,pause 
    
plot(1000*t(1:400), yBP(1:400),'r'),  
title ('FIRST 50 MSECS OF WHITE GAUSSIAN NOISE (BW: 950 to 1050 Hz)'),grid
ylabel('AMPLITUDE'), xlabel('TIME IN MSECS'),pause
soundsc(yBP,Fs),pause
   
  
subplot(211)    
plot(1000*t(1:400), x(1:400)),xlabel('TIME IN MSECS')
ylabel('AMPLITUDE')
title ('FIRST 50 MSECS OF WHITE GAUSSIAN NOISE (BW: 0 to 4000 Hz)'),grid
pause,soundsc(x,Fs),pause,
subplot(212)
plot(1000*t(1:400), yBP(1:400),'r'),xlabel('TIME IN MSECS')
ylabel('AMPLITUDE')
title ('FIRST 50 MSECS OF WHITE GAUSSIAN NOISE (BW: 950 to 1050 Hz)'),grid
soundsc(yBP,Fs),pause,subplot,close all

subplot(411)
plot(t,x)
ylabel('AMPLITUDE')
title('THE FOUR DIFFERENT NOISE SOURCES')
axis([0 2.5 -8 8]);
text(0.05,5,'(BW: 0 to 4000 HZ)','fontsize',8,'color','black')
soundsc(x,Fs),pause, 
subplot(412)
plot(1000*t(1:200), yLP(1:200),'r')
ylabel('AMPLITUDE')
axis([0 25 -3 3]);
text(0.5,2,'(BW: 0 to 1000 HZ)','fontsize',8,'color','black')
soundsc(yLP,Fs),pause,
subplot(413)
plot(1000*t(1:200), yHP(1:200),'r')  
ylabel('AMPLITUDE')
axis([0 25 -3 3]);
text(0.5,2,'(BW: 3000 to 4000 HZ)','fontsize',8,'color','black')
soundsc(yHP,Fs),pause, 
subplot(414)
plot(1000*t(1:400), yBP(1:400),'r'),  
ylabel('AMPLITUDE'), xlabel('TIME IN MSEC')
axis([0 50 -1 1]);
text(1,0.7,'(BW: 950 to 1050 HZ)','fontsize',8,'color','black')
soundsc(yBP,Fs),pause,subplot,close all







elseif flag4==6	% Pulse shaping for digital transmission
   
   
 % Double-sided mag spectrum of a pulse.   
 x=[ones(1,6) zeros(1,2001) ones(1,5)]; 
 N=length(x);
 plot([-1 -0.5],[0 0],'b','LineWidth',1),hold
 plot([-0.5 -0.5],[0 1],'b','LineWidth',1)
 plot([-0.5 0.5],[1 1],'b','LineWidth',1)
 plot([0.5 0.5],[1 0],'b','LineWidth',1)
 plot([0.5 1],[0 0],'b','LineWidth',1)
 axis([-1 1 0 2])
 plot([0 0],[0 2],'k','LineWidth',1.5)
 grid
 xlabel('TIME IN SECS')
 ylabel('AMPLITUDE')
 title('A PULSE OF DURATION ONE SECOND')
 hold off,pause
 
 
    % plot magnitude spectrum of pulse
    Fs=11;
    X=fft(x)/Fs;		% to get true cont-time FT	
    N=length(X); 
    X=abs(X);
    Y=X(1:1:N/2);
    Y=[Y(N/2:-1:2) Y];    
    F=linspace(-Fs/2,Fs/2,length(Y));
    plot(F,Y),hold
    xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('DOUBLE-SIDED MAGNITUDE SPECTRUM FOR ONE SECOND PULSE')
    plot([0 0],[0 1.5],'k','LineWidth',1.5)
    %text(-4,1.25,'(Non-periodic signals have continuous spectra)','fontsize',12,'color','red')
    axis([-5 5 0 1.5]), % so that plot goes from -5 t0 5Hz rather than -5.5 to 5Hz
    grid
    pause,hold off, axis normal
 
 
 %double-sided phase spectrum of pulse
   close all
   plot([0 0],[-200 200],'k','LineWidth',2),hold
   plot([-5 5],[0 0],'b','LineWidth',2)
   xlabel('FREQ IN HZ'),ylabel('PHASE IN DEGREES')
   title('DOUBLE-SIDED PHASE SPECTRUM FOR ONE SECOND PULSE')
   pause, hold off,axis normal   
 
  
% Examine two pulses of different width 
subplot(211)
x=[ones(1,6) zeros(1,2001) ones(1,5)]; 
 N=length(x);
 plot([-1 -0.5],[0 0],'b','LineWidth',1),hold
 plot([-0.5 -0.5],[0 1],'b','LineWidth',1)
 plot([-0.5 0.5],[1 1],'b','LineWidth',1)
 plot([0.5 0.5],[1 0],'b','LineWidth',1)
 plot([0.5 1],[0 0],'b','LineWidth',1)
 axis([-1 1 0 2])
 plot([0 0],[0 2],'k','LineWidth',1)
 grid
 xlabel('TIME IN SECS')
 ylabel('AMPLITUDE')
 title('TWO DIFFERENT PULSES'),pause
 subplot(212)
  % plot double-sided magnitude spectrum of one second pulse
    Fs=11;
    X=fft(x)/Fs;		% to get true cont-time FT	
    N=length(X); 
    X=abs(X);
    Y=X(1:1:N/2);
    Y=[Y(N/2:-1:2) Y];    
    F=linspace(-Fs/2,Fs/2,length(Y));
    plot(F,Y,'b'),hold
    xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('DOUBLE-SIDED MAGNITUDE SPECTRUM')
    plot([0 0],[0 1.5],'k','LineWidth',1)
    axis([-5 5 0 1.5]), % so that plot goes from -5 t0 5Hz rather than -5.5 to 5Hz
    grid
    pause

 subplot(211)
 x=2*[ones(1,3) zeros(1,2007) ones(1,2)]; 
 N=length(x);
 plot([-1 -0.25],[0 0],'r','LineWidth',1)
 plot([-0.25 -0.25],[0 2],'r','LineWidth',1)
 plot([-0.25 0.25],[2 2],'r','LineWidth',1)
 plot([0.25 0.25],[2 0],'r','LineWidth',1)
 plot([0.25 1],[0 0],'r','LineWidth',1)
 axis([-1 1 0 3])
 plot([0 0],[0 3],'k','LineWidth',1)
 pause
 
 subplot(212)
 % plot double-sided magnitude spectrum of 0.5 second pulse
    Fs=10;    % need to change from 11 Hz to 10 Hz to get correct scaling
    X=fft(x)/Fs;		% to get true cont-time FT	
    N=length(X); 
    X=abs(X);
    Y=X(1:1:N/2);
    Y=[Y(N/2:-1:2) Y];    
    F=linspace(-Fs/2,Fs/2,length(Y));
    plot(F,Y,'r')
    xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    plot([0 0],[0 1.5],'k','LineWidth',1)
    axis([-5 5 0 1.5]), % so that plot goes from -5 t0 5Hz rather than -5.5 to 5Hz
    pause,close all

    

% Examine rectangular and triangular pulses
subplot(211)
plot([-1 -0.5],[0 0],'b','LineWidth',1),hold
plot([0 0],[0 3],'k','LineWidth',1)
plot([-0.5 -0.5],[0 1],'b','LineWidth',1)
 plot([-0.5 0.5],[1 1],'b','LineWidth',1)
 plot([0.5 0.5],[1 0],'b','LineWidth',1)
 plot([0.5 1],[0 0],'b','LineWidth',1)
 axis([-1 1 0 3])
 plot([-1 -0.5],[0 0],'r','LineWidth',1)
plot([-0.5 0],[0 2],'r','LineWidth',1)
plot([0 0.5],[2 0],'r','LineWidth',1)
plot([0.5 1],[0 0],'r','LineWidth',1)
 grid
 xlabel('TIME IN SECS')
 ylabel('AMPLITUDE')
 title('TWO DIFFERENT PULSES - 1 SEC IN WIDTH')
 text(-0.3,2.8,'Narrower effective time-bandwidth ...','fontsize',12,'color','red')
 text(-0.3,2.3,'... but reduced slope gradient','fontsize',12,'color','red')
 pause
 subplot(212)
  % plot double-sided magnitude spectra of pulses
  
  F=linspace(-10,10,1000);
  X=abs(sin(pi*F)./(pi*F));
  plot(F,X,'b'),hold
  plot([0 0],[0 1],'k','LineWidth',1)
  Y=abs((sin(pi*F/2)./(pi*F/2)).^2);
  plot(F,Y,'r');
    xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('DOUBLE-SIDED MAGNITUDE SPECTRA')
    grid
    text(1,0.9,'Wider mainlobe ...','fontsize',12,'color','red')
    text(1,0.7,'... but faster sidelobe roll-off','fontsize',12,'color','red')
    pause
close all



% Examine rectangular and raised cosine (time-domain) pulses
subplot(211)
plot([-1 -0.5],[0 0],'b','LineWidth',1),hold
 plot([0 0],[0 3],'k','LineWidth',1)
plot([-0.5 -0.5],[0 1],'b','LineWidth',1)
 plot([-0.5 0.5],[1 1],'b','LineWidth',1)
 plot([0.5 0.5],[1 0],'b','LineWidth',1)
 plot([0.5 1],[0 0],'b','LineWidth',1)
 axis([-1 1 0 3])
 grid
 xlabel('TIME IN SECS')
 ylabel('AMPLITUDE')
 title('TWO DIFFERENT PULSES - 1 SEC IN WIDTH')
 t=linspace(-0.5,0.5,1000);
 y=(1+cos(2*pi*t));
 y=[zeros(1,500) y zeros(1,500)];
  t=linspace(-1.0,1.0,2000);
 plot(t,y,'r','LineWidth',1)
 text(-0.3,2.8,'Narrower effective time-bandwidth ...','fontsize',12,'color','red')
 text(-0.3,2.3,'... but reduced slope gradient','fontsize',12,'color','red')
 pause
 
 
 
 
 subplot(212)
  % plot double-sided magnitude spectra of pulses
  
  F=linspace(-10,10,1000);
  X=abs(sin(pi*F)./(pi*F));
  plot(F,X,'b'),hold
  plot([0 0],[0 1],'k','LineWidth',1)
  Y=(sin(pi*F)./(pi*F));
  Y=abs(Y./(1-F.^2));
    plot(F,Y,'r');
    xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('DOUBLE-SIDED MAGNITUDE SPECTRA')
    grid
    text(1,0.9,'Wider mainlobe ...','fontsize',12,'color','red')
    text(1,0.7,'... but faster sidelobe roll-off','fontsize',12,'color','red')
    pause
close all








% Examine rectangular, triangular and raised cosine (time-domain) pulses
subplot(211)

% rectangular
plot([-1 -0.5],[0 0],'b','LineWidth',1),hold
 plot([0 0],[0 3],'k','LineWidth',1)
plot([-0.5 -0.5],[0 1],'b','LineWidth',1)
 plot([-0.5 0.5],[1 1],'b','LineWidth',1)
 plot([0.5 0.5],[1 0],'b','LineWidth',1)
 plot([0.5 1],[0 0],'b','LineWidth',1)
 axis([-1 1 0 3])
 
% triangular 
plot([-1 -0.5],[0 0],'r','LineWidth',1)
plot([-0.5 0],[0 2],'r','LineWidth',1)
plot([0 0.5],[2 0],'r','LineWidth',1)
plot([0.5 1],[0 0],'r','LineWidth',1)

% raised cosine 
t=linspace(-0.5,0.5,1000);
 y=(1+cos(2*pi*t));
 y=[zeros(1,500) y zeros(1,500)];
  t=linspace(-1.0,1.0,2000);
 plot(t,y,'g','LineWidth',1)
 grid
  xlabel('TIME IN SECS')
 ylabel('AMPLITUDE')
 title('THREE DIFFERENT PULSES - 1 SEC IN WIDTH')
 pause 
 
 
 subplot(212)
  % plot double-sided magnitude spectra of all pulses
  
 % rectangular pulse spectrum 
 F=linspace(-10,10,1000);
 X=abs(sin(pi*F)./(pi*F));
 plot(F,X,'b'),hold
  plot([0 0],[0 1],'k','LineWidth',1)
 % triangular pulse spectrum 
 Y=abs((sin(pi*F/2)./(pi*F/2)).^2);
 plot(F,Y,'r');
 
  % raised cosine spectrum 
  X=abs(sin(pi*F)./(pi*F));
  plot(F,X,'b')
  Y=(sin(pi*F)./(pi*F));
  Y=abs(Y./(1-F.^2));
  plot(F,Y,'g');
xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('DOUBLE-SIDED MAGNITUDE SPECTRA')
    grid
     pause
close all








% Examine rectangular, and raised cosine (freq-domain) pulses
subplot(211)

% rectangular
plot([-4 -0.5],[0 0],'b','LineWidth',1),hold
 plot([0 0],[-.2 1.2],'k','LineWidth',1)
plot([-0.5 -0.5],[0 1],'b','LineWidth',1)
 plot([-0.5 0.5],[1 1],'b','LineWidth',1)
 plot([0.5 0.5],[1 0],'b','LineWidth',1)
 plot([0.5 4],[0 0],'b','LineWidth',1)
 axis([-2 2 -0.2 1.2])
 
% raised cosine (freq domain)
t=linspace(-4,4,1000);
y=sin(pi*t)./(pi*t);
y=y.*(cos(pi.*t)./(1-4*t.^2));
plot(t,y,'r','LineWidth',1)
 plot([0 0],[0 1],'k','LineWidth',1)
 grid
 xlabel('TIME IN SECS')
 ylabel('AMPLITUDE')
 title('RECTANGULAR PULSE AND PULSE FROM RAISED COSINE-ROLLOFF FILTER')
 text(.6,0.75,'raised cosine roll-off factor, r=1.0','fontsize',10,'color','red')
 pause 
 
 
 subplot(212)
 % plot double-sided magnitude spectra of all pulses
  % raised cosine spectrum 
  
  F=linspace(-1,1,1000);
  Y=abs(0.5*(1+cos(pi*F)));
  Y=[zeros(1,2000) Y zeros(1,2000)];
  F=linspace(-5,5,5000);
  plot(F,Y,'r');hold
xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
title('DOUBLE-SIDED MAGNITUDE SPECTRA')
 text(1.1,0.7,'raised cosine roll-off factor, r=1.0','fontsize',10,'color','red')
 grid

 
 % rectangular pulse spectrum 
  X=abs(sin(pi*F)./(pi*F));
 plot(F,X,'b')
  pause
close all


% Signalling with raised cosine pulses
 
t=linspace(-4,4,1000);
y=sin(pi*(t+1))./(pi*(t+1));
y=y.*(cos(pi.*(t+1))./(1-4*(t+1).^2));
plot(t,y,'b','LineWidth',1),hold
y=sin(pi*(t))./(pi*(t));
y=y.*(cos(pi.*(t))./(1-4*(t).^2));
plot(t,y,'r','LineWidth',1)
y=sin(pi*(t-1))./(pi*(t-1));
y=y.*(cos(pi.*(t-1))./(1-4*(t-1).^2));
plot(t,y,'k','LineWidth',1)
y=sin(pi*(t-2))./(pi*(t-2));
y=y.*(cos(pi.*(t-2))./(1-4*(t-2).^2));
plot(t,y,'y','LineWidth',1)
y=sin(pi*(t+2))./(pi*(t+2));
y=y.*(cos(pi.*(t+2))./(1-4*(t+2).^2));
plot(t,y,'g','LineWidth',1)
 grid
 xlabel('TIME IN SECS')
 ylabel('AMPLITUDE')
 title('PULSES FROM RAISED COSINE FILTERS: NO ISI AT THE SAMPLING INSTANTS')
 text(-3.5,1.1,'Fs = 1/Ts = 1Hz; Pulse bandwidth = 1Hz; Channel required B = 1Hz; r=1','fontsize',10,'color','red')
 text(-3.5,-0.1,'In general baud rate = 2B/(1+r); B=bandwidth; r=rolloff factor','fontsize',12,'color','black')
 pause
 close all
 
  
    
   
elseif flag4==7	% Continue with rest of program    
break
elseif flag4==8	% end program
return
end					% goes with 'if flag4==1'
 
   
 									end			% goes with 'while 6=6' Encloses flag4 routine  
   
   
   
   
elseif flag3==3	% Return to main program   
break
elseif flag3==4	% end program
return
end					% goes with 'if flag3==1'







						end		% goes with while 3==3
  
 % -----------------------------------------------------------------------------
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  function demo3 
% ----------------------------------------------------------------------------------
%                 DEMO 3 : USING SPECTROGRAMS FOR VARIOUS SOUNDS
% ----------------------------------------------------------------------------------


	while 100==100 
    
    
      C100={'WHAT IS A SPECTROGRAM?'...
            'SPECTROGRAM OF SPEECH'...
            'TRY AND IDENTIFY THESE SPECTROGRAMS'...
            'RETURN TO MAIN MENU'...
   			'END'};

           
flag100=menu('DEMO3: USING SPECTROGRAMS FOR VARIOUS SOUNDS  ' ,C100);

   
   
   
   
   
   if flag100==1; 			%WHAT IS A SPECTROGRAM?            
      
      
      
 % Tone F1 followed by F2     
 Fs=32000;					% sampling frequency=32000 Hz
Tlength=1;					% Set length of each tone to one seconds/ 2 secs in total
Tdisplay=.050;				% Display 50 ms of tone 
t=[0:1:Tlength*Fs-1];	% This is to keep N even, otherwise FFT takes a long time???
t1=[0:1:Tdisplay*Fs];	% Plotting vector - number of samples to make up Tdisplay
F1=200; F2=1000;
y1=sin(2*pi*t*F1/Fs);
y2=sin(2*pi*t*F2/Fs);
y=[y1 y2];
ydisplay=[y1(1:799) y2(1:800)];
N1=length(ydisplay);
t=linspace(1-.025, 1+0.025, N1);
plot(t,ydisplay),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' 50 MSEC CENTRE SAMPLE OF TWO SEC. SIGNAL OF F1= 200Hz FOLLWED BY F2=1000Hz')
pause,soundsc(y,Fs),pause
N=length(y);
Y=2*(2/N)*fft(y);	% Normally scaling is (2/N) to get single-sided FS coeffs
% But because each sinusoid occupies only N/2 points, scale by (4/N) to get correct FS
% coeffs.
Y=abs(Y);
F=linspace(0,Fs/2,N/2);
plot(F,Y(1:N/2),'r'),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE'),grid
title('SPECTRUM FOR SIGNAL')
text(1000,1.1,'Did one tone occur first? - no time domain information!!','fontsize',12,'color','blue')
pause
subplot(211)
plot(t,ydisplay),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' 50 MSEC CENTRE SAMPLE OF TWO SEC. SIGNAL OF F1= 200Hz FOLLOWED BY F2=1000Hz')
subplot(212)
plot(F,Y(1:N/2),'r'),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE'),grid
title('SPECTRUM FOR SIGNAL')
text(1000,1.1,'Did one tone occur first? - no time domain information!!','fontsize',12,'color','blue')
pause,soundsc(y,Fs),pause
subplot



% Show how window moves across plot to form spectrogram

% Hanning window
close all
subplot(211)
plot(t,ydisplay),hold
xlabel('TIME IN SECS'),ylabel('AMPLITUDE'),grid
title(' APPLY HANNING WINDOW TO SIGNAL')
axis([.975 1.025 -1.5 1.5])
plot([0.975 1.025],[0 0],'LineWidth',1.0,'color','black');
pause
w=hanning(400)';	% row vector
Tss=t(2)-t(1);		% what is the time spacing between samples?
t2=[0.975:Tss:0.975+399*Tss];
plot(t2,w,'r','LineWidth',1.5)
pause

subplot(212)
zz=ydisplay(1:400);
windowedsignal=zz.*w;
signallength=length(ydisplay);
N5=signallength-400;
v=[windowedsignal zeros(1,N5)];
plot(t,v),hold
xlabel('TIME IN SECS'),ylabel('AMPLITUDE'),grid
title(' HANNING WINDOWED SIGNAL')
axis([.975 1.025 -1.5 1.5])
vw=[w zeros(1,N5)];
plot(t,vw,'r--'),plot(t,-vw,'r--')
pause,hold off
close all


subplot(211)
plot(t,v),hold
xlabel('TIME IN SECS'),ylabel('AMPLITUDE'),grid
title(' HANNING WINDOWED SIGNAL')
axis([.975 1.025 -1.5 1.5])
vw=[w zeros(1,N5)];
plot(t,vw,'r--'),plot(t,-vw,'r--')
pause

start=0;
start1=1;
zdisplay=[ydisplay 0]; % we need one extra point to keep everything sweet!
for j=1:1 
t2=[start+0.975:Tss:start+0.975+399*Tss];
start=start+200*Tss;		% 50 per cent window overlap
subplot(212)
yy=zdisplay(start1:1:start1+399);
start1=start1+200;
yy=w.*yy;
N4=sum(w);
YY=(2/N4)*abs(fft(yy));  	%  to take into account effect of window
% Note that FS coeffs will not be exactly one because window does not include
% an integer number of cycles of waveform.
YY=YY(1:200);
F=linspace(0,Fs/2,200);
plot(F,YY,'r'),grid
xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
title('WEIGHTED SPECTRUM FOR WINDOWED SIGNAL')
pause
end
subplot



plot(t,ydisplay),hold
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' HANNING WINDOW WITH 50% OVERLAP')
axis([.975 1.025 -1.5 1.5])
figure(1)
plot([0.975 1.025],[0 0],'LineWidth',1.0,'color','black');grid
w=hanning(400)';	% row vector
Tss=t(2)-t(1);		% what is the time spacing between samples?
pause


start=0;
for j=1:8
t2=[start+0.975:Tss:start+0.975+399*Tss];
plot(t2,w,'r','LineWidth',1.5)
start=start+200*Tss;		% 50 per cent window overlap
pause
end
hold off



subplot(211)
plot(t,ydisplay),hold
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' HANNING WINDOW WITH 50% OVERLAP')
axis([.975 1.025 -1.5 1.5])
plot([0.975 1.025],[0 0],'LineWidth',1.0,'color','black');grid

start=0;
start1=1;
zdisplay=[ydisplay 0]; % we need one extra point to keep everything sweet!
for j=1:7 
t2=[start+0.975:Tss:start+0.975+399*Tss];
subplot(211)
plot(t2,w,'r','LineWidth',1.5)
start=start+200*Tss;		% 50 per cent window overlap
subplot(212)
yy=zdisplay(start1:1:start1+399);
start1=start1+200;
yy=w.*yy;
N4=sum(w);
YY=(2/N4)*abs(fft(yy));  	%  to take into account effect of window
% Note that FS coeffs will not be exactly one because window does not include
% an integer number of cycles of waveform.
YY=YY(1:200);
F=linspace(0,Fs/2,200);
plot(F,YY,'r'),grid
xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
title('WEIGHTED SPECTRUM FOR EACH WINDOWED SIGNAL')
pause
end
close all

% Plot 3-D spectrogram
S=specgram(y,800,Fs);
S=abs(S);
S=S/max(max(S));
Flabel=linspace(0,16000,401);
Tlabel=linspace(0,2,159);
mesh(Tlabel,Flabel,S);
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
title('3-D SPECTROGRAM OF TWO TONES 200Hz AND 1000Hz')
shading interp;view([67,27]);
text(1,6000,0.6,'STACK ALL FOURIER TRANSFORMS TOGETHER','fontsize',10,'color','red')
pause;soundsc(y,Fs),pause
for j=0:15:360
view([67+j,27]);pause(1)
end
pause

% Plot the pseudocolour spectrogram
specgram(y,800,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ. IN HZ')
title('PSEUDO-COLOUR 2-D SPECTROGRAM OF THE SIGNAL')
text(0.1,10000,'NOW WE HAVE BOTH TIME & FREQ. DOMAIN INFO.','fontsize',12,'color','red')
pause
soundsc(y,Fs),pause
subplot(211)
plot(t,ydisplay)
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' 50 MSEC CENTRE SAMPLE OF TWO SEC. SIGNAL OF F1= 200Hz & F2=1000Hz')
subplot(212)
specgram(y,800,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ. IN HZ')
title('SPECTROGRAM OF THE SIGNAL')
text(0.1,10000,'NOW WE HAVE BOTH TIME & FREQ. DOMAIN INFO.','fontsize',12,'color','red')
pause
soundsc(y,Fs),pause
subplot
close all

% Tones F1 and F2 added together

Tlength=2;					% Set length of each tone to two seconds in total
Tdisplay=.050;				% Display 50 ms of tone 
t=[0:1:Tlength*Fs-1];	% This is to keep N even, otherwise FFT takes a long time???
t1=[0:1:Tdisplay*Fs];	% Plotting vector - number of samples to make up Tdisplay
F1=200; F2=1000;
y1=sin(2*pi*t*F1/Fs);
y2=sin(2*pi*t*F2/Fs);
z=y1+y2;


zdisplay=z(1:Tdisplay*Fs);
N1=length(zdisplay);
t=linspace(0,Tdisplay, N1);
plot(t,zdisplay),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' 50 MSEC SAMPLE OF TWO SEC. SIGNAL OF SUM OF F1= 200Hz & F2=1000Hz')
pause,soundsc(z,Fs),pause
N=length(z);
Z=(2/N)*fft(z);			
Z=abs(Z);
F=linspace(0,Fs/2,N/2);
plot(F,Z(1:N/2),'r'),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE'),grid
axis([0 16000 0 1.2])
title('SPECTRUM FOR SIGNAL')
text(1100,0.75,'Did one tone occur first? - no time domain information!!','fontsize',12,'color','blue')
text(1100,0.65,'     ( Spectrum similar to F1 followed by F2 !! )','fontsize',14,'color','red')
pause
subplot(211)
plot(t,zdisplay),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' 50 MSEC SAMPLE OF TWO SEC. SIGNAL OF SUM OF F1= 200Hz & F2=1000Hz')
subplot(212)
axis([0 16000 0 1.2])
plot(F,Z(1:N/2),'r'),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE'),grid
axis([0 16000 0 1.2])
title('SPECTRUM FOR SIGNAL')
text(1100,0.75,'Did one tone occur first? - no time domain information!!','fontsize',12,'color','blue')
pause,soundsc(z,Fs),pause


subplot

% Plot 3-D spectrogram
S=specgram(z,800,Fs);
S=abs(S);
S=S/max(max(S));
Flabel=linspace(0,16000,401);
Tlabel=linspace(0,2,159);
mesh(Tlabel,Flabel,S);
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
title('3-D SPECTROGRAM OF TWO TONES 200Hz AND 1000Hz')
shading interp;view([80,40]);
pause
for j=0:15:360
    view([80+j,40]);pause(1)
end
view([80,40])
pause


% Plot the pseudocolour spectrogram
specgram(z,800,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ. IN HZ')
title('PSEUDO-COLOUR 2-D SPECTROGRAM OF THE SIGNAL')
text(0.1,10000,'NOW WE HAVE BOTH TIME & FREQ. DOMAIN INFO.','fontsize',12,'color','red')
pause
soundsc(z,Fs),pause
subplot(211)
plot(t,zdisplay)
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' 50 MSEC SAMPLE OF TWO SEC. SIGNAL OF SUM OF F1= 200Hz & F2=1000Hz')
subplot(212)
specgram(z,800,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ. IN HZ')
title('SPECTROGRAM OF THE SIGNAL')
text(0.1,10000,'NOW WE HAVE BOTH TIME & FREQ. DOMAIN INFO.','fontsize',12,'color','red')
pause
soundsc(z,Fs),pause
subplot
close all
















   elseif flag100==2;		%spectrogam OF SPEECH      
      
%-----------------
% 'SPEECH'
%----------------



% Do speech in considerable detail to explain the principle of a spectrogam




clc									% clears screen
clear									% clears all variables
close all							% closes all windows
load speech;				% loads variable speech, Fs=8000Hz, 8bits PCM, 2.5 secs
x=speech;
Fs=8000;						% sampling frequency=8000 Hz
N=length(x);
t=[0:1:N-1]/Fs;
plot(t,x);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF SPEECH'),pause,soundsc(x,8000),pause

% Single-sided spectrum
    X=(1/Fs)*fft(x);		
    X=abs(X);
    N=length(X);
    F=linspace(0,Fs/2,N/2);
    plot(F,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR SPEECH SIGNAL')
    text(700,40,'Does not say how the spectrum changes with time','fontsize',12,'color','red')
    pause
    
    
    
    
    
  % unvoiced speech
  
plot(t,x);, xlabel('SECS'),hold
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF SPEECH'),pause,  
t1=6780/Fs;t2=7499/Fs;
plot([t1 t1],[-3000 4000],'r-')
plot([t2 t2],[-3000 4000],'r-')
text(1.05,3500,'ZOOM IN ON AN UNVOICED PART OF SPEECH','fontsize',9,'color','red'),pause
soundsc(x(6780:7499),8000),pause
hold off

  
y=x(6780:7499);
yzeropadded=[y zeros(1,10*length(y))];
N=length(y);
t=[0:1:N-1]/Fs;
plot(t,y);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
text(.01,700,'APPROX RANDOM','fontsize',12,'color','red')
title ('SAMPLE OF UNVOICED SPEECH'),pause
soundsc(y,8000),pause
Y=(1/Fs)*fft(y);		
Y=abs(Y);
N=length(Y);
F=linspace(0,Fs/2,N/2);
plot(F,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
title('SPECTRUM FOR SAMPLE OF UNVOICED SPEECH')
text(100,1.5,' most energy in HF components\rightarrow','fontsize',12,'color','red')
pause

subplot(211)
plot(t,y);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
text(.01,700,'APPROX RANDOM','fontsize',12,'color','red')
title ('SAMPLE OF UNVOICED SPEECH')
subplot(212)
plot(F,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
title('SPECTRUM FOR SAMPLE OF UNVOICED SPEECH')
text(100,1.5,' most energy in HF components\rightarrow','fontsize',12,'color','red')
pause(1),soundsc(y,8000),pause,subplot

 % Voiced speech
N=length(x);
t=[0:1:N-1]/Fs;   
plot(t,x);, xlabel('SECS'),hold
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF SPEECH'),pause,  
t1=5000/Fs;t2=6119/Fs;
plot([t1 t1],[-3000 4000],'r-')
plot([t2 t2],[-3000 4000],'r-')
text(1.05,3500,'ZOOM IN ON A VOICED PART OF SPEECH','fontsize',9,'color','red'),pause
soundsc(x(5000:6119),8000),pause
hold off



y=x(5000:6119);
yzeropadded=[y zeros(1,10*length(y))];
N=length(y);
t=[0:1:N-1]/Fs;
plot(t,y);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
text(.06,2500,'QUASI PERIODIC','fontsize',12,'color','red')
title ('SAMPLE OF VOICED SPEECH'),pause
soundsc(y,8000),pause
Y=(1/Fs)*fft(y);		
Y=abs(Y);
N=length(Y);
F=linspace(0,Fs/2,N/2);
plot(F,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
title('SPECTRUM FOR SAMPLE OF VOICED SPEECH')
text(1000,10,'\leftarrow most energy in discrete LF components','fontsize',12,'color','red')
pause

subplot(211)
plot(t,y);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('SAMPLE OF VOICED SPEECH')
text(.06,2500,'QUASI PERIODIC','fontsize',12,'color','red')
subplot(212)
plot(F,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
title('SPECTRUM FOR SAMPLE OF VOICED SPEECH')
text(1000,10,'\leftarrow most energy in discrete LF components','fontsize',12,'color','red')
pause(1),soundsc(y,8000),pause,subplot

  
    


% Plot 3-D spectrogram

N=length(x);
t=[0:1:N-1]/Fs;   
S=specgram(x,250,Fs);
S=abs(S);
S=S/max(max(S));
Flabel=linspace(0,4000,126);
Tlabel=linspace(0,2.5,159);
mesh(Tlabel,Flabel,S);
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
title('3-D SPECTROGRAM OF SPEECH')
shading interp;
view([80,40]);pause
for j=0:15:360
    view([80+j,40]);pause(1)
end
pause


    
N=length(x);
t=[0:1:N-1]/Fs;   
specgram(x,250,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
title('SPECTROGRAM OF SPEECH')
pause,soundsc(x,8000),pause   
subplot(211)
plot(t,x),xlabel('TIME IN SECS')
ylabel('AMPLITUDE'),grid
title ('SPEECH SAMPLE (ABOVE) & SPECTROGRAM (BELOW)')
subplot(212)
specgram(x,250,Fs) 
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause,soundsc(x,8000),pause,subplot 
close all     
      







   elseif flag100==3;		%TRY AND IDENTIFY THESE SPECTROGRAMS      
      
      
      
      							while 44==44   
   
      C150={'SELECTION 1 (JAZZ)'...
            'SELECTION 2 (POP/CLASSICAL)'...
            'SELECTION 3 (SALSA/FOLK)'...
            'SELECTION 4 (HUMAN SOUNDS)'...
            'SELECTION 5 (NON-HUMAN SOUNDS)'...
            'RETURN TO MENU OF DEMO 3'...
   			'END'};

           
flag150=menu('SUB-MENU OF DEMO3 (IDENTIFYING spectrogamS) - PLEASE SELECT:' ,C150);


      
						 if flag150==1;
     
      
%---------------------     
%---------------------   
% SELECTION ONE: JAZZ      
%---------------------
%---------------------
    

%-----------------
% 'WYNTONKELLY'
%------------------

load wyntonkelly
specgram(y,500,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause
title('WYNTON KELLY')
pause,soundsc(y,Fs)
pause,soundsc(y,Fs),pause


%-----------------
% 'YESTERDAYS'
%------------------

load yesterdays
specgram(y,800,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause
title('YESTERDAYS (Jerome Kern) PLAYED BY DAVID CAMRASS/D-MINOR')
text(0.2,440,'A=440Hz\rightarrow','fontsize',13,'color','blue')
text(10,4200,'vibrato\rightarrow','fontsize',13,'color','blue')
text(9.5,2000,'glissando\rightarrow','fontsize',13,'color','blue')
pause,soundsc(y,Fs)
pause,soundsc(y,Fs),pause



%-----------------
% 'MILES/COLTRANE'
%------------------

load miles
specgram(y,500,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause
title('MILES DAVIES/JOHN COLTRANE')
pause,soundsc(y,Fs)
pause,soundsc(y,Fs),pause




									elseif flag150==2;
      
%----------------------------     
%----------------------------   
% SELECTION TWO: POP/CLASSICAL    
%----------------------------
%----------------------------


%-----------------
% 'PERFECTDAY'
%------------------

load perfectday
specgram(y,500,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause
title('LOU REED')
pause,soundsc(y,Fs)
pause,soundsc(y,Fs),pause


%-----------------
% 'PRETTYWOMAN'
%------------------

load prettywoman
specgram(y,500,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause
title('PRETTY WOMAN')
pause,soundsc(y,Fs)
pause,soundsc(y,Fs),pause



%-----------------
% 'MESSIAH/HANDEL'
%------------------

load handel
specgram(y,600,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause
title(' HANDEL ')
pause,soundsc(y,Fs)
pause,soundsc(y,Fs),pause




								elseif flag150==3;
        
%---------------------------     
%---------------------------   
% SELECTION THREE: SALSA/FOLK     
%---------------------------
%---------------------------
    

%-----------------
% 'SALSA2'
%------------------

load salsa2
specgram(y,650,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause
title(' BUENA VISTA SOCIAL CLUB ')
pause,soundsc(y,Fs)
pause,soundsc(y,Fs),pause


%-----------------
% 'SALSA3'
%------------------

load salsa3
specgram(y,600,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause
title(' TAM-TAM 2000 - Senegal/Cape Verde ')
pause,soundsc(y,Fs)
pause,soundsc(y,Fs),pause


%-----------------
% 'ALTAN'
%------------------

load altan
specgram(y,500,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause
title('ALTAN')
pause,soundsc(y,Fs)
pause,soundsc(y,Fs),pause


												elseif flag150==4;

%------------------------------     
%------------------------------   
% SELECTION FOUR: HUMAN SOUNDS     
%-----------------------------
%-----------------------------



%-----------------
% 'SILENCE'
%----------------

load silence
N=length(y);
t=[0:1/Fs:(N-1)/Fs];
plot(t,y), ylabel('AMPLITUDE')
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
xlabel('TIME IN SECS')
ylabel('AMPLITUDE')
title('WHAT DO YOU THINK THIS IS?'),pause
specgram(y,300,Fs),pause
title('SILENCE')
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
text(0.6,2600,'Voiced speech','fontsize',14,'color','blue')
text(0.25,3500,'Unvoiced speech','fontsize',14,'color','blue')
text(1.1,3500,'Unvoiced speech','fontsize',14,'color','blue')
pause,soundsc(y,Fs)
pause,soundsc(y,Fs),pause



%-----------------
% 'VOWELS'
%----------------

load vowel
specgram(y,400,Fs),title('LET US NOW LOOK AT SOME OTHER SPEECH'),pause
title('A,    E,    I,    O,    U')
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
text(1.5,3800,'\leftarrowFormant frequency','fontsize',14,'color','blue')
pause,soundsc(y,Fs)
pause,soundsc(y,Fs),pause
load vowel1
specgram(y,500,Fs),pause
title('A, E, I, O, U - NOTE THE DIFFERENCES?')
pause,soundsc(y,Fs)
pause,soundsc(y,Fs),pause


%-----------------
% 'WHO1'
%------------------


load who1
specgram(y1,300,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause
title(' "WHO?" - version one')
pause,soundsc(y1,Fs)
pause,soundsc(y1,Fs),pause


%-----------------
% 'WHO2'
%------------------

% seems to have dc level
load who2
y2=y2-mean(y2);
specgram(y2,300,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause
title(' "WHO?" - version two')
pause,soundsc(y2,Fs)
pause,soundsc(y2,Fs),pause


%---------------
% 'HELLO'
%---------------

load hello
specgram(y,300,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause
title('THE SAME WORD SAID TWICE'),pause
title('SPEECH RECOGNITION IS DIFFICULT!'),pause
title('HELLO                          HELLO')
pause,soundsc(y,Fs)
pause,soundsc(y,Fs),pause

%-----------------------------------------------



%-----------------------------
% 'THE SIMPSONS'
%------------------------------

load simpsons
specgram(y,1100,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause
title('THE SIMPSONS/FLANDERS')
pause,soundsc(y,Fs),pause
%-----------------------------------------------






														elseif flag150==5;

                                                            
                                                            
                                                            
%----------------------------------    
%----------------------------------
% SELECTION FIVE: NON-HUMAN SOUNDS     
%----------------------------------
%----------------------------------



%-----------------
% 'TRAIN WHISTLE'
%------------------
load train
specgram(y,350,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause
title('TRAIN WHISTLE ')
pause,soundsc(y,Fs)
pause,soundsc(y,Fs),pause




%-----------------
% 'CHIRP'
%------------------

load chirp
specgram(y,200,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause
title(' CHIRP ')
pause,soundsc(y,Fs)
pause,soundsc(y,Fs),pause


%-----------------
% 'GONG'
%------------------


load gong
specgram(y,300,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause
title(' GONG ')
pause,soundsc(y,Fs)
pause,soundsc(y,Fs),pause


%-----------------
% 'CAR'
%------------------
load dcar
y=y(1:60000);
specgram(y,400,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause
title('BROADBAND CAR NOISE ')
pause,soundsc(y,Fs)
pause,soundsc(y,Fs),pause


%-----------------
% 'SPLAT'
%------------------
load splat
specgram(y,200,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause
title('EGG DROPPING ')
pause,soundsc(y,Fs)
pause,soundsc(y,Fs),pause


%--------------------------
% 'ALIEN FACES SPECTROGRAM'
%--------------------------
load alien_faces
y=[y' y'];
specgram(y,700,Fs)
xlabel('TIME IN SECS')
ylabel('FREQ IN HZ')
pause
title('ALIEN FACES SPECTROGRAM')
soundsc(y,Fs),pause




													elseif flag150==6; 		% return to main menu of demo3
   												break
      											elseif flag150==7;		% end program
													close all
                                       return
                                       
       											end							% goes with 'if flag150==1'




													end		%goes with while 44==44 













  
      
   elseif flag100==4;		% return to main menu
      
      close all
      break
      
   else							% end the program   
      
      return
      
      
   end
   
   
end   % goes with while 100=100
































  function demo4 
% ----------------------------------------------------------------------------------
%                 DEMO 4 : THE SPECTRA OF GUITAR SOUNDS
% ----------------------------------------------------------------------------------

%-----------------
% 'GUITAR'
%------------------



load guitar
N=length(y);
t=[0:1/Fs:(N-1)/Fs];
plot(t,y),ylabel('AMPLITUDE')
xlabel('TIME IN SECS'),zoom on
title('WHAT DO YOU THINK THIS IS?'),pause
t=[0:1/Fs:200/Fs];
z=y(5000:5200);
plot(1000*t,z),grid,
title('ENLARGED VIEW OF CENTRAL PART')
xlabel('TIME IN MILLI-SECS'),ylabel('AMPLITUDE'),pause
Z=log10(abs(fft(z)));
Z=Z(1:101);
f=[0:Fs/201:(100*Fs)/201];
plot(f,Z),grid,xlabel('FREQ IN HZ'),
ylabel('dBs'),title('FOURIER TRANSFORM OF ENLARGED CENTRAL PART'),pause
title('WHY THE LARGE PEAK AT ABOUT 329 HZ?'),pause
title('BUT WHY ALSO THE SMALL PEAK AT ABOUT 54.8 HZ?'),pause
plot(1000*t,z),grid,
title('PERIODICITY OF APPROX 3 MS ?')
xlabel('TIME IN MILLI-SECS'),ylabel('AMPLITUDE'),pause

t=[0:1/Fs:(N-1)/Fs];
plot(t,y),xlabel('SAMPLE NUMBER'),ylabel('AMPLITUDE')
xlabel('TIME IN SECS'),title(' "HIGH E-STRING ON COLINS GUITAR" '),pause
soundsc(y,Fs)
pause,soundsc(y,Fs),pause
specgram(y,400,Fs)
title(' "SPECTROGRAM OF HIGH E-STRING ON COLINS GUITAR" ')
pause,soundsc(y,Fs)
pause,soundsc(y,Fs),pause



%-----------------
% 'GUITAR1'
%------------------



load guitar1
N=length(y);
dy=y(1:20000);
gy=y(20000:N);
t=[0:1/Fs:(N-1)/Fs];
plot(t,y),xlabel('SAMPLE NUMBER'),ylabel('AMPLITUDE')
xlabel('TIME IN SECS')
title('WHAT DO YOU THINK THIS IS?'),pause
title('E-STRING THEN ME')
soundsc(y,Fs)
pause,soundsc(y,Fs),pause
t=[0:1/Fs:200/Fs];
z=y(10000:10200);
plot(1000*t,z),grid,
title('ENLARGED VIEW OF FIRST SECTION')
xlabel('TIME IN MILLI-SECS'),ylabel('AMPLITUDE'),pause,soundsc(dy,Fs),pause
z1=y(30000:30200);
plot(1000*t,z1),grid,
title('ENLARGED VIEW OF SECOND SECTION')
xlabel('TIME IN MILLI-SECS'),ylabel('AMPLITUDE'),pause,soundsc(gy,Fs),pause
subplot(211)
plot(1000*t,z),grid,
title('ENLARGED VIEW OF FIRST SECTION')
pause
subplot(212)
plot(1000*t,z1),grid,
title('ENLARGED VIEW OF SECOND SECTION')
xlabel('TIME IN MILLI-SECS'),pause,soundsc(y,Fs),pause
subplot

Z=log10(abs(fft(z)));
Z=Z(1:101);
f=[0:Fs/201:(100*Fs)/201];
subplot(211)
plot(f,Z),grid,xlabel('FREQ IN HZ'),title('FOURIER TRANSFORM OF ENLARGED FIRST PART')
ylabel('dBs')
Z1=log10(abs(fft(z1)));
Z1=Z1(1:101);
subplot(212)
plot(f,Z1),grid,xlabel('FREQ IN HZ'),title('FOURIER TRANSFORM OF ENLARGED SECOND PART'),
ylabel('dBs'),pause
soundsc(y,Fs),pause
subplot


specgram(y,400,Fs)
title(' "HIGH E-STRING       AND         ME" ')
zoom on
pause,soundsc(y,Fs)
pause,soundsc(y,Fs),pause
title(' NOW, PUT A NUMBER OF STRINGS TOGETHER'),pause

%-----------------
% 'A-MINOR'
%------------------

load aminor
N=length(y);
t=[0:1/Fs:(N-1)/Fs];
plot(t,y),ylabel('AMPLITUDE')
xlabel('TIME IN SECS')
title('COLIN PLAYING THE A-MINOR CHORD'),pause
soundsc(y,Fs),pause
specgram(y,500,Fs)
title('COLIN PLAYING THE A-MINOR CHORD'),pause
soundsc(y,Fs)
title('A LOT OF TONES AND HARMONICS'),pause
title('DIFFICULT TO SEE WHAT IS HAPPENING!!'),pause
title('LET US LOOK AT A SMALL PART OF THE soundsc'),pause
t=[0:1/Fs:1102/Fs];
z=y(10000:11102);
plot(1000*t,z),grid,ylabel('AMPLITUDE')
xlabel('TIME IN MS')
title('PART OF THE A-MINOR CHORD'),pause,soundsc(y,Fs),pause
z=y(5001:7000);
zz=log10((abs(fft(z))));
f=[0:Fs/2000:272*Fs/2000];
plot(f,zz(1:273)),grid
xlabel('FREQ IN HZ'),title('FREQ. CONTENT OF A-MINOR CHORD')
ylabel('dBs'),pause
title('ONLY TOP FOUR STRINGS OF CHORD ACTUALLY STRUMMED'),pause
title('THESE ARE E(163.15),A(217.8),C(259),E(326.3), IN THEORY'), pause
title('THE BOTTOM STRINGS ARE E(81.6) AND A(108.9) - WHICH WOULD ALSO RESONATE'), pause
title('SO ZOOM IN AND EXPLAIN ALL THE SPECTRAL PEAKS'), pause
title('HAS COLIN TUNED HIS GUITAR PROPERLY?'), pause
title('REMEMBER E(81.6),A(108.9),E(163.15),A(217.8),C(259), & E(326.3) '), pause
title(' NOW A TRICK THAT SOME JAZZ GUITARISTS USE '),pause



%---------------------
% COLIN'S DAMPED CHORD
%---------------------

load damp
N=length(y);
t=[0:1/Fs:(N-1)/Fs];
plot(t,y),ylabel('AMPLITUDE')
xlabel('TIME IN SECS')
title('COLIN PLUCKING A-STRING, THEN TOUCHED AT 12TH FRET'),pause,soundsc(y,Fs)
specgram(y,400,Fs),title('REMOVAL OF ALL ODD HARMONICS'),pause,soundsc(y,Fs)
pause
title('THIS GIVES FREQUENCY DOUBLING'),pause
t=1000*[0:1/Fs:999/Fs];
subplot(211)
y1=y(5001:6000);y2=y(20001:21000);
plot(t,y1),grid,title('PLUCKED A-STRING'),xlabel('TIME IN MS'),pause
subplot(212)
plot(t,y2),grid,title('PLUCKED A-STRING TOUCHED AT 12TH FRET')
xlabel('TIME IN MS'),pause,soundsc(y,Fs),pause,subplot

Y1=log10(abs(fft([y1',zeros(1,9000)])));
Y1=Y1(1:1000);
f=[0:Fs/10000:(999*Fs)/10000];
subplot(211)
plot(f,Y1),grid,xlabel('FREQ IN HZ'),title('FOURIER TRANSFORM OF A-STRING')
ylabel('dBs')
Z2=log10(abs(fft([y2',zeros(1,9000)])));
Z2=Z2(1:1000);
subplot(212)
plot(f,Z2),grid,xlabel('FREQ IN HZ'),title('FOURIER TRANSFORM OF TOUCHED A-STRING'),
ylabel('dBs'),pause
soundsc(y,Fs),pause,title('WHERE HAS 50HZ APPEARED FROM?'),pause
subplot
























 
 function demo5
% ----------------------------------------------------------------------------------
%         DEMO 5 : ADDING NOISE TO SIGNALS
% ----------------------------------------------------------------------------------


	while 20==20   % 
    
       C5={'ADD NOISE TO SINE WAVES'...
   	 'ADD NOISE TO SPEECH'...
  		 'RETURN TO MAIN MENU'...
  	    'END'};

flag5=menu('DEMO5: ADDING NOISE SIGNALS - MAKE A CHOICE          ' ,C5);
   
if flag5==1;			% Sinusoids plus noise
   
   
    while 16==16		% Sinusoids and noise
      
      
      C1={'SNR = 100dB'...
   	 'SNR = 30dB'...
  		 'SNR = 20dB'...
  		 'SNR = 10dB'...
       'SNR = 0dB'...
       'SNR = -10dB'...
  	    'SNR = -20dB'...
  		 'SNR = -30dB'...
  		 'SNR = -40dB'...
		 'SNR = -50dB'...
  	    'SNR = - 100dB'...
 	    'RETURN TO DEMO 5 MENU'...
  	    'END'};

flag1=menu('DEMO5: ADD NOISE TO A SINUSOID OF 500HZ           ' ,C1);
   
  
if flag1==1;
      SNR=100;  % effectivel infinity dB SNR
   elseif flag1==2;
       SNR=30;
   elseif flag1==3;
       SNR=20;
 	elseif flag1==4;
      SNR=10;
 	elseif flag1==5;
      SNR=0;
 	elseif flag1==6;
      SNR=-10;
 	elseif flag1==7;
      SNR=-20;
 	elseif flag1==8;
    SNR=-30;
    elseif flag1==9;
     SNR=-40;
 elseif flag1==10;
     SNR=-50;
elseif flag1==11;
     SNR=-100; % effectively    - infinity SNR

     
     
elseif flag1==12; 		% RETURN TO MAIN MENU
   break
      
   elseif flag1==13;		% end program
	close all
	   return
       end					% goes with 'if flag1==1'
 

Fs=16000;					% sampling frequency=16000 Hz
 Tlength=2;					% Set length of tone to two seconds
 Tdisplay=.010;			% Display 10 ms of tone 
 t=[0:1:Tlength*Fs-1];	% This is to keep N even, otherwise FFT takes a long time???
 t1=[0:1:Tdisplay*Fs];

   
   
   % Create and sound a 500 Hz sinusoid 
   
    Fo=500;  y=sqrt(2)*sin(2*pi*t*Fo/Fs);			% signalpower=1
    N=length(y);
    plot(1000*t1/Fs,y(t1+1)),grid
    xlabel('TIME IN MS'),ylabel('AMPLITUDE')
    axis([0 10 -3 3])
    text(2.1,2.5,'POWER = 1 ','fontsize',13,'color','red')
    title(' 10 MSEC SAMPLE OF SINUSOIDAL TONE, Fo=500Hz '),pause
    soundsc(y,Fs),pause
    % spectrum of sinusoid
    Y=2*((abs(fft(y)).^2))/N^2;
    YdB=10*log10(Y);
	 YdB=YdB(1:N/2);
    F=linspace(0,Fs/2,N/2);
    plot(F,YdB),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE IN dBs')
    title('SINGLE-SIDED SPECTRUM (POWER PER DFT BIN) FOR SINUSOID ')
    c=axis;
    c1=(c(4)-c(3))/10;c1=c(4)-c1;	% Get correct position for plotting text
    text(500,c1,['POWER IN SINUSOID = 1 '],'fontsize',14,'color','red')
    pause
    
    
    % Create noise with appopriate power, given SNR in dBs
    n=randn(1,Tlength*Fs);
    noisepower=1.0*10^(-SNR/10);
    n=sqrt(noisepower)*n;
    yn=y+n;
    N=length(yn);
    plot(1000*t1/Fs,yn(t1+1)),grid
    xlabel('TIME IN MS'),ylabel('AMPLITUDE')
    c=axis;
    c1=(c(4)-c(3))/10;c1=c(4)-c1;	% Get correct position for plotting text
    text(2,c1,['SNR IN dBs IS ', num2str(SNR),],'fontsize',12,'color','red')
    title(' 10 MSEC SAMPLE OF SINUSOIDAL TONE PLUS NOISE, Fo=500Hz '),pause
    soundsc(yn,Fs),pause
    YN=2*((abs(fft(yn)).^2))/(length(n))^2;
    YNdB=10*log10(YN);
    % What YNdB represents is the power per DFT bin for a
    % single-sided spectrum. So the total power is the sum of
    % the power in N/2 bins. So in dB's, the power per DFT
    % bin of the white noise is 10log10(noisepower/(N/2)), which equals
    % 10log10(noisepower)-10log10(N/2). So we must add 10log10(N/2)
    % to get the true noise power. We must add 42dBs.
    %
    % At the freq of the sinusoid the value is 10log10(signal power + noisepower/(N/2)).
    % SO TO FIND APPROX THE DB DIFFERENCE BETWEEN THE SINAL AND THE NOISE,(i.e. SNR in dB)
    % SUBTRACT THE SIGNAL dB from the noise dB and the subtract 42dBs.
    
    YN=YN(1:N/2);
    F=linspace(0,Fs/2,N/2);   
    YNdB=YNdB(1:N/2);
    plot(F,YNdB),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE IN DBs')
    title('SINGLE-SIDED SPECTRUM (POWER PER DFT BIN) FOR SINUSOID & NOISE')
    legend('ADD 42dBs TO NOISE FLOOR TO GET SNR')
    c=axis;
    c1=(c(4)-c(3))/10;c1=c(4)-c1;	% Get correct position for plotting text
    text(1000,c1,['SNR IN dBs IS ', num2str(SNR),],'fontsize',12,'color','red')
    pause




end  % while 16==16

   
   elseif flag5==2;	% Speech plus noise
      
       while 30==30	
      
      
      C8={'SNR = 100 dB'...
   	 'SNR = 30dB'...
  		 'SNR = 20dB'...
  		 'SNR = 10dB'...
       'SNR = 0dB'...
       'SNR = -10dB'...
  	    'SNR = -20dB'...
  		 'SNR = -30dB'...
  		 'SNR = -40dB'...
		 'SNR = -50dB'...
  	    'SNR = - 100 dB'...
 	    'RETURN TO DEMO 5 MENU'...
  	    'END'};

flag8=menu('DEMO5: ADD NOISE TO A SPEECH SAMPLE          ' ,C8);
   
  
if flag8==1;
      SNR=100;
   elseif flag8==2;
       SNR=30;
   elseif flag8==3;
       SNR=20;
 	elseif flag8==4;
      SNR=10;
 	elseif flag8==5;
      SNR=0;
 	elseif flag8==6;
      SNR=-10;
 	elseif flag8==7;
      SNR=-20;
 	elseif flag8==8;
    SNR=-30;
    elseif flag8==9;
     SNR=-40;
     
     elseif flag8==10;
     SNR=-50;
elseif flag8==11;
     SNR=-100;

     
     
elseif flag8==12; 		% RETURN TO MAIN MENU
   break
      
   elseif flag8==13;		% end program
	close all
	   return
       end					% goes with 'if flag8==1'
 

clc									% clears screen
close all							% closes all windows
load speech;				% loads variable speech, Fs=8000Hz, 8bits PCM, 2.5 secs
x=speech/max(speech);
Fs=8000;						% sampling frequency=8000 Hz
signalpower=std(x)^2;
N=length(x);
t=[0:1:N-1]/Fs;
plot(t,x);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
text(0.6,1.7,['POWER OF SPEECH IS:  ', num2str(signalpower),],'fontsize',14,'color','red')
axis([0 2.5 -2 2])
title ('2.5 SECONDS OF SPEECH'),pause,soundsc(x,8000),pause


% Single-sided spectrum
X=2*((abs(fft(x)).^2))/N^2;
XdB=10*log10(X);
XdB=XdB(1:N/2);
F=linspace(0,Fs/2,N/2);
plot(F,XdB),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE IN dBs')
title('SINGLE-SIDED SPECTRUM FOR SPEECH (POWER PER DFT BIN)')
c=axis;
c1=(c(4)-c(3))/10;c1=c(4)-c1;	% Get correct position for plotting text
pause

    
    signalpower=std(x)^2;
    
    
    % Create noise with appopriate power, given SNR in dBs
    n=randn(1,N);
    noisepower=signalpower*10^(-SNR/10);
    n=sqrt(noisepower)*n;
    xn=x+n;
    N=length(xn);
    plot(t,xn),grid
    xlabel('SECS'),ylabel('AMPLITUDE')
    axis([0 2.5 2*min(xn) 2*max(xn)])
    c=axis;
    c1=(c(4)-c(3))/10;c1=c(4)-c1;	% Get correct position for plotting text
    text(1,c1,['SNR IN dBs IS ', num2str(SNR),],'fontsize',12,'color','red')
    title(' 2.5 SEC SAMPLE OF SPEECH PLUS NOISE'),pause
    soundsc(xn,Fs),pause
    XN=2*((abs(fft(xn)).^2))/(length(n))^2;
    XN=XN(1:N/2);
    XNdB=10*log10(XN);
    F=linspace(0,Fs/2,N/2);
    plot(F,XNdB),xlabel('FREQ IN HZ'),ylabel(' AMPLITUDE IN dBs')
    title('SINGLE-SIDED SPECTRUM (POWER PER DFT BIN) FOR SPEECH & NOISE')
    c=axis;
    c1=(c(4)-c(3))/10;c1=c(4)-c1;	% Get correct position for plotting text
    text(1000,c1,['SNR IN dBs IS ', num2str(SNR),],'fontsize',12,'color','red')
    pause
    
    

end  % while 30==30
      
      
    
      
      
     
elseif flag5==3; 		% RETURN TO MAIN MENU
   break
      
   elseif flag5==4;		% end program
	close all
	   return
       end					% goes with 'if flag5==1'

          
 end		% goes with 'while 20==20'
 
 
 % -----------------------------------------------------------------------------
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

 function demo6
% ----------------------------------------------------------------------------------
%                 DEMO 6 : FILTERING SPEECH
% ----------------------------------------------------------------------------------
 
			



							while 5==5 %Display filtered speech

C5={'LPF specch (Fc=200Hz)'...
    'LPF speech (Fc=500Hz)'...
    'LPF speech (Fc=1000Hz)'...
    'LPF speech (Fc=2000Hz)'...
	 'LPF speech (Fc=3000Hz)'...
    'LPF speech (Fc=3500Hz)'...
    'HPF speech (Fc=3500Hz)'...
    'HPF speech (Fc=2000Hz)'...
    'HPF speech (Fc=1200Hz)'...
    'HPF speech (Fc=700Hz)'...
    'HPF speech (Fc=500Hz)'...
    'RETURN TO MAIN MENU'...
 	 'END'};

 flag5=menu('DEMO6: LOW-PASS OR HIGH-PASS FILTER THE SPEECH AND DISPLAY ITS spectrogram         ' ,C5);
load speech;				% loads variable speech, Fs=8000Hz, 8bits PCM, 2.5 secs
x=speech/max(speech);
Fs=8000;		
N=length(x);
t=[0:1:N-1]/Fs;





if flag5==1
   plot(t,x);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH'),pause,soundsc(x,8000),pause




Fc=200;
    [A,B]=cheby1(10,.001,Fc/4000);
    y=filter(A,B,x);
    [H,W] = freqz(A,B,40000,'whole');
    H=abs(H(1:20000));
    f=linspace(0,4000,20000);
    plot(f,H), xlabel('FREQ IN HZ'),ylabel('LINEAR')
    title('TENTH-ORDER CHEBYSHEV LPF WITH CUTOFF OF Fc=200 HZ'),grid,pause 
     plot(t,y);, xlabel('SAMPLE NUMBER')
     ylabel('AMPLITUDE')
     title ('2.5 SECONDS OF LPF SPEECH (Fc=200Hz)'),grid,pause,soundsc(y,8000),pause
     % Single-sided spectrum
     X=(1/Fs)*fft(x);		
    X=abs(X);
       F=linspace(0,Fs/2,N/2);
    subplot(211)
    plot(F,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR SPEECH SIGNAL')
  

    subplot(212)  
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F,Y(1:N/2),'r'),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR LPF SPEECH SIGNAL')
    pause,subplot(211),text(1000,0.025,'LISTEN','color','blue'),
    soundsc(x,Fs),pause,
    subplot(212),text(1000,0.025,'LISTEN','color','red'),
    soundsc(y,Fs),pause,subplot
  
    
    specgram(y,200,8000),xlabel('TIME IN SECS'),ylabel('FREQ. IN HZ')
     title ('spectrogram OF LPF SPEECH (Fc=200Hz)'),pause,soundsc(y,8000),pause

     
  elseif flag5==2
     plot(t,x);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH'),pause,soundsc(x,8000),pause

    Fc=500;
    [A,B]=cheby1(10,.001,Fc/4000);
    y=filter(A,B,x);
    [H,W] = freqz(A,B,40000,'whole');
    H=abs(H(1:20000));
    f=linspace(0,4000,20000);
    plot(f,H), xlabel('FREQ IN HZ'),ylabel('LINEAR')
    title('TENTH-ORDER CHEBYSHEV LPF WITH CUTOFF OF Fc=500 HZ'),grid,pause 
     plot(t,y);, xlabel('SAMPLE NUMBER')
     ylabel('AMPLITUDE')
     title ('2.5 SECONDS OF LPF SPEECH (Fc=500Hz)'),grid,pause,soundsc(y,8000),pause
     % Single-sided spectrum
     X=(1/Fs)*fft(x);		
    X=abs(X);
       F=linspace(0,Fs/2,N/2);
    subplot(211)
    plot(F,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR SPEECH SIGNAL')
      subplot(212)  
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F,Y(1:N/2),'r'),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR LPF SPEECH SIGNAL')
    pause,subplot(211),text(1000,0.025,'LISTEN','color','blue'),
    soundsc(x,Fs),pause,
    subplot(212),text(1000,0.025,'LISTEN','color','red'),
    soundsc(y,Fs),pause,subplot
     specgram(y,200,8000),xlabel('TIME IN SECS'),ylabel('FREQ. IN HZ')
     title ('spectrogram OF LPF SPEECH (Fc=500Hz)'),pause,soundsc(y,8000),pause

    elseif flag5==3
     plot(t,x);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH'),pause,soundsc(x,8000),pause

    Fc=1000;
    [A,B]=cheby1(10,.001,Fc/4000);
    y=filter(A,B,x);
    [H,W] = freqz(A,B,40000,'whole');
    H=abs(H(1:20000));
    f=linspace(0,4000,20000);
    plot(f,H), xlabel('FREQ IN HZ'),ylabel('LINEAR')
    title('TENTH-ORDER CHEBYSHEV LPF WITH CUTOFF OF Fc=1000 HZ'),grid,pause 
     plot(t,y);, xlabel('SAMPLE NUMBER')
     ylabel('AMPLITUDE')
     title ('2.5 SECONDS OF LPF SPEECH (Fc=1000Hz)'),grid,pause,soundsc(y,8000),pause
     % Single-sided spectrum
     X=(1/Fs)*fft(x);		
    X=abs(X);
       F=linspace(0,Fs/2,N/2);
    subplot(211)
    plot(F,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR SPEECH SIGNAL')
    
    subplot(212)  
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F,Y(1:N/2),'r'),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR LPF SPEECH SIGNAL')
       pause,subplot(211),text(1000,0.025,'LISTEN','color','blue'),
    soundsc(x,Fs),pause,
    subplot(212),text(1000,0.025,'LISTEN','color','red'),
    soundsc(y,Fs),pause,subplot
     specgram(y,200,8000),xlabel('TIME IN SECS'),ylabel('FREQ. IN HZ')
     title ('spectrogram OF LPF SPEECH (Fc=1000Hz)'),pause,soundsc(y,8000),pause

     elseif flag5==4
     plot(t,x);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH'),pause,soundsc(x,8000),pause

    Fc=2000;
    [A,B]=cheby1(10,.001,Fc/4000);
    y=filter(A,B,x);
    [H,W] = freqz(A,B,40000,'whole');
    H=abs(H(1:20000));
    f=linspace(0,4000,20000);
    plot(f,H), xlabel('FREQ IN HZ'),ylabel('LINEAR')
    title('TENTH-ORDER CHEBYSHEV LPF WITH CUTOFF OF Fc=2000 HZ'),grid,pause 
     plot(t,y);, xlabel('SAMPLE NUMBER')
     ylabel('AMPLITUDE')
     title ('2.5 SECONDS OF LPF SPEECH (Fc=2000Hz)'),grid,pause,soundsc(y,8000),pause
     % Single-sided spectrum
     X=(1/Fs)*fft(x);		
    X=abs(X);
       F=linspace(0,Fs/2,N/2);
    subplot(211)
    plot(F,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR SPEECH SIGNAL')
    
    subplot(212)  
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F,Y(1:N/2),'r'),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR LPF SPEECH SIGNAL')
        pause,subplot(211),text(1000,0.025,'LISTEN','color','blue'),
    soundsc(x,Fs),pause,
    subplot(212),text(1000,0.025,'LISTEN','color','red'),
    soundsc(y,Fs),pause,subplot

     specgram(y,200,8000),xlabel('TIME IN SECS'),ylabel('FREQ. IN HZ')
     title ('spectrogram OF LPF SPEECH (Fc=2000Hz)'),pause,soundsc(y,8000),pause

     elseif flag5==5
     plot(t,x);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH'),pause,soundsc(x,8000),pause

    Fc=3000;
    [A,B]=cheby1(10,.001,Fc/4000);
    y=filter(A,B,x);
    [H,W] = freqz(A,B,40000,'whole');
    H=abs(H(1:20000));
    f=linspace(0,4000,20000);
    plot(f,H), xlabel('FREQ IN HZ'),ylabel('LINEAR')
    title('TENTH-ORDER CHEBYSHEV LPF WITH CUTOFF OF Fc=3000 HZ'),grid,pause 
     plot(t,y);, xlabel('SAMPLE NUMBER')
     ylabel('AMPLITUDE')
     title ('2.5 SECONDS OF LPF SPEECH (Fc=3000Hz)'),grid,pause,soundsc(y,8000),pause
     % Single-sided spectrum
     X=(1/Fs)*fft(x);		
    X=abs(X);
       F=linspace(0,Fs/2,N/2);
    subplot(211)
    plot(F,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR SPEECH SIGNAL')
   
    subplot(212)  
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F,Y(1:N/2),'r'),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR LPF SPEECH SIGNAL')
        pause,subplot(211),text(1000,0.025,'LISTEN','color','blue'),
    soundsc(x,Fs),pause,
    subplot(212),text(1000,0.025,'LISTEN','color','red'),
    soundsc(y,Fs),pause,subplot

     specgram(y,200,8000),xlabel('TIME IN SECS'),ylabel('FREQ. IN HZ')
     title ('spectrogram OF LPF SPEECH (Fc=3000Hz)'),pause,soundsc(y,8000),pause

     
        elseif flag5==6
    plot(t,x);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH'),pause,soundsc(x,8000),pause
 
    Fc=3500;
    [A,B]=cheby1(10,.001,Fc/4000);
    y=filter(A,B,x);
    [H,W] = freqz(A,B,40000,'whole');
    H=abs(H(1:20000));
    f=linspace(0,4000,20000);
    plot(f,H), xlabel('FREQ IN HZ'),ylabel('LINEAR')
    title('TENTH-ORDER CHEBYSHEV LPF WITH CUTOFF OF Fc=3500 HZ'),grid,pause 
     plot(t,y);, xlabel('SAMPLE NUMBER')
     ylabel('AMPLITUDE')
     title ('2.5 SECONDS OF LPF SPEECH (Fc=3500Hz)'),grid,pause,soundsc(y,8000),pause
     % Single-sided spectrum
     X=(1/Fs)*fft(x);		
    X=abs(X);
       F=linspace(0,Fs/2,N/2);
    subplot(211)
    plot(F,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR SPEECH SIGNAL')
    
    subplot(212)  
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F,Y(1:N/2),'r'),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR LPF SPEECH SIGNAL')
   pause,subplot(211),text(1000,0.025,'LISTEN','color','blue'),
    soundsc(x,Fs),pause,
    subplot(212),text(1000,0.025,'LISTEN','color','red'),
    soundsc(y,Fs),pause,subplot

     specgram(y,200,8000),xlabel('TIME IN SECS'),ylabel('FREQ. IN HZ')
     title ('spectrogram OF LPF SPEECH (Fc=3500Hz)'),pause,soundsc(y,8000),pause
     
     
     
     
     
     elseif flag5==7
     plot(t,x);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH'),pause,soundsc(x,8000),pause

    Fc=3500;
    [A,B]=cheby1(10,.001,Fc/4000,'high');
    y=filter(A,B,x);
    [H,W] = freqz(A,B,40000,'whole');
    H=abs(H(1:20000));
    f=linspace(0,4000,20000);
    plot(f,H), xlabel('FREQ IN HZ'),ylabel('LINEAR')
    title('TENTH-ORDER CHEBYSHEV HPF WITH CUTOFF OF Fc=3500 HZ'),grid,pause 
     plot(t,y);, xlabel('SAMPLE NUMBER')
     ylabel('AMPLITUDE')
     title ('2.5 SECONDS OF HPF SPEECH (Fc=3500Hz)'),grid,pause,soundsc(y,8000),pause
     % Single-sided spectrum
     X=(1/Fs)*fft(x);		
    X=abs(X);
       F=linspace(0,Fs/2,N/2);
    subplot(211)
    plot(F,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR SPEECH SIGNAL')
    
    subplot(212)  
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F,Y(1:N/2),'r'),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR HPF SPEECH SIGNAL'),axis([0 4000 0 0.040]);
   pause,subplot(211),text(1000,0.025,'LISTEN','color','blue'),
    soundsc(x,Fs),pause,
    subplot(212),text(1000,0.025,'LISTEN','color','red'),
    soundsc(y,Fs),pause,subplot
    axis
    specgram(y,200,8000),xlabel('TIME IN SECS'),ylabel('FREQ. IN HZ')
     title ('spectrogram OF HPF SPEECH (Fc=3500Hz)'),pause,soundsc(y,8000),pause
     
     
     elseif flag5==8
     plot(t,x);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH'),pause,soundsc(x,8000),pause

    Fc=2000;
    [A,B]=cheby1(10,.001,Fc/4000,'high');
    y=filter(A,B,x);
    [H,W] = freqz(A,B,40000,'whole');
    H=abs(H(1:20000));
    f=linspace(0,4000,20000);
    plot(f,H), xlabel('FREQ IN HZ'),ylabel('LINEAR')
    title('TENTH-ORDER CHEBYSHEV HPF WITH CUTOFF OF Fc=2000 HZ'),grid,pause 
     plot(t,y);, xlabel('SAMPLE NUMBER')
     ylabel('AMPLITUDE')
     title ('2.5 SECONDS OF HPF SPEECH (Fc=2000Hz)'),grid,pause,soundsc(y,8000),pause
     % Single-sided spectrum
     X=(1/Fs)*fft(x);		
    X=abs(X);
       F=linspace(0,Fs/2,N/2);
    subplot(211)
    plot(F,X(1:N/2),'r'),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR SPEECH SIGNAL')
    
    subplot(212)  
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F,Y(1:N/2),'r'),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR HPF SPEECH SIGNAL'),axis([0 4000 0 0.040]);
    pause,subplot(211),text(1000,0.025,'LISTEN','color','blue'),
    soundsc(x,Fs),pause,
    subplot(212),text(1000,0.025,'LISTEN','color','red'),
    soundsc(y,Fs),pause,subplot
    axis
    specgram(y,200,8000),xlabel('TIME IN SECS'),ylabel('FREQ. IN HZ')
     title ('spectrogram OF HPF SPEECH (Fc=2000Hz)'),pause,soundsc(y,8000),pause

elseif flag5==9
   plot(t,x);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH'),pause,soundsc(x,8000),pause

    Fc=1200;
    [A,B]=cheby1(10,.001,Fc/4000,'high');
    y=filter(A,B,x);
    [H,W] = freqz(A,B,40000,'whole');
    H=abs(H(1:20000));
    f=linspace(0,4000,20000);
    plot(f,H), xlabel('FREQ IN HZ'),ylabel('LINEAR')
    title('TENTH-ORDER CHEBYSHEV HPF WITH CUTOFF OF Fc=1200 HZ'),grid,pause 
     plot(t,y);, xlabel('SAMPLE NUMBER')
     ylabel('AMPLITUDE')
     title ('2.5 SECONDS OF HPF SPEECH (Fc=1200Hz)'),grid,pause,soundsc(y,8000),pause
     % Single-sided spectrum
     X=(1/Fs)*fft(x);		
    X=abs(X);
       F=linspace(0,Fs/2,N/2);
    subplot(211)
    plot(F,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR SPEECH SIGNAL')
    
    subplot(212)  
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F,Y(1:N/2),'r'),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR HPF SPEECH SIGNAL'),axis([0 4000 0 0.040]);
    pause,subplot(211),text(1000,0.025,'LISTEN','color','blue'),
    soundsc(x,Fs),pause,
    subplot(212),text(1000,0.025,'LISTEN','color','red'),
    soundsc(y,Fs),pause,subplot
   axis
    specgram(y,200,8000),xlabel('TIME IN SECS'),ylabel('FREQ. IN HZ')
     title ('spectrogram OF HPF SPEECH (Fc=1200Hz)'),pause,soundsc(y,8000),pause

      
     

elseif flag5==10
   
 plot(t,x);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH'),pause,soundsc(x,8000),pause

    Fc=700;
    [A,B]=cheby1(10,.001,Fc/4000,'high');
    y=filter(A,B,x);
    [H,W] = freqz(A,B,40000,'whole');
    H=abs(H(1:20000));
    f=linspace(0,4000,20000);
    plot(f,H), xlabel('FREQ IN HZ'),ylabel('LINEAR')
    title('TENTH-ORDER CHEBYSHEV HPF WITH CUTOFF OF Fc=700 HZ'),grid,pause 
     plot(t,y);, xlabel('SAMPLE NUMBER')
     ylabel('AMPLITUDE')
     title ('2.5 SECONDS OF HPF SPEECH (Fc=700Hz)'),grid,pause,soundsc(y,8000),pause
     % Single-sided spectrum
     X=(1/Fs)*fft(x);		
    X=abs(X);
       F=linspace(0,Fs/2,N/2);
    subplot(211)
    plot(F,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR SPEECH SIGNAL')
    
    subplot(212)  
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F,Y(1:N/2),'r'),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR HPF SPEECH SIGNAL'),axis([0 4000 0 0.040]);
    pause,subplot(211),text(1000,0.025,'LISTEN','color','blue'),
    soundsc(x,Fs),pause,
    subplot(212),text(1000,0.025,'LISTEN','color','red'),
    soundsc(y,Fs),pause,subplot
    axis
    specgram(y,200,8000),xlabel('TIME IN SECS'),ylabel('FREQ. IN HZ')
     title ('spectrogram OF HPF SPEECH (Fc=700Hz)'),pause,soundsc(y,8000),pause
     
     
elseif flag5==11
   
 plot(t,x);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH'),pause,soundsc(x,8000),pause

    Fc=500;
    [A,B]=cheby1(10,.001,Fc/4000,'high');
    y=filter(A,B,x);
    [H,W] = freqz(A,B,40000,'whole');
    H=abs(H(1:20000));
    f=linspace(0,4000,20000);
    plot(f,H), xlabel('FREQ IN HZ'),ylabel('LINEAR')
    title('TENTH-ORDER CHEBYSHEV HPF WITH CUTOFF OF Fc=500 HZ'),grid,pause 
     plot(t,y);, xlabel('SAMPLE NUMBER')
     ylabel('AMPLITUDE')
     title ('2.5 SECONDS OF HPF SPEECH (Fc=500Hz)'),grid,pause,soundsc(y,8000),pause
     % Single-sided spectrum
     X=(1/Fs)*fft(x);		
    X=abs(X);
       F=linspace(0,Fs/2,N/2);
    subplot(211)
    plot(F,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR SPEECH SIGNAL')
    
    subplot(212)  
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F,Y(1:N/2),'r'),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR HPF SPEECH SIGNAL'),axis([0 4000 0 0.040]);
    pause,subplot(211),text(1000,0.025,'LISTEN','color','blue'),
    soundsc(x,Fs),pause,
    subplot(212),text(1000,0.025,'LISTEN','color','red'),
    soundsc(y,Fs),pause,subplot
    axis
    specgram(y,200,8000),xlabel('TIME IN SECS'),ylabel('FREQ. IN HZ')
     title ('spectrogram OF HPF SPEECH (Fc=500Hz)'),pause,soundsc(y,8000),pause
     
          
elseif flag5==12
   break
elseif flag5==13
   return
end

   
   						end % goes with 'While 5==5'

% ----------------------------------------------------------------------------- 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
function demo7
% ----------------------------------------------------------------------------------
%                 DEMO 7 : FILTERING SQUARE WAVES
% ----------------------------------------------------------------------------------
 
			



							while 5==5 %Display filtered square wave
                        
                        
Fs=16000;                        
Tlength=2;							% Set length of tone to two seconds
Tdisplay=.010;						% Display 10 ms of signal
t=[0:1:Tlength*Fs-1];			% This is to keep N even, otherwise FFT takes a long time???
t1=[0:1:Tdisplay*Fs];			% Plotting vector - number of samples to make up Tdisplay

Fo=500;
                    
    x=square(2*pi*t*Fo/Fs);                            
    X=(1/Fs)*fft(x);		
    X=abs(X);
    N=length(X);
    F1=linspace(0,Fs/2,N/2);
                            
                        
                        
                        
C5={'LPF square wave (Fc=600Hz)'...
    'LPF square wave (Fc=1600Hz)'...
    'LPF square wave (Fc=2600Hz)'...
    'LPF square wave (Fc=3600Hz)'...
	 'LPF square wave (Fc=5600Hz)'...
    'LPF square wave (Fc=7600Hz)'...
    'HPF square wave (Fc=7400Hz)'...
    'HPF square wave (Fc=5400Hz)'...
    'HPF square wave (Fc=3400Hz)'...
    'HPF square wave (Fc=1400Hz)'...
    'RETURN TO THE MAIN MENU'...
 	 'END'};

 flag5=menu('DEMO7: FILTER THE SQUARE WAVE (Fo=500Hz)        ' ,C5);
 
 if flag5==1
    
    
    Fc=600;                        
    plot(1000*t1/Fs,x(t1+1)),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE OF TWO SEC. SQUARE WAVE, Fo=500 Hz '),pause
    soundsc(x(t+1),Fs),pause
    [A,B]=cheby1(10,.001,Fc/(Fs/2));

    
    plot(F1,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SINGLE-SIDED MAGNITUDE SPECTRUM FOR SQUARE WAVE Fo=500 Hz')
    axis([0 Fs/2 0 2]),grid
    pause,hold
    axis([0 Fs/2 0 2])
    [H,W] = freqz(A,B,N,'whole');
    H=abs(H(1:N/2));
    plot(F1,1.4*H,'r')
    
    text(800,0.9,['\leftarrow LPF WITH Fc=600Hz'],'color','red','fontsize',12)
    pause,hold off
    
    
   y=filter(A,B,x);
    
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F1,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM OF SQUARE WAVE AFTER FILTERING')
    axis([0 Fs/2 0 2]),grid,hold
    plot(F1,1.4*H,'r')
    pause,hold off


    plot(1000*t1/Fs,y(t1+1),'r')
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title('10MS OF FILTERED SQUARE WAVE (RED) IN TIME DOMAIN')
    hold
    plot(1000*t1/Fs,x(t1+1),'b')
    text(3,1.25,'Unfiltered square wave in blue','color','blue','fontsize',14)
    pause,hold off    
    
        
    subplot(211)
    plot(1000*t1/Fs,y(t1+1),'r'),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE FILTERED SQUARE WAVE, Fo=500 Hz ')
    text(3,1.3, ['Fundamental frequency Fo=', num2str(Fo),'Hz'],'fontsize',12,'color','red')
   
  subplot(212)
    plot(F1,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('MAGNITUDE SPECTRUM FOR FILTERED SQUARE WAVE Fo=500 Hz')
    axis([0 Fs/2 0 2]),hold
    pause,soundsc(y(1:length(t)/4),Fs),pause,subplot
        
         
  elseif flag5==2
     
     Fc=1600;                        
    plot(1000*t1/Fs,x(t1+1)),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE OF TWO SEC. SQUARE WAVE, Fo=500 Hz '),pause
     soundsc(x(t+1),Fs),pause
    [A,B]=cheby1(10,.001,Fc/(Fs/2));

    
    plot(F1,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SINGLE-SIDED MAGNITUDE SPECTRUM FOR SQUARE WAVE Fo=500 Hz')
    axis([0 Fs/2 0 2]),grid
    pause,hold
    axis([0 Fs/2 0 2])
    [H,W] = freqz(A,B,N,'whole');
    H=abs(H(1:N/2));
    plot(F1,1.4*H,'r')
    
    text(2000,0.9,['\leftarrow LPF WITH Fc=1600Hz'],'color','red','fontsize',12)
    pause,hold off
    
    
   y=filter(A,B,x);
    
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F1,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM OF SQUARE WAVE AFTER FILTERING')
    axis([0 Fs/2 0 2]),grid,hold
    plot(F1,1.4*H,'r')
    pause,hold off


   plot(1000*t1/Fs,y(t1+1),'r')
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title('10MS OF FILTERED SQUARE WAVE (RED) IN TIME DOMAIN')
    hold
    plot(1000*t1/Fs,x(t1+1),'b')
    text(3,1.25,'Unfiltered square wave in blue','color','blue','fontsize',14)
    pause,hold off        
    
    
    
    
    
    subplot(211)
    plot(1000*t1/Fs,y(t1+1),'r'),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE FILTERED SQUARE WAVE, Fo=500 Hz ')
    text(3,1.3, ['Fundamental frequency Fo=', num2str(Fo),'Hz'],'fontsize',12,'color','red')
  
    
  subplot(212)
    plot(F1,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('MAGNITUDE SPECTRUM FOR FILTERED SQUARE WAVE Fo=500 Hz')
    axis([0 Fs/2 0 2]),hold
    pause,soundsc(y(1:length(t)/4),Fs),pause,subplot
        
    
    
    
    
    
    
    
    elseif flag5==3
     
     Fc=2600;                        
    plot(1000*t1/Fs,x(t1+1)),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE OF TWO SEC. SQUARE WAVE, Fo=500 Hz '),pause
    soundsc(x(t+1),Fs),pause
    [A,B]=cheby1(10,.001,Fc/(Fs/2));

    
    plot(F1,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SINGLE-SIDED MAGNITUDE SPECTRUM FOR SQUARE WAVE Fo=500 Hz')
    axis([0 Fs/2 0 2]),grid
    pause,hold
    axis([0 Fs/2 0 2])
    [H,W] = freqz(A,B,N,'whole');
    H=abs(H(1:N/2));
    plot(F1,1.4*H,'r')
    
    text(3500,0.9,['\leftarrow LPF WITH Fc=2600Hz'],'color','red','fontsize',12)
    pause,hold off
    
    
   y=filter(A,B,x);
    
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F1,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM OF SQUARE WAVE AFTER FILTERING')
    axis([0 Fs/2 0 2]),grid,hold
    plot(F1,1.4*H,'r')
    pause,hold off


    plot(1000*t1/Fs,y(t1+1),'r')
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title('10MS OF FILTERED SQUARE WAVE (RED) IN TIME DOMAIN')
    hold
    plot(1000*t1/Fs,x(t1+1),'b')
    text(3,1.25,'Unfiltered square wave in blue','color','blue','fontsize',14)
    pause,hold off       
    
        
    subplot(211)
 plot(1000*t1/Fs,y(t1+1),'r'),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE FILTERED SQUARE WAVE, Fo=500 Hz ')
    text(3,1.3, ['Fundamental frequency Fo=', num2str(Fo),'Hz'],'fontsize',12,'color','red')
 
    
  subplot(212)
    plot(F1,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('MAGNITUDE SPECTRUM FOR FILTERED SQUARE WAVE Fo=500 Hz')
    axis([0 Fs/2 0 2]),hold
    pause,soundsc(y(1:length(t)/4),Fs),pause,subplot

    
    
    elseif flag5==4
     
     Fc=3600;                        
    plot(1000*t1/Fs,x(t1+1)),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE OF TWO SEC. SQUARE WAVE, Fo=500 Hz '),pause
     soundsc(x(t+1),Fs),pause
    [A,B]=cheby1(10,.001,Fc/(Fs/2));

    
    plot(F1,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SINGLE-SIDED MAGNITUDE SPECTRUM FOR SQUARE WAVE Fo=500 Hz')
    axis([0 Fs/2 0 2]),grid
    pause,hold
    axis([0 Fs/2 0 2])
    [H,W] = freqz(A,B,N,'whole');
    H=abs(H(1:N/2));
    plot(F1,1.4*H,'r')
    
    text(4500,0.9,['\leftarrow LPF WITH Fc=3600Hz'],'color','red','fontsize',12)
    pause,hold off
    
    
   y=filter(A,B,x);
    
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F1,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM OF SQUARE WAVE AFTER FILTERING')
    axis([0 Fs/2 0 2]),grid,hold
    plot(F1,1.4*H,'r')
    pause,hold off


   plot(1000*t1/Fs,y(t1+1),'r')
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title('10MS OF FILTERED SQUARE WAVE (RED) IN TIME DOMAIN')
    hold
    plot(1000*t1/Fs,x(t1+1),'b')
    text(3,1.25,'Unfiltered square wave in blue','color','blue','fontsize',14)
    pause,hold off        
        
    subplot(211)
    plot(1000*t1/Fs,y(t1+1),'r'),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE FILTERED SQUARE WAVE, Fo=500 Hz ')
    text(3,1.3, ['Fundamental frequency Fo=', num2str(Fo),'Hz'],'fontsize',12,'color','red')
  
  subplot(212)
    plot(F1,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('MAGNITUDE SPECTRUM FOR FILTERED SQUARE WAVE Fo=500 Hz')
    axis([0 Fs/2 0 2]),hold
    pause,soundsc(y(1:length(t)/4),Fs),pause,subplot

    


    elseif flag5==5
     
     Fc=5600;                        
    plot(1000*t1/Fs,x(t1+1)),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE OF TWO SEC. SQUARE WAVE, Fo=500 Hz '),pause
     soundsc(x(t+1),Fs),pause
    [A,B]=cheby1(10,.001,Fc/(Fs/2));

    
    plot(F1,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SINGLE-SIDED MAGNITUDE SPECTRUM FOR SQUARE WAVE Fo=500 Hz')
    axis([0 Fs/2 0 2]),grid
    pause,hold
    axis([0 Fs/2 0 2])
    [H,W] = freqz(A,B,N,'whole');
    H=abs(H(1:N/2));
    plot(F1,1.4*H,'r')
    
    text(2000,0.9,'LPF WITH Fc=5600Hz','color','red','fontsize',12)
    pause,hold off
    
    
   y=filter(A,B,x);
    
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F1,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM OF SQUARE WAVE AFTER FILTERING')
    axis([0 Fs/2 0 2]),grid,hold
    plot(F1,1.4*H,'r')
    pause,hold off


    plot(1000*t1/Fs,y(t1+1),'r')
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title('10MS OF FILTERED SQUARE WAVE (RED) IN TIME DOMAIN')
    hold
    plot(1000*t1/Fs,x(t1+1),'b')
    text(3,1.25,'Unfiltered square wave in blue','color','blue','fontsize',14)
    pause,hold off        
        
    subplot(211)
    plot(1000*t1/Fs,y(t1+1),'r'),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE FILTERED SQUARE WAVE, Fo=500 Hz ')
    text(3,1.3, ['Fundamental frequency Fo=', num2str(Fo),'Hz'],'fontsize',12,'color','red')
  
    
  subplot(212)
    plot(F1,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('MAGNITUDE SPECTRUM FOR FILTERED SQUARE WAVE Fo=500 Hz')
    axis([0 Fs/2 0 2]),hold
    pause,soundsc(y(1:length(t)/4),Fs),pause,subplot

    elseif flag5==6
     
     Fc=7600;                        
    plot(1000*t1/Fs,x(t1+1)),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE OF TWO SEC. SQUARE WAVE, Fo=500 Hz '),pause
     soundsc(x(t+1),Fs),pause
    [A,B]=cheby1(10,.001,Fc/(Fs/2));

    
    plot(F1,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SINGLE-SIDED MAGNITUDE SPECTRUM FOR SQUARE WAVE Fo=500 Hz')
    axis([0 Fs/2 0 2]),grid
    pause,hold
    axis([0 Fs/2 0 2])
    [H,W] = freqz(A,B,N,'whole');
    H=abs(H(1:N/2));
    plot(F1,1.4*H,'r')
    
    text(2000,0.9,'LPF WITH Fc=7600Hz','color','red','fontsize',12)
    pause,hold off
    
    
   y=filter(A,B,x);
    
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F1,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM OF SQUARE WAVE AFTER FILTERING')
    axis([0 Fs/2 0 2]),grid,hold
    plot(F1,1.4*H,'r')
    pause,hold off



plot(1000*t1/Fs,y(t1+1),'r')
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title('10MS OF FILTERED SQUARE WAVE (RED) IN TIME DOMAIN')
    hold
    plot(1000*t1/Fs,x(t1+1),'b')
    text(3,1.25,'Unfiltered square wave in blue','color','blue','fontsize',14)
    text(1,.25,'Since all harmonics are passed, distortion due to phase response','color','blue')
    pause,hold off    




        subplot(211)
   plot(1000*t1/Fs,y(t1+1),'r'),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE FILTERED SQUARE WAVE, Fo=500 Hz ')
    text(3,1.3, ['Fundamental frequency Fo=', num2str(Fo),'Hz'],'fontsize',12,'color','red')
 
    
  subplot(212)
    plot(F1,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('MAGNITUDE SPECTRUM FOR FILTERED SQUARE WAVE Fo=500 Hz')
    axis([0 Fs/2 0 2]),hold
    pause,soundsc(y(1:length(t)/4),Fs),pause,subplot


elseif flag5==7
     
     Fc=7400;       % HPF                       
    plot(1000*t1/Fs,x(t1+1)),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE OF TWO SEC. SQUARE WAVE, Fo=500 Hz '),pause
     soundsc(x(t+1),Fs),pause
    [A,B]=cheby1(10,.001,Fc/(Fs/2),'high');

    
    plot(F1,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SINGLE-SIDED MAGNITUDE SPECTRUM FOR SQUARE WAVE Fo=500 Hz')
    axis([0 Fs/2 0 2]),grid
    pause,hold
    axis([0 Fs/2 0 2])
    [H,W] = freqz(A,B,N,'whole');
    H=abs(H(1:N/2));
    plot(F1,1.4*H,'r')
    
    text(2000,0.9,'HPF WITH Fc=7400Hz','color','red','fontsize',12)
    pause,hold off
    
    
   y=filter(A,B,x);
    
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F1,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM OF SQUARE WAVE AFTER FILTERING')
    axis([0 Fs/2 0 2]),grid,hold
    plot(F1,1.4*H,'r')
    pause,hold off


     plot(1000*t1/Fs,y(t1+1),'r')
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title('10MS OF FILTERED SQUARE WAVE (RED) IN TIME DOMAIN')
    hold
    plot(1000*t1/Fs,x(t1+1),'b')
    text(3,1.25,'Unfiltered square wave in blue','color','blue','fontsize',14)
    pause,hold off      
    
        
    subplot(211)
   plot(1000*t1/Fs,y(t1+1),'r'),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE FILTERED SQUARE WAVE, Fo=500 Hz ')
    text(3,1.3, ['Fundamental frequency Fo=', num2str(Fo),'Hz'],'fontsize',12,'color','red')
 
    
  subplot(212)
    plot(F1,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('MAGNITUDE SPECTRUM FOR FILTERED SQUARE WAVE Fo=500 Hz')
    axis([0 Fs/2 0 2]),hold
    pause,soundsc(y(1:length(t)/4),Fs),pause,subplot

elseif flag5==8
     
     Fc=5400;       % HPF                       
    plot(1000*t1/Fs,x(t1+1)),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE OF TWO SEC. SQUARE WAVE, Fo=500 Hz '),pause
     soundsc(x(t+1),Fs),pause
    [A,B]=cheby1(10,.001,Fc/(Fs/2),'high');

    
    plot(F1,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SINGLE-SIDED MAGNITUDE SPECTRUM FOR SQUARE WAVE Fo=500 Hz')
    axis([0 Fs/2 0 2]),grid
    pause,hold
    axis([0 Fs/2 0 2])
    [H,W] = freqz(A,B,N,'whole');
    H=abs(H(1:N/2));
    plot(F1,1.4*H,'r')
    
    text(2000,0.9,'HPF WITH Fc=5400Hz','color','red','fontsize',12)
    pause,hold off
    
    
   y=filter(A,B,x);
    
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F1,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM OF SQUARE WAVE AFTER FILTERING')
    axis([0 Fs/2 0 2]),grid,hold
    plot(F1,1.4*H,'r')
    pause,hold off


      plot(1000*t1/Fs,y(t1+1),'r')
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title('10MS OF FILTERED SQUARE WAVE (RED) IN TIME DOMAIN')
    hold
    plot(1000*t1/Fs,x(t1+1),'b')
    text(3,1.25,'Unfiltered square wave in blue','color','blue','fontsize',14)
    pause,hold off        
        
    subplot(211)
   plot(1000*t1/Fs,y(t1+1),'r'),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE FILTERED SQUARE WAVE, Fo=500 Hz ')
    text(3,1.3, ['Fundamental frequency Fo=', num2str(Fo),'Hz'],'fontsize',12,'color','red')
 
    
  subplot(212)
    plot(F1,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('MAGNITUDE SPECTRUM FOR FILTERED SQUARE WAVE Fo=500 Hz')
    axis([0 Fs/2 0 2]),hold
    pause,soundsc(y(1:length(t)/4),Fs),pause,subplot



elseif flag5==9
     
     Fc=3400;       % HPF                       
    plot(1000*t1/Fs,x(t1+1)),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE OF TWO SEC. SQUARE WAVE, Fo=500 Hz '),pause
    soundsc(x(t+1),Fs),pause
    [A,B]=cheby1(10,.001,Fc/(Fs/2),'high');

    
    plot(F1,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SINGLE-SIDED MAGNITUDE SPECTRUM FOR SQUARE WAVE Fo=500 Hz')
    axis([0 Fs/2 0 2]),grid
    pause,hold
    axis([0 Fs/2 0 2])
    [H,W] = freqz(A,B,N,'whole');
    H=abs(H(1:N/2));
    plot(F1,1.4*H,'r')
    
    text(4000,0.9,'HPF WITH Fc=3400Hz','color','red','fontsize',12)
    pause,hold off
    
    
   y=filter(A,B,x);
    
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F1,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM OF SQUARE WAVE AFTER FILTERING')
    axis([0 Fs/2 0 2]),grid,hold
    plot(F1,1.4*H,'r')
    pause,hold off


      plot(1000*t1/Fs,y(t1+1),'r')
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title('10MS OF FILTERED SQUARE WAVE (RED) IN TIME DOMAIN')
    hold
    plot(1000*t1/Fs,x(t1+1),'b')
    text(3,1.25,'Unfiltered square wave in blue','color','blue','fontsize',14)
    pause,hold off        
        
    subplot(211)
    plot(1000*t1/Fs,y(t1+1),'r'),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE FILTERED SQUARE WAVE, Fo=500 Hz ')
    text(3,1.3, ['Fundamental frequency Fo=', num2str(Fo),'Hz'],'fontsize',12,'color','red')
 
    
  subplot(212)
    plot(F1,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('MAGNITUDE SPECTRUM FOR FILTERED SQUARE WAVE Fo=500 Hz')
    axis([0 Fs/2 0 2]),hold
    pause,soundsc(y(1:length(t)/4),Fs),pause,subplot
    
    elseif flag5==10
     
     Fc=1400;       % HPF                       
    plot(1000*t1/Fs,x(t1+1)),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE OF TWO SEC. SQUARE WAVE, Fo=500 Hz '),pause
     soundsc(x(t+1),Fs),pause
    [A,B]=cheby1(10,.001,Fc/(Fs/2),'high');

    
    plot(F1,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SINGLE-SIDED MAGNITUDE SPECTRUM FOR SQUARE WAVE Fo=500 Hz')
    axis([0 Fs/2 0 2]),grid
    pause,hold
    axis([0 Fs/2 0 2])
    [H,W] = freqz(A,B,N,'whole');
    H=abs(H(1:N/2));
    plot(F1,1.4*H,'r')
    
    text(4000,0.9,'HPF WITH Fc=1400Hz','color','red','fontsize',12)
    pause,hold off
    
    
   y=filter(A,B,x);
    
    Y=(1/Fs)*fft(y);		
    Y=abs(Y);
    plot(F1,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM OF SQUARE WAVE AFTER FILTERING')
    axis([0 Fs/2 0 2]),grid,hold
    plot(F1,1.4*H,'r')
    pause,hold off


      plot(1000*t1/Fs,y(t1+1),'r')
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title('10MS OF FILTERED SQUARE WAVE (RED) IN TIME DOMAIN')
    hold
    plot(1000*t1/Fs,x(t1+1),'b')
    text(3,1.25,'Unfiltered square wave in blue','color','blue','fontsize',14)
    pause,hold off     
    
        
    subplot(211)
    plot(1000*t1/Fs,y(t1+1),'r'),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MS SAMPLE FILTERED SQUARE WAVE, Fo=500 Hz ')
    text(3,1.3, ['Fundamental frequency Fo=', num2str(Fo),'Hz'],'fontsize',12,'color','red')
 
    
  subplot(212)
    plot(F1,Y(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('MAGNITUDE SPECTRUM FOR FILTERED SQUARE WAVE Fo=500 Hz')
    axis([0 Fs/2 0 2]),hold
    pause,soundsc(y(1:length(t)/4),Fs),pause,subplot
    
    
    
    
    
    

   elseif flag5==11     
    break % Continue with rest of program
 elseif flag5==12
    close all
    return
 end
 


 
 
 
  								end % goes with 'While 5==5'




%---------------------------------------------------------------------------------------


 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

function demo8
% ----------------------------------------------------------------------------------
%           DEMO 8: NOTCH FILTERING AN INTERFERING TONE FROM A SPEECH SIGNAL
% ----------------------------------------------------------------------------------

clc
close all		% closes all windows
Fs=8000; 		% sampling frequency
f0=400;		% centre frequency of notch in Hz




% Construct input signal x(n) speech signal (s(n)) and noise signal (n(n))

load speech;
s=speech/(max(speech));
Fs=8000;						% sampling frequency=8000 Hz
N=length(s);
t=[0:1:N-1]/Fs;
plot(t,s),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' 2.5 SECS OF SPEECH/BANDWIDTH=4kHz(8bit PCM, Fs=8000Hz)')
pause
soundsc(s,Fs),pause

theta=(f0/Fs)*2*pi;
n=sin(t*Fs*theta);
x=s+n;
plot(t,x),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' 2.5 SECS OF SPEECH WITH 400 HZ TONE ADDED')
pause
soundsc(x,Fs),pause

% Design notch filter

 % choose values for notch filter

	f0=400;		% centre frequency of notch in Hz
	r=.97;		% magnitude of pole


% Calculate the filter coefficients
theta=[f0/Fs]*2*pi;		% in rads
theta_deg=(theta/pi)*180;	% in degrees
% Numerator coefficients of H(z)
a(1)=1;
a(2)=-2*cos(theta);
a(3)=1;

% Denominator coefficients of H(z)
b(1)=1;
b(2)=-2*r*cos(theta);
b(3)=r^2;

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
polar(poleangle,polemag,'Xb');
title('POLE/ZERO PLOT FOR NOTCH FILTER, H(z) ')
disp('')
disp(' hit CR to continue')
pause
hold off


% Plot the frequency response of H(z)

freqz(a,b,512,Fs),grid
subplot(212),grid
subplot(211)
title('FREQUENCY RESPONSE OF NOTCH FILTER')
pause,subplot




y=filter(a,b,x); % filter signal plus tone

plot(t,x),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' 2.5 SECS OF SPEECH WITH 400 HZ TONE ADDED')
pause
soundsc(x,Fs),pause

plot(t,y),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title('FILTERED OUTPUT FROM THE NOTCH FILTER')
pause
soundsc(y,Fs),pause
text(.25,.7,'Interfering tone removed','color','red','fontsize',16)
soundsc(y,Fs),pause




% Plot the Fourier Transforms of x(n) and y(n) - 

N2=N/2;
f=[1:N/2]*Fs/N;
Fx=abs(fft(x))/N;Fx=Fx(1:N/2); 
Fx_dB=20*log10(Fx);

Fy=abs(fft(y))/N;Fy=Fy(1:N/2); 
Fy_dB=20*log10(Fy);

% plot FFT in dB's
subplot(211), plot(f,Fx_dB),grid
ylabel('dBs')
title('INPUT SPECTRUM TO NOTCH FILTER')
text(470,-25,'\leftarrowInterfering tone at F0=400 Hz','color','red','fontsize',12)
subplot(212), plot(f,Fy_dB),grid
xlabel('frequency(Hz)'), ylabel('dBs')
title('OUTPUT SPECTRUM FROM NOTCH FILTER')
text(470,-25,'\leftarrowInterfering tone removed','color','red','fontsize',12)
pause


% Finally put all plots together 
subplot(221)
plot(t,x), grid
xlabel('Time in secs'),ylabel('AMPLITUDE')
title(' Input to notch filter')

subplot(222)
% recalculate notch filter frequency response using same number of points
% as fft of input so that they can both be overlaid.
h=freqz(a,b,f,Fs);
h=20*(log10(abs(h)));
plot(f,h,'r-');hold
plot(f,Fx_dB),xlabel('frequency(Hz)')
ylabel('dBs')
text(500,20,'Notch filter transfer function','color','red','fontsize',10)
text(500,-150,'Spectrum of speech & tone','color','blue','fontsize',10)
title('Filtering of speech & tone'),hold off

subplot(223)
plot(t,y), grid
xlabel('Time in secs'),ylabel('AMPLITUDE')
title(' Output from notch filter')


subplot(224)
plot(f,Fy_dB)
xlabel('frequency(Hz)'), ylabel('dBs')
text(500,-25,'Interfering tone removed','color','red','fontsize',10)
title('Spectrum of notch filter output'),pause

subplot(221)
text(0.2,-1.8,'LISTEN','color','red','fontsize',12)
soundsc(x,Fs),pause
subplot(223)
text(0.2,-0.8,'LISTEN','color','red','fontsize',12)
soundsc(s,Fs),pause
close all
% ---------------------------------------------------------------------------------------




 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 function demo9
% ----------------------------------------------------------------------------------
%                 DEMO 9 : ADC - SAMPLING AND ALIASING OF SIGANALS
% ----------------------------------------------------------------------------------
 
			
  
 							while 3==3  
        
    C3={'GENERAL DEMO OF ALIASING' 'SAMPLING SPEECH' 'SAMPLING SINUSOIDS' 'RETURN TO MAIN MENU' 'END'};
    flag3=menu('DEMO9: ILLUSTRATE THE SAMPLING AND ALIASING OF CONTINUOUS SIGNALS          ' ,C3);
    
    
    
    if flag3==1   % General demo of aliasing
    
           
       z=randn(1,1000);
       a=ones(1,50)/50;
       y=filter(a,1,z);
       t=[1:50:1000];
       plot(y),hold
       xlabel('TIME IN MICRO SECS')
       ylabel('AMPLITUDE')
       title('CONTINUOUS-TIME SIGNAL (BW=4kHz)')
       axis([0 1000 -0.6 0.6])
       grid,pause
       plot(t-1,y(t),'ro','LineWidth',3), plot(1000,y(1000),'ro','LineWidth',3)
       text(200,.55,'SAMPLED AT Fs=20kHz','color','red','fontsize',14)
       pause,hold off,axis off
       
     Fs=20; % 20000 kHz
     BW=4;  % in kHz
        
     plot([-2*Fs-BW -2*Fs], [0 1],'r', [-2*Fs -2*Fs+BW], [1 0],'r' ),hold
     plot([-Fs-BW -Fs], [0 1],'r', [-Fs -Fs+BW], [1 0],'r' )
     plot([-BW 0], [0 1],'b', [0 +BW], [1 0],'b' )
     plot([Fs-BW Fs], [0 1],'r', [Fs Fs+BW], [1 0],'r' )
     plot([2*Fs-BW 2*Fs], [0 1],'r', [2*Fs 2*Fs+BW], [1 0],'r' )
     plot([Fs/2 Fs/2],[0 1.5],'g--')
     text(Fs/2+.2,1.1,'\leftarrowFs/2 = 10kHz')
     plot([-Fs/2 -Fs/2],[0 1.5],'g--')
     text(-Fs/2-16.5,1.1,'Fs/2 = -10kHz\rightarrow')  
     plot([0,0],[0 1.5],'k')
     axis([-35 35 0 1.5])
     text(-23,1.3,['Bandwidth of analogue signal =  ', num2str(BW),'kHz'],'fontsize',14,'color','red')
     xlabel('FREQ. IN kHZ')
     ylabel('AMPLITUDE OF SPECTRUM')
     title('SPECTRUM OF SIGNAL SAMPLED AT Fs = 20kHz')
     hold off,
     pause
     
       
       
       
   % General demo for aliasing
     
     Fs=20; % 20000 kHz
     for BW=[4:1:40]  % in kHz
        
     plot([-2*Fs-BW -2*Fs], [0 1],'r', [-2*Fs -2*Fs+BW], [1 0],'r' ),hold
     plot([-Fs-BW -Fs], [0 1],'r', [-Fs -Fs+BW], [1 0],'r' )
     plot([-BW 0], [0 1],'b', [0 +BW], [1 0],'b' )
     plot([Fs-BW Fs], [0 1],'r', [Fs Fs+BW], [1 0],'r' )
     plot([2*Fs-BW 2*Fs], [0 1],'r', [2*Fs 2*Fs+BW], [1 0],'r' )
     plot([Fs/2 Fs/2],[0 1.5],'g--')
     text(Fs/2+.2,1.1,'\leftarrowFs/2 = 10kHz')
     plot([-Fs/2 -Fs/2],[0 1.5],'g--')
     text(-1.07*Fs,1.1,'-Fs/2 = -10kHz\rightarrow')  
     plot([0,0],[0 1.5],'k')
     axis([-35 35 0 1.5])
     text(-23,1.3,['Bandwidth of analogue signal =  ', num2str(BW),'kHz'],'fontsize',14,'color','red')
     xlabel('FREQ. IN kHZ')
     ylabel('AMPLITUDE OF SPECTRUM')
     title('SPECTRUM OF SIGNAL SAMPLED AT Fs = 20kHz')
     if BW>10
        text(4,0.25,'(Aliasing!!)','fontsize',14,'color','black')
        text(-16,0.25,'(Aliasing!!)','fontsize',14,'color','black')
     else
     end
     

     hold off,
     pause
     end
     
     
     
     
     
     
   elseif flag3==2    % Sampling speech
     
load speech;				% loads variable speech, Fs=8000Hz, 8bits PCM, 2.5 secs
x=speech/max(speech);
Fs=8000;		
N=length(x);
t=[0:1:N-1]/Fs;
plot(t,x);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH'),pause,soundsc(x,Fs),pause
 X=(1/Fs)*fft(x);		
 X=abs(X);
 X1=[X(N/2:-1:1) X(1:N/2)];
       F=linspace(-Fs/2,Fs/2,length(X1));
      plot(F/1000,X1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('SPECTRUM FOR 4KHZ ANALOGUE BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, hold off

Y=[X X(1:N/2)];
Y=[Y(length(Y):-1:1) Y];
F1=linspace(-3*Fs/2,3*Fs/2,length(Y));
plot(F1/1000,Y),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE'),hold
title('SPECTRUM FOR SPEECH SAMPLED AT Fs=8kHZ ')
axis([min(F1/1000) max(F1/1000) 0 .05])
plot([0 0],[0 0.06],'k','LineWidth',2)
plot([-12 12],[0 0],'k','LineWidth',2)
plot([Fs/2000 Fs/2000], [0 .05],'r--')
plot([-Fs/2000 -Fs/2000], [0 .05],'r--')
text(Fs/2000,.04,'\leftarrowFs/2 = 4kHz')
text(-2.26*Fs/2000,.04,'-Fs/2 = -4kHz\rightarrow') 
pause
hold off,axis normal

subplot(211)
 plot(F/1000,X1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('SPECTRUM FOR 4KHZ ANALOGUE BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      hold off
      
subplot(212)
plot(F1/1000,Y),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE'),hold
title('SPECTRUM FOR SPEECH SAMPLED AT Fs=8kHZ ')
axis([min(F1/1000) max(F1/1000) 0 .05])
plot([0 0],[0 0.06],'k','LineWidth',2)
plot([-12 12],[0 0],'k','LineWidth',2)
plot([Fs/2000 Fs/2000], [0 .05],'r--')
plot([-Fs/2000 -Fs/2000], [0 .05],'r--')
text(Fs/2000,.04,'\leftarrowFs/2 = 4kHz')
text(-2.26*Fs/2000,.04,'-Fs/2 = -4kHz\rightarrow')  
hold off,pause,
subplot(211),text(2.2,0.035,'LISTEN','color','red'),
soundsc(x,Fs),pause,
subplot(212),text(8,0.045,'LISTEN','color','red'),
soundsc(x,Fs)
pause,subplot

% Sample speech at 16kHz
Fsnew=16000;
y1=interp(x,2);
Y1=(1/Fsnew)*fft(y1);		
Y1=abs(Y1);
N1=length(Y1);
Y1=[Y1 Y1(1:N1/2)];
Y1=[Y1(length(Y1):-1:1) Y1];
F1=linspace(-3*Fsnew/2,3*Fsnew/2,length(Y1));
plot(F1/1000,Y1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE'),hold
title('SPECTRUM FOR SPEECH SAMPLED AT Fs=16kHZ ')
axis([min(F1/1000) max(F1/1000) 0 .05])
plot([0 0],[0 0.05],'k','LineWidth',2)
plot([-24 24],[0 0],'k','LineWidth',2)
plot([Fsnew/2000 Fsnew/2000], [0 .05],'r--')
plot([-Fsnew/2000 -Fsnew/2000], [0 .05],'r--')
text(Fsnew/2000,.04,'\leftarrowFs/2 = 8kHz')
text(-2.26*Fsnew/2000,.04,'-Fs/2 = -8kHz\rightarrow')
pause, hold off, axis normal

subplot(211)
plot(F/1000,X1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('SPECTRUM FOR 4KHZ ANALOGUE BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      hold off

subplot(212)
plot(F1/1000,Y1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE'),hold
title('SPECTRUM FOR SPEECH SAMPLED AT Fs=16kHZ ')
axis([min(F1/1000) max(F1/1000) 0 .05])
plot([0 0],[0 0.08],'k','LineWidth',2)
plot([-24 24],[0 0],'k','LineWidth',2)
plot([Fsnew/2000 Fsnew/2000], [0 .05],'r--')
plot([-Fsnew/2000 -Fsnew/2000], [0 .05],'r--')
text(Fsnew/2000,.04,'\leftarrowFs/2 = 8kHz')
text(-2.26*Fsnew/2000,.04,'-Fs/2 = -8kHz\rightarrow')
pause,
subplot(211),text(2.2,0.035,'LISTEN','color','red'),
soundsc(x,8000),pause, 
subplot(212),text(16,0.045,'LISTEN','color','red'),
soundsc(y1,16000),pause
hold off, axis normal,subplot

% Sample speech at 2kHz
Fsnew=2000;
y1=x(1:4:length(x));
Y1=(1/Fsnew)*fft(y1);		
Y1=abs(Y1);
N1=length(Y1);
Y1=[Y1 Y1(1:N1/2)];
Y1=[Y1(length(Y1):-1:1) Y1];
F1=linspace(-3*Fsnew/2,3*Fsnew/2,length(Y1));
plot(F1/1000,Y1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE'),hold
title('SPECTRUM FOR SPEECH SAMPLED AT Fs=2kHZ ')
axis([min(F1/1000) max(F1/1000) 0 .04])
plot([0 0],[0 0.04],'k','LineWidth',2)
plot([-3 3],[0 0],'k','LineWidth',2)
plot([Fsnew/2000 Fsnew/2000], [0 .04],'r--')
plot([-Fsnew/2000 -Fsnew/2000], [0 .04],'r--')
text(Fsnew/2000,.035,'\leftarrowFs/2 = 1kHz')
text(-2.26*Fsnew/2000,.035,'-Fs/2 = -1kHz\rightarrow')
pause, hold off, axis normal

subplot(211)
plot(F/1000,X1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('SPECTRUM FOR 4KHZ ANALOGUE BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      hold off

subplot(212)
plot(F1/1000,Y1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE'),hold
title('SPECTRUM FOR SPEECH SAMPLED AT Fs=2kHZ ')
axis([min(F1/1000) max(F1/1000) 0 .04])
plot([0 0],[0 0.04],'k','LineWidth',2)
plot([-3 3],[0 0],'k','LineWidth',2)
plot([Fsnew/2000 Fsnew/2000], [0 .04],'r--')
plot([-Fsnew/2000 -Fsnew/2000], [0 .04],'r--')
text(Fsnew/2000,.035,'\leftarrowFs/2 = 1kHz')
text(-2.26*Fsnew/2000,.035,'-Fs/2 = -1kHz\rightarrow')
pause,
subplot(211),text(2.2,0.035,'LISTEN','color','red'),
soundsc(x,8000),pause, 
subplot(212),text(2.3,0.036,'LISTEN','color','red')
soundsc(y1,2000),pause
hold off, axis normal,subplot




     
   elseif flag3==3    %Sampling sinusoids     
         
 Fs=16000;					% sampling frequency=16000 Hz
 Tlength=2;					% Set length of tone to two seconds
 Tdisplay=.010;			% Display 10 ms of tone 
 t=[0:1:Tlength*Fs-1];	% This is to keep N even, otherwise FFT takes a long time???
 t1=[0:1:Tdisplay*Fs];

   
   
   % Sample a 500 Hz sinusoid at different sampling rates
   
    Fo=500;  y=sin(2*pi*t*Fo/Fs);
    
    plot(1000*t1/Fs,y(t1+1)),grid
    xlabel('TIME IN MS'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MSEC SAMPLE OF SINUSOIDAL TONE, Fo=500Hz ')
    legend('HIT RETURN TO SAMPLE SIGNAL AT FS=16000 SAMPLES/SEC')
    hold,pause
    t1subsampled=t1(1:1:length(t1));
    plot(1000*t1subsampled/Fs,y(t1subsampled+1),'ro');
    legend('THIS SIGNAL HAS BEEN SAMPLED AT FS=16000 SAMPLES/SEC')
    pause,plot(1000*t1/Fs,y(t1+1),'r'),
   legend('RED IS SIGNAL RECONSTRUCTED FROM THE SAMPLES')
    pause
    hold off

    plot(1000*t1/Fs,y(t1+1)),grid
    xlabel('TIME IN MS'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MSEC SAMPLE OF SINUSOIDAL TONE, Fo=500Hz ')
    legend('THIS SIGNAL HAS BEEN SAMPLED AT FS=8000 SAMPLES/SEC')
    hold, t1subsampled=t1(1:2:length(t1));
    plot(1000*t1subsampled/Fs,y(t1subsampled+1),'ro');
    pause,plot(1000*t1/Fs,y(t1+1),'r'),legend('RED IS SIGNAL RECONSTRUCTED FROM SAMPLES'),
    pause
	 hold

    plot(1000*t1/Fs,y(t1+1)),grid
    xlabel('TIME IN MS'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MSEC SAMPLE OF SINUSOIDAL TONE, Fo=500Hz ')
    legend('THIS SIGNAL HAS BEEN SAMPLED AT FS=4000 SAMPLES/SEC')
    hold
    t1subsampled=t1(1:4:length(t1));
    plot(1000*t1subsampled/Fs,y(t1subsampled+1),'ro');
    pause,plot(1000*t1/Fs,y(t1+1),'r'),legend('RED IS SIGNAL RECONSTRUCTED FROM SAMPLES'),
    pause
    hold


    plot(1000*t1/Fs,y(t1+1)),grid
    xlabel('TIME IN MS'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MSEC SAMPLE OF SINUSOIDAL TONE, Fo=500Hz ')
    legend('THIS SIGNAL HAS BEEN SAMPLED AT FS=2000 SAMPLES/SEC')
    hold
    t1subsampled=t1(1:8:length(t1));
    plot(1000*t1subsampled/Fs,y(t1subsampled+1),'ro');
    pause,plot(1000*t1/Fs,y(t1+1),'r'),legend('RED IS SIGNAL RECONSTRUCTED FROM SAMPLES'),
    pause
    hold

    
    
    y=sin(2*pi*t*Fo/Fs);
    plot(1000*t1/Fs,y(t1+1)),grid		% plotting in ms along time axis
    xlabel('TIME IN MS'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MSEC SAMPLE OF SINUSOIDAL TONE, Fo=500Hz ')
    legend('THIS SIGNAL HAS BEEN SAMPLED AT FS=1000 SAMPLES/SEC')
    hold
    t1subsampled=t1(1:16:length(t1));
    plot(1000*t1subsampled/Fs,y(t1subsampled+1),'ro');
    pause,plot(1000*t1/Fs,y(t1+1),'r'),legend('RED IS SIGNAL RECONSTRUCTED FROM SAMPLES - IT IS POSSIBLE!!'),
    pause
    hold
  	 
	 plot(1000*t1/Fs,y(t1+1)),grid
    xlabel('TIME IN MS'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MSEC SAMPLE OF SINUSOIDAL TONE, Fo=500Hz ')
    legend('500 HZ SIGNAL SAMPLED AT FS=400 SAMPLES/SEC')
    hold
    t1subsampled=t1(1:40:length(t1));
    plot(1000*t1subsampled/Fs,y(t1subsampled+1),'ro');
    pause,y1=sin(2*pi*t*100/Fs);
    plot(1000*t1/Fs,y1(t1+1),'r')
    legend('RED IS THE ALIASED 100 HZ SIGNAL RECONSTRUCTED FROM SAMPLES'),
    pause,hold off
    
    plot(1000*t1/Fs,y(t1+1)),grid
    xlabel('TIME IN MS'),ylabel('AMPLITUDE')
    axis([0 10 -1.5 1.5])
    title(' 10 MSEC SAMPLE OF SINUSOIDAL TONE, Fo=500Hz ')
    legend('ORIGINAL UNSAMPLED 500 HZ SIGNAL'),pause
    soundsc(y,Fs),pause,hold
    yincorrect=sin(2*pi*t*100/Fs);
    plot(1000*t1/Fs,yincorrect(t1+1),'r')
    legend('ALIASED 100 HZ SIGNAL RECONSTRUCTED FROM SAMPLES'),pause
    soundsc(yincorrect,Fs)
    pause,hold off
    
  

Fs=10000;
xx=[5000 5000];yy=[0 2];     % co-ordinates for plotting lines
Tlength=2;					% Set length of tone to two seconds
Tdisplay=.010;			% Display 10 ms of tone 
t=[0:1:Tlength*Fs-1];	% This is to keep N even, otherwise FFT takes a long time???
t1=[0:1:Tdisplay*Fs];




for Fo=550:500:9550  % sample these sinusoidal frequencies  			
   % start at 550 so we do not get Fo=5000Hz=Fs/2, i.e. sampling
   % exactly on the zero crossings, which just gives a very small number
   % (10^-14)that is sounded as noise
   
   y=sin(2*pi*t*Fo/Fs);
	  Y=(1/Fs)*fft(y);
     N=length(Y);
     Y=abs(Y);		%  double-sided spectrum of mag one
     Y1=[Y Y(1:N/2)];
     F=linspace(0,1.5*Fs,3*N/2);
     plot(F,Y1),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
     title('ALIASING OF SINUSOID Fo=550:500:9550Hz;   Fs=10,000Hz')
     text(5100,1.8,'\leftarrowFs/2=5000Hz')
     text(10100,1.8,'\leftarrowFs=10000Hz')
     hold, plot(xx,yy,'r--'),plot(xx+5000,yy,'k--'),
     axis([0 15000 0 2])
     plot([Fo Fo],[0 1.0],'g')
     
     if Fo==550
        text(Fo+50,0.8,'\leftarrowFo=550Hz/SOUND=550Hz')
        pause
     elseif Fo==1050
        text(Fo+50,0.8,'\leftarrowFo=1050Hz/SOUND=1050Hz')
     elseif Fo==1550
        text(Fo+50,0.8,'\leftarrowFo=1550Hz/SOUND=1550Hz')
     elseif Fo==2050
        text(Fo+50,0.8,'\leftarrowFo=2050Hz/SOUND=2050Hz')
     elseif Fo==2550
        text(Fo+50,0.8,'\leftarrowFo=2550Hz/SOUND=2550Hz')
     elseif Fo==3050
        text(Fo+50,0.8,'\leftarrowFo=3050Hz/SOUND=3050Hz')
     elseif Fo==3550
        text(Fo+50,0.8,'\leftarrowFo=3550Hz/SOUND=3550Hz')
     elseif Fo==4050
        text(Fo+50,0.8,'\leftarrowFo=4050Hz/SOUND=4050Hz')
     elseif Fo==4050
        text(Fo+50,0.8,'\leftarrowFo=4050Hz/SOUND=4050Hz')
     elseif Fo==4550
        text(Fo+50,0.8,'\leftarrowFo=4550Hz/SOUND=4550Hz')
     elseif Fo==5050
        text(Fo+50,0.8,'\leftarrowFo=5050Hz')
        text(5000,.4,'\leftarrowALIASED COMPONENT SOUND=4950Hz')
     elseif Fo==5550
        text(Fo+50,0.8,'\leftarrowFo=5550Hz')
        text(4500,.4,'\leftarrowALIASED COMPONENT SOUND=4450Hz')
     elseif Fo==6050
        text(Fo+50,0.8,'\leftarrowFo=6050Hz')
        text(4000,.4,'\leftarrowALIASED COMPONENT SOUND=3950Hz')
     elseif Fo==6550
        text(Fo+50,0.8,'\leftarrowFo=6550Hz')
        text(3500,.4,'\leftarrowALIASED COMPONENT SOUND=3450Hz')
     elseif Fo==7050
        text(Fo+50,0.8,'\leftarrowFo=7050Hz')
        text(3000,.4,'\leftarrowALIASED COMPONENT SOUND=2950Hz')
     elseif Fo==7550
        text(Fo+50,0.8,'\leftarrowFo=7550Hz')
        text(2550,.4,'\leftarrowALIASED COMPONENT SOUND=2450Hz')
     elseif Fo==8050
        text(Fo+50,0.8,'\leftarrowFo=8050Hz')
        text(2000,.4,'\leftarrowALIASED COMPONENT SOUND=1950Hz')
     elseif Fo==8550
        text(Fo+50,0.8,'\leftarrowFo=8550Hz')
        text(1500,.4,'\leftarrowALIASED COMPONENT SOUND=1450Hz')
     elseif Fo==9050
        text(Fo+50,0.8,'\leftarrowFo=9050Hz')
        text(1000,.4,'\leftarrowALIASED COMPONENT SOUND=950Hz')
     elseif Fo==9550
        text(Fo+50,0.8,'\leftarrowFo=9550Hz')
        text(500,.4,'\leftarrowALIASED COMPONENT SOUND=450Hz')
     end

     pause(1),soundsc(y(1:0.25*length(y)),Fs),pause(1)
     hold off      
     
  end



 
elseif flag3==4		% return to menu for demo 4
   break
elseif flag3==5		% end program
   return
end

									end % goes with 'while 3==3'

  					                  
                      
% -----------------------------------------------------------------------------





















function demo10
% ----------------------------------------------------------------------------------
%                 DEMO 10 : ADC & DAC QUANTISATION OF SAMPLED SIGNALS
% ----------------------------------------------------------------------------------



 	while 20==20 
    
    
      C20={ 'OPERATION OF A MID-RISER ADC QUANTISER'...
            'HOW QUANTISATION ERROR OCCURS IN AN ADC OR AN DAC'...
            'LISTEN TO QUANTISATION EFFECTS FOR N-BIT ADC & DAC FOR SINUSOIDAL INPUT'...
            'LISTEN TO QUANTISATION EFFECTS FOR N-BIT ADC & DAC FOR SPEECH INPUT'...
            'RETURN TO THE MAIN MENU'...
         	'END'};

flag20=menu('DEMO 10 : ADC & DAC QUANTISATION OF SAMPLED SIGNALS',      C20);

   
   if flag20==1; 			% OPERATION OF A MID-RISER ADC QUANTISER
      
      
 N=1;
 x=[-1:.0001:1];
 y=dquantize(x,N);
 plot(x,y,'LineWidth',2)
 axis([-1 1 -1.5 1.5])
 grid
 text(-0.5,-0.4,'0','color','red','fontsize',14)
 text(+0.5,+0.6,'1','color','red','fontsize',14)
 text(-0.9,1.25, ['N = NO. OF BITS PER SAMPLE = ', num2str(N),],'fontsize',13,'color','black')
 xlabel('INPUT TO ADC')
 ylabel('OUTPUT FROM ADC')
 title('N-BIT, MID-RISER TYPE, UNIFORM ADC QUANTISER')
 pause
 
 N=2;
 x=[-1:.0001:1];
 y=dquantize(x,N);
 plot(x,y,'LineWidth',2);
 axis([-1 1 -1.5 1.5])
 grid
 text(-0.8,-0.65,'00','color','red','fontsize',14)
 text(-0.3,-0.15,'01','color','red','fontsize',14)
 text(+0.2,+0.35,'10','color','red','fontsize',14)
 text(+0.70,+0.85,'11','color','red','fontsize',14)
 
 text(-0.9,1.25, ['N = NO. OF BITS PER SAMPLE = ', num2str(N),],'fontsize',13,'color','black')
 xlabel('INPUT TO ADC')
 ylabel('OUTPUT FROM ADC')
  title('N-BIT, MID-RISER TYPE, UNIFORM ADC QUANTISER')
 pause

N=3;
 x=[-1:.0001:1];
 y=dquantize(x,N);
 plot(x,y,'LineWidth',2);
 axis([-1 1 -1.5 1.5])
 grid
 text(-0.95,-0.75,'000','color','red','fontsize',14)
 text(-0.70,-0.55,'001','color','red','fontsize',14)
 text(-0.45,-0.30,'010','color','red','fontsize',14)
 text(-0.20,-0.05,'011','color','red','fontsize',14)
 text(0.05,0.22,'100','color','red','fontsize',14)
 text(0.25,0.46,'101','color','red','fontsize',14)
 text(+0.55,0.70,'110','color','red','fontsize',14)
 text(0.80,0.97,'111','color','red','fontsize',14)
 text(-0.9,1.25, ['N = NO. OF BITS PER SAMPLE = ', num2str(N),],'fontsize',13,'color','black')
 xlabel('INPUT TO ADC')
 ylabel('OUTPUT FROM ADC')
  title('N-BIT, MID-RISER TYPE, UNIFORM ADC QUANTISER')
 pause

N=4;
 x=[-1:.0001:1];
 y=dquantize(x,N);
  plot(x,y,'LineWidth',2);
 axis([-1 1 -1.5 1.5])
 grid
 text(-0.9,1.25, ['N = NO. OF BITS PER SAMPLE = ', num2str(N),],'fontsize',13,'color','black')
 xlabel('INPUT TO ADC')
 ylabel('OUTPUT FROM ADC')
  title('N-BIT, MID-RISER TYPE, UNIFORM ADC QUANTISER')
 text(-0.95,-1.1,'0000','color','red','fontsize',14)
 text(0.60,1.10,'1111','color','red','fontsize',14)
 pause

N=5;
 x=[-1:.0001:1];
 y=dquantize(x,N);
  plot(x,y,'LineWidth',2);
 axis([-1 1 -1.5 1.5])
 grid
 text(-0.9,1.25, ['N = NO. OF BITS PER SAMPLE = ', num2str(N),],'fontsize',13,'color','black')
 xlabel('INPUT TO ADC')
 ylabel('OUTPUT FROM ADC')
  title('N-BIT, MID-RISER TYPE, UNIFORM ADC QUANTISER')
 text(-0.95,-1.10,'00000','color','red','fontsize',14)
 text(0.60,1.10,'11111','color','red','fontsize',14)

 pause
 
 
 N=6;
 x=[-1:.0001:1];
 y=dquantize(x,N);
  plot(x,y,'LineWidth',2);
 axis([-1 1 -1.5 1.5])
 grid
 text(-0.9,1.25, ['N = NO. OF BITS PER SAMPLE = ', num2str(N),],'fontsize',13,'color','black')
 xlabel('INPUT TO ADC')
 ylabel('OUTPUT FROM ADC')
  title('N-BIT, MID-RISER TYPE, UNIFORM ADC QUANTISER')
 text(-0.95,-1.10,'000000','color','red','fontsize',14)
 text(0.60,1.10,'111111','color','red','fontsize',14)

 pause

 N=7;
 x=[-1:.0001:1];
 y=dquantize(x,N);
  plot(x,y,'LineWidth',2);
 axis([-1 1 -1.5 1.5])
 grid
 text(-0.9,1.25, ['N = NO. OF BITS PER SAMPLE = ', num2str(N),],'fontsize',13,'color','black')
 xlabel('INPUT TO ADC')
 ylabel('OUTPUT FROM ADC')
  title('N-BIT, MID-RISER TYPE, UNIFORM ADC QUANTISER')
 text(-0.95,-1.1,'0000000','color','red','fontsize',14)
 text(0.60,1.10,'1111111','color','red','fontsize',14)

 pause

 N=8;
 x=[-1:.0001:1];
 y=dquantize(x,N);
  plot(x,y,'LineWidth',2);
 axis([-1 1 -1.5 1.5])
 grid
 text(-0.9,1.25, ['N = NO. OF BITS PER SAMPLE = ', num2str(N),],'fontsize',13,'color','black')
 xlabel('INPUT TO ADC')
 ylabel('OUTPUT FROM ADC')
  title('N-BIT, MID-RISER TYPE, UNIFORM ADC QUANTISER')
 text(-0.95,-1.1,'00000000','color','red','fontsize',14)
 text(0.60,1.10,'11111111','color','red','fontsize',14)
 pause
 
       
          
   elseif flag20==2;		%HOW QUANTISATION ERROR OCCURS IN AN ADC OR AN DAC
      
      % input a sinusoid
 
 N=3;
 N1=10000;
 theta=2*pi/N1;
 t=[0:1:N1-1];
 Fo=1000; Fs=25000;
 x=sin(t*theta);
 yq=dquantize(x,N);
 % subsample by M;
 M=400;
 xs=x(1:M:N1);			% subsampled
 yqs=yq(1:M:N1);   % subsampled
 t1=t(1:M:N1);
 
 plot(t/10000,x,'b'),axis([0 1 -1.5 1.5])
 text(0.2,1.4,'BLUE   = continuous-time waveform','color','b','fontsize',10)
 hold
 plot([0 N1],[0 0],'LineWidth',2,'color','black');
 xlabel('TIME IN MSECS')
 ylabel('AMPLITUDE')
 title('1 kHZ SINUSOID SAMPLED AT Fs = 25 kHZ / 3-BIT QUANTISER')
 pause
 
 stem(t1/10000,xs,'filled','k')
 text(0.2,1.3,'BLACK  = true samples of continuous-time waveform','color','k','fontsize',10)
 pause
 
 % quantize samples
  quantinterval=2/(2^N);
    for j=0:(2^N)-1
     plot([0 1],[1-0.5*quantinterval-j*quantinterval 1-0.5*quantinterval-j*quantinterval],'r--')
  end  
  text(0.05,-1.25,'8 (N=3bits/sample) QUANTISATION LEVELS FOR ADC','color','r','fontsize',11)
  text(1.02,-0.875,'000','color','red','fontsize',10)
  text(1.02,-0.625,'001','color','red','fontsize',10)
  text(1.02,-0.375,'010','color','red','fontsize',10)
  text(1.02,-0.125,'011','color','red','fontsize',10)
  text(1.02, 0.875,'111','color','red','fontsize',10)
  text(1.02, 0.625,'110','color','red','fontsize',10)
  text(1.02, 0.375,'101','color','red','fontsize',10)
  text(1.02, 0.125,'100','color','red','fontsize',10)


  
  pause
  
  
  text(0.2,1.2,'RED    = quantised samples of continuous-time waveform','color','r','fontsize',10)
  N2=length(t1);
  for j=1:N2;
     stem(t1(j)/10000,yqs(j),'filled','r')
  pause   
  end
    
  qerror_adc=yqs-xs;
  stem(t1/10000,qerror_adc,'filled','g')
  text(0.2,1.1,'GREEN  = quantisation error','color','g','fontsize',10)
  pause
  hold off
  
  
  
  plot([0 1],[0 0],'LineWidth',2,'color','black')
  axis([0 1 -1.5 1.5])
  hold
 stem(t1/10000,yqs,'filled','r')
 xlabel('TIME IN MSECS')
 ylabel('AMPLITUDE')
 title('1 kHZ SINUSOID SAMPLED AT Fs = 25 kHZ / 3-BIT QUANTISER')
 text(0.5,0.7,'INPUT TO 3-BIT DAC','color','b','fontsize',12)
 pause,hold off
 
 % Insert M-1 ones in between samples of yqs
 h=ones(1,M);
 xreconstructed=kron(yqs,h);
 NN=length(xreconstructed);
 t4=[0:1:NN-1];
 
 plot([0 1],[0 0],'LineWidth',2,'color','black')
 axis([0 1 -1.5 1.5])
 xlabel('TIME IN MSECS')
 hold
 stem(t1/10000,yqs,'filled','r')
 plot(t4/10000,xreconstructed,'r');
 text(0.5,0.7,'OUPUT FROM 3-BIT DAC','color','b','fontsize',12)
 title('1 kHZ SINUSOID SAMPLED AT Fs = 25 kHZ / 3-BIT QUANTISER')
 pause,hold off
 
 plot([0 1],[0 0],'LineWidth',2,'color','black')
 axis([0 1 -1.5 1.5])
 hold
 plot(t4/10000,xreconstructed,'r');
 xlabel('TIME IN MSECS')
 text(0.2,1.3,'RED    = output from DAC','color','r','fontsize',10)
 title('1 kHZ SINUSOID SAMPLED AT Fs = 25 kHZ / 3-BIT QUANTISER')
 pause
 plot(t/10000,x,'b')
 text(0.2,1.4,'BLUE   = original continuous-time waveform','color','b','fontsize',10)
 pause
 e=xreconstructed-x;
 plot(t/10000,e,'g')
 text(0.2,1.2,'GREEN  = error introduced by DAC','color','g','fontsize',10)
 pause,axis normal

 
 hold off
 

 
 elseif flag20==3	%LISTEN TO QUANTISATION EFFECTS FOR N-BIT ADC & DAC FOR SINUSOIDAL INPUTS
 
Fs=20000;							% sampling frequency=20000 Hz
Tlength=2;							% Set length of tone to two seconds
Tdisplay=.050;						% Display 50 ms of tone 
t=[0:1:Tlength*Fs-1];			% This is to keep N even, otherwise FFT takes a long time???
t1=[0:1:Tdisplay*Fs];			% Plotting vector - number of samples to make up Tdisplay
N1=length(t);  
  
  Fo=200; 
  y=sin(2*pi*t*Fo/Fs);
  Y=2*((abs(fft(y)).^2))/N1^2;
  YdB=10*log10(Y);
  YdB=YdB(1:N1/2);

  
  for N=1:8				% N-bit quantiser
    yq=dquantize(y,N);
    plot(1000*t1/Fs,y(t1+1),'b'),hold
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    title(' N-BIT DAC EFFECT FOR Fo = 200 HZ / Fs = 20kHZ ')
    axis([0 10 -1.5 1.5])
    text(0.2,1.4,'BLUE    = original continuous-time waveform','color','b','fontsize',10)
    pause,soundsc(y,Fs),pause
    plot(1000*t1/Fs,yq(t1+1),'r')
    text(3,-1.25,['N = ', num2str(N),'-BIT DAC'],'fontsize',12,'color','red')
    text(0.2,1.2,'RED    = output from DAC','color','r','fontsize',10)
    pause,soundsc(yq,Fs),pause
    hold off, axis normal
    
    % spectrum of quantised sinusoid
    YQ=2*((abs(fft(yq)).^2))/N1^2;
    YQdB=10*log10(YQ);
	 YQdB=YQdB(1:N1/2);
    F=linspace(0,Fs/2,N1/2);
    plot(F,YdB,'b'),hold
    plot(F,YQdB,'r'),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE IN dBs')
    title('SINGLE-SIDED SPECTRUM (POWER PER DFT BIN) FOR DAC OUTPUT ')
    text(2500,-225,'BLUE = spectrum of continuous-time waveform','color','b','fontsize',10)
    text(2500,-25,['RED = spectrum of output from ', num2str(N),'- bit DAC'],'color','r','fontsize',10)
    text(2000,-175,'APPROX 6dB SNR IMPROVEMENT PER BIT','color','k','fontsize',10)
    grid
    
    pause,hold off


 end
 axis normal








 elseif flag20==4; %LISTEN TO QUANTISATION EFFECTS FOR N-BIT ADC & DAC FOR SPEECH INPUT 
    
    load speech;
    y=speech/max(speech);
    Fs=8000; % sampling frequency=20000 Hz
    
Tlength=2;							% Set length of tone to two seconds
t=[0:1:Tlength*Fs-1];			% This is to keep N even, otherwise FFT takes a long time???
N1=length(t);  
  
  Y=2*((abs(fft(y)).^2))/N1^2;
  YdB=10*log10(Y);
  YdB=YdB(1:N1/2);		% PSD of continuous speech

  
  for N=1:8				% N-bit quantiser
    yq=dquantize(y,N);
    plot(t/Fs,y(1:N1),'b'),hold
    xlabel('TIME IN SEC'),ylabel('AMPLITUDE')
    title('TWO SECONDS OF SPEECH / Fs = 8kHZ (originally 8-bit PCM) ')
    axis([0 2 -1.5 1.5])
    text(0.2,1.4,'BLUE    = original continuous-time waveform','color','b','fontsize',10)
    pause,soundsc(y,Fs),pause
    plot(t/Fs,yq(1:N1),'r')
    text(0.8,-1.1,['N = ', num2str(N),'-BIT DAC'],'fontsize',12,'color','red')
    text(0.2,1.2,'RED    = output from DAC','color','r','fontsize',10)
    pause,soundsc(yq,Fs),pause
    hold off, axis normal
    
    % spectrum of quantised speech
    YQ=2*((abs(fft(yq)).^2))/N1^2;
    YQdB=10*log10(YQ);
	 YQdB=YQdB(1:N1/2);
    F=linspace(0,Fs/2,N1/2);
    plot(F,YdB,'b'),hold
    plot(F,YQdB,'r'),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE IN dBs')
    title('SINGLE-SIDED SPECTRUM (POWER PER DFT BIN) FOR DAC OUTPUT ')
    text(1000,-35,'BLUE = spectrum of continuous-time waveform','color','b','fontsize',10)
    text(1000,-32,['RED = spectrum of output from ', num2str(N),'- bit DAC'],'color','r','fontsize',10)
    text(500,-95,'APPROX 6dB SNR IMPROVEMENT PER BIT','color','k','fontsize',10)
    grid
    
    pause,hold off


 end
 axis normal





  
 
       
   elseif flag20==5;   %Return to the main menu
      break
   elseif flag20==6;
      return
      
   end   % goes with 'if flag20==4'

 
 
  
  
  
  
  										end	% goes with 'while 20==20'
  
  
  
% ------------------------------------------------------------------------------  
  
  
  
  
  
  
  
  
  
  
  
 
function demo11
% ----------------------------------------------------------------------------------
%                 DEMO 11 : DAC & SMOOTHING FILTER "ALIASING" EFFECTS
% ----------------------------------------------------------------------------------
 
 
 
 
 												while 8==8  
    
                         
        C8={'INTRODUCTION TO DAC/SMOOTHING FILTER "ALIASING"  WITH SINUSOIDAL INPUT'...		
            'DAC/SMOOTHING FILTER "ALIASING" WITH SPEECH INPUT'...
  			 	'RETURN TO THE MAIN MENU'...
   			'END'};

flag8=menu('DEMO11: DAC & SMOOTHING FILTER "ALIASING" EFFECTS        ' ,C8);






                         
if flag8==1 		% Sinusoidal inputs
   

 
 
 Fs=1000;
xx=[500 500];yy=[0 1.5];     % co-ordinates for plotting lines
Tlength=2;					% Set length of tone to two seconds
Tdisplay=.010;			% Display 10 ms of tone 
t=[0:1:Tlength*Fs-1];	% This is to keep N even, otherwise FFT takes a long time???
t1=[0:1:Tdisplay*Fs];










% DAC Transfer function

N=length(t);
F=linspace(0,1.5*Fs,3*N/2);
hdac=1.0*abs(sin(pi*F/Fs)./(pi*F/Fs));

for Fo=[100 200 475 485 495 496 497 498 499 499.5] % sample these sinusoidal frequencies  			
   % start at 550 so we do not get Fo=5000Hz=Fs/2, i.e. sampling
   % exactly on the zero crossings, which just gives a very small number
   % (10^-14)that is sounded as noise
   
      
   beatfrequency=2*(500-Fo);
   plot([0 500], [1 1], 'k'),hold		% plot non-ideal LP smoothing filter
	plot([500 600], [1 0], 'k')
   
   plot(F,hdac,'r-.')						% DAC transfer function
   text(510,0.9,'\leftarrow non-ideal LPF (if it exists)','color','black')
   text(600,0.55,'\leftarrow DAC transfer function','color','red')
   text(Fs/2,1.2,'\leftarrowFs/2 = 500Hz','color','red')
   text(Fs,1.2,'\leftarrowFs = 1000Hz','color','black')
   title('BEAT FREQ FROM "ALIASING" OF SINUSOID (Fo Hz) VIA DAC/Fs=1000Hz')
   text(10,0.6, ['Fo=', num2str(Fo),'Hz'],'fontsize',12,'color','blue')

   if Fo>200
   text(10,0.5, ['Beat freq.=', num2str(beatfrequency),'Hz'],'fontsize',12,'color','green')
	else
   end
   
    y=sin(2*pi*t*Fo/Fs);
	  Y=(1/N)*fft(y);
     Y=abs(Y);		%  double-sided spectrum of mag 0.5
     Y1=[Y Y(1:N/2)];
     plot(F,Y1),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
     plot(xx,yy,'r--'),plot(xx+500,yy,'k--'),
     axis([0 1500 0 1.5])
     plot([Fo Fo],[0 0.5],'g')  
     pause,soundsc(y,Fs),pause
     hold off      
     
  end

% Display last value in subplot mode

subplot(211)
plot(t/Fs,y)
xlabel('time in secs')
title('TIME AND FREQ DOMAIN FOR SAMPLED SINUSOID Fo=499.5Hz/Fs=1000 Hz')
ylabel('AMPLITUDE')
subplot(212)
plot(F,hdac,'r-.'),hold						% DAC transfer function
text(510,0.9,'\leftarrow non-ideal LPF (if it exists)','color','black')
text(600,0.55,'\leftarrow DAC transfer function','color','red')
text(Fs/2,1.2,'\leftarrowFs/2 = 500Hz','color','red')
text(Fs,1.2,'\leftarrowFs = 1000Hz','color','black')
plot(F,Y1),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
plot(xx,yy,'r--'),plot(xx+500,yy,'k--'),
axis([0 1500 0 1.5])
plot([Fo Fo],[0 0.5],'g')
beatfrequency=2*(500-Fo);
plot([0 500], [1 1], 'k')		% plot non-ideal LP smoothing filter
plot([500 600], [1 0], 'k')
text(10,0.6, ['Fo=', num2str(Fo),'Hz'],'fontsize',12,'color','blue')

text(10,0.4, ['Beat freq.=', num2str(beatfrequency),'Hz'],'fontsize',12,'color','green')
	
pause,soundsc(y,Fs),pause
hold off, subplot






elseif flag8==2 		% Speech inputs

% Repeat experiment with speech
clc									% clears screen
clear									% clears all variables
close all							% closes all windows
load speech;						% loads variable speech, Fs=8000Hz, 8bits PCM, 2.5 secs
x=speech/max(speech);
Fs=8000;								% sampling frequency=8000 Hz
N=length(x);
t=[0:1:N-1]/Fs;
   






												while 9==9
   
    C9={  'y(n)=x(n) - original speech with Fs=8kHz'...		
          'y(n)=x(n)-0.9y(n) - HP filtered speech with Fs=8kHz'...
          'y(n)=x(n)-0.99y(n) - HP filtered speech with Fs=8kHz'...
          'y(n)=x(n)-0.999y(n) - HP filtered speech with Fs=8kHz'...
          'RETURN TO THE DEMO 11 MENU'...
   		 'END'};

flag9=menu('DAC/SMOOTHING FILTER "ALIASING" WITH SPEECH INPUT        ' ,C9);

                         
if flag9==1 		% y(n)=x(n) - original speech with Fs=8kHz
   
   
   
Fs=8000;								% sampling frequency=8000 Hz
N=length(x);
t=[0:1:N-1]/Fs;
   
   
   
plot(t,x),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' 2.5 SECS OF ORIGINAL SPEECH/BANDWIDTH=4kHz')
text(0.5,3500,'Playback rate = 8000 samples/sec','fontsize',12,'color','red')
soundsc(x,Fs),pause
  
X=(1/Fs)*fft(x);		
 X=abs(X);
 X1=[X(N/2:-1:1) X(1:N/2)];
       F=linspace(-Fs/2,Fs/2,length(X1));
      plot(F/1000,X1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('SPECTRUM FOR ORIGINAL 4KHZ ANALOGUE BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, hold off

Y=[X X(1:N/2)];
Y=[Y(length(Y):-1:1) Y];
F1=linspace(-3*Fs/2,3*Fs/2,length(Y));
plot(F1/1000,Y),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE'),hold
title('SPECTRUM FOR ORIGINAL SPEECH SAMPLED AT Fs=8kHZ ')
axis([min(F1/1000) max(F1/1000) 0 .05])
plot([0 0],[0 0.06],'k','LineWidth',2)
plot([-12 12],[0 0],'k','LineWidth',2)
plot([Fs/2000 Fs/2000], [0 .05],'r--')
plot([-Fs/2000 -Fs/2000], [0 .05],'r--')
text(Fs/2000,.04,'\leftarrowFs/2 = 4kHz')
text(-2.26*Fs/2000,.04,'-Fs/2 = -4kHz\rightarrow') 
pause,hold off,axis normal




% Single-sided plot and DAC Transfer function

xx=[Fs/2 Fs/2];yy=[0 1.5];     % co-ordinates for plotting lines
F=linspace(0,1.5*Fs,3*N/2);
hdac=0.05*abs(sin(pi*F/Fs)./(pi*F/Fs));
Y=[X X(1:N/2)];
plot(F,Y),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE'),hold
plot(xx,yy,'r--'),plot(xx+Fs/2,yy,'k--'),
axis([0 3*Fs/2 0 0.05])
plot([0 Fs/2], [0.04 0.04], 'k')		% plot non-ideal LP smoothing filter
plot([0.5*Fs 0.53*Fs], [0.04 0], 'k')
   
plot(F,hdac,'r-.')						% DAC transfer function
text(4100,0.035,'\leftarrow non-ideal LPF (if it exists)','color','black')
text(5000,0.025,'\leftarrow DAC transfer function','color','red')
text(Fs/2,0.045,'\leftarrowFs/2 = 4000Hz','color','red')
text(Fs,0.045,'\leftarrowFs = 8000Hz','color','black')
title('ORIGINAL SPEECH THROUGH DAC, Fs=8000Hz')
hold off
axis normal
pause,soundsc(x,Fs),pause

  
  
  
  
  
  
  
  
   
   
   
   
elseif flag9==2 		% y(n)=x(n)-0.9y(n) - HP filtered speech with Fs=8kHz   
   
   
   
Fs=8000;								% sampling frequency=8000 Hz
N=length(x);
a=[1];b=[1 0.9];
y=filter(a,b,x);					% filter the speech
   
   
   
plot(t,x),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' ORIGINAL 2.5 SECS OF SPEECH - BANDWIDTH=4kHz')
soundsc(x,Fs),pause

plot(t,x),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' HPF SPEECH  [y(n)=x(n)-0.9y(n)] - BANDWIDTH=4kHz')
soundsc(y,Fs),pause







% Double-sided spectrum of original speech
X=(1/Fs)*fft(x);		
 X=abs(X);
 X1=[X(N/2:-1:1) X(1:N/2)];
       F=linspace(-Fs/2,Fs/2,length(X1));
      plot(F/1000,X1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('SPECTRUM FOR ORIGINAL 4KHZ ANALOGUE BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, hold off



% Double-sided spectrum of filtered speech 
Y=(1/Fs)*fft(y);		
 Y=abs(Y);
 Y1=[Y(N/2:-1:1) Y(1:N/2)];
       F=linspace(-Fs/2,Fs/2,length(Y1));
      plot(F/1000,Y1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('SPECTRUM FOR 4KHZ ANALOGUE HPF SPEECH [y(n) = x(n) - 0.9y(n)]')
      hold
      plot([0 0],[0 0.02],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, hold off


subplot(211)
plot(F/1000,X1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('SPECTRUM FOR ORIGINAL 4KHZ ANALOGUE BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, hold off
      soundsc(x,Fs),pause

subplot(212)
plot(F/1000,Y1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
       title('SPECTRUM FOR 4KHZ ANALOGUE HPF SPEECH [y(n) = x(n) - 0.9y(n)]')
      hold
      plot([0 0],[0 0.02],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, hold off
      soundsc(y,Fs),pause

subplot 


% DOUBLE-sided spectrum of filtered speech sampled at 8000 Hz
Z=[Y Y(1:N/2)];
Z=[Z(length(Z):-1:1) Z];
F1=linspace(-3*Fs/2,3*Fs/2,length(Z));
plot(F1/1000,Z),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE'),hold
title('SPECTRUM FOR HPF SPEECH [y(n)=x(n)-0.9y(n)] SAMPLED AT Fs=8kHZ ')
axis([min(F1/1000) max(F1/1000) 0 .03])
plot([0 0],[0 0.04],'k','LineWidth',2)
plot([-12 12],[0 0],'k','LineWidth',2)
plot([Fs/2000 Fs/2000], [0 .04],'r--')
plot([-Fs/2000 -Fs/2000], [0 .04],'r--')
text(Fs/2000,.025,'\leftarrowFs/2 = 4kHz')
text(-2.26*Fs/2000,.025,'-Fs/2 = -4kHz\rightarrow') 
pause,hold off,axis normal




% Single-sided plot of filtered speech sampled at 8kHz and DAC Transfer function

xx=[Fs/2 Fs/2];yy=[0 0.04];     % co-ordinates for plotting lines
F=linspace(0,1.5*Fs,3*N/2);
hdac=0.025*abs(sin(pi*F/Fs)./(pi*F/Fs));
Z=[Y Y(1:N/2)];
plot(F,Z),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE'),hold
plot(xx,yy,'r--'),plot(xx+Fs/2,yy,'k--'),
axis([0 3*Fs/2 0 0.04])
plot([0 Fs/2], [0.025 0.025], 'k')		% plot non-ideal LP smoothing filter
plot([0.5*Fs 0.53*Fs], [0.025 0], 'k')
   
plot(F,hdac,'r-.')						% DAC transfer function
text(4100,0.022,'\leftarrow non-ideal LPF (if it exists)','color','black')
text(4500,0.015,'\leftarrow DAC transfer function','color','red')
text(Fs/2,0.035,'\leftarrowFs/2 = 4000Hz','color','red')
text(Fs,0.035,'\leftarrowFs = 8000Hz','color','black')
title('HPF SPEECH [y(n)=x(n)-0.9y(n)] THROUGH DAC, Fs=8000Hz')
hold off
axis normal
pause,soundsc(y,Fs),pause

  
   
   
   
   
   
   
   
   
   
   
elseif flag9==3 		% y(n)=x(n)-0.99x(n) - HP filtered speech with Fs=8kHz 
   
   
   
   
Fs=8000;								% sampling frequency=8000 Hz
N=length(x);
a=[1];b=[1 0.99];
y=filter(a,b,x);					% filter the speech
   
   
   
plot(t,x),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' ORIGINAL 2.5 SECS OF SPEECH - BANDWIDTH=4kHz')
soundsc(x,Fs),pause

plot(t,x),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' HPF SPEECH  [y(n)=x(n)-0.99y(n)] - BANDWIDTH=4kHz')
soundsc(y,Fs),pause







% Double-sided spectrum of original speech
X=(1/Fs)*fft(x);		
 X=abs(X);
 X1=[X(N/2:-1:1) X(1:N/2)];
       F=linspace(-Fs/2,Fs/2,length(X1));
      plot(F/1000,X1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('SPECTRUM FOR ORIGINAL 4KHZ ANALOGUE BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, hold off



% Double-sided spectrum of filtered speech 
Y=(1/Fs)*fft(y);		
 Y=abs(Y);
 Y1=[Y(N/2:-1:1) Y(1:N/2)];
       F=linspace(-Fs/2,Fs/2,length(Y1));
      plot(F/1000,Y1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('SPECTRUM FOR 4KHZ ANALOGUE HPF SPEECH [y(n) = x(n) - 0.99y(n)]')
      hold
      plot([0 0],[0 0.02],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, hold off


subplot(211)
plot(F/1000,X1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('SPECTRUM FOR ORIGINAL 4KHZ ANALOGUE BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, hold off
      soundsc(x,Fs),pause

subplot(212)
plot(F/1000,Y1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
       title('SPECTRUM FOR 4KHZ ANALOGUE HPF SPEECH [y(n) = x(n) - 0.99y(n)]')
      hold
      plot([0 0],[0 0.02],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, hold off
      soundsc(y,Fs),pause

subplot 


% DOUBLE-sided spectrum of filtered speech sampled at 8000 Hz
Z=[Y Y(1:N/2)];
Z=[Z(length(Z):-1:1) Z];
F1=linspace(-3*Fs/2,3*Fs/2,length(Z));
plot(F1/1000,Z),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE'),hold
title('SPECTRUM FOR HPF SPEECH [y(n)=x(n)-0.99y(n)] SAMPLED AT Fs=8kHZ ')
axis([min(F1/1000) max(F1/1000) 0 .03])
plot([0 0],[0 0.04],'k','LineWidth',2)
plot([-12 12],[0 0],'k','LineWidth',2)
plot([Fs/2000 Fs/2000], [0 .04],'r--')
plot([-Fs/2000 -Fs/2000], [0 .04],'r--')
text(Fs/2000,.025,'\leftarrowFs/2 = 4kHz')
text(-2.26*Fs/2000,.025,'-Fs/2 = -4kHz\rightarrow') 
pause,hold off,axis normal




% Single-sided plot of filtered speech sampled at 8kHz and DAC Transfer function

xx=[Fs/2 Fs/2];yy=[0 0.04];     % co-ordinates for plotting lines
F=linspace(0,1.5*Fs,3*N/2);
hdac=0.025*abs(sin(pi*F/Fs)./(pi*F/Fs));
Z=[Y Y(1:N/2)];
plot(F,Z),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE'),hold
plot(xx,yy,'r--'),plot(xx+Fs/2,yy,'k--'),
axis([0 3*Fs/2 0 0.04])
plot([0 Fs/2], [0.025 0.025], 'k')		% plot non-ideal LP smoothing filter
plot([0.5*Fs 0.53*Fs], [0.025 0], 'k')
   
plot(F,hdac,'r-.')						% DAC transfer function
text(4100,0.022,'\leftarrow non-ideal LPF (if it exists)','color','black')
text(4500,0.015,'\leftarrow DAC transfer function','color','red')
text(Fs/2,0.035,'\leftarrowFs/2 = 4000Hz','color','red')
text(Fs,0.035,'\leftarrowFs = 8000Hz','color','black')
title('HPF SPEECH [y(n)=x(n)-0.99y(n)] THROUGH DAC, Fs=8000Hz')
hold off
axis normal
pause,soundsc(y,Fs),pause

  
   
   
   
   
   
   
   
   
 
   
elseif flag9==4 		% y(n)=x(n)-0.999x(n) - HP filtered speech with Fs=8kHz 
    
   
   
Fs=8000;								% sampling frequency=8000 Hz
N=length(x);
a=[1];b=[1 0.999];
y=filter(a,b,x);					% filter the speech
   
   
   
plot(t,x),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' ORIGINAL 2.5 SECS OF SPEECH - BANDWIDTH=4kHz')
soundsc(x,Fs),pause

plot(t,x),grid
xlabel('TIME IN SECS'),ylabel('AMPLITUDE')
title(' HPF SPEECH  [y(n)=x(n)-0.999y(n)] - BANDWIDTH=4kHz')
soundsc(y,Fs),pause







% Double-sided spectrum of original speech
X=(1/Fs)*fft(x);		
 X=abs(X);
 X1=[X(N/2:-1:1) X(1:N/2)];
       F=linspace(-Fs/2,Fs/2,length(X1));
      plot(F/1000,X1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('SPECTRUM FOR ORIGINAL 4KHZ ANALOGUE BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, hold off



% Double-sided spectrum of filtered speech 
Y=(1/Fs)*fft(y);		
 Y=abs(Y);
 Y1=[Y(N/2:-1:1) Y(1:N/2)];
       F=linspace(-Fs/2,Fs/2,length(Y1));
      plot(F/1000,Y1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('SPECTRUM FOR 4KHZ ANALOGUE HPF SPEECH [y(n) = x(n) - 0.999y(n)]')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, hold off


subplot(211)
plot(F/1000,X1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('SPECTRUM FOR ORIGINAL 4KHZ ANALOGUE BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, hold off
      soundsc(x,Fs),pause

subplot(212)
plot(F/1000,Y1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
       title('SPECTRUM FOR 4KHZ ANALOGUE HPF SPEECH [y(n) = x(n) - 0.999y(n)]')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, hold off
      soundsc(y,Fs),pause

subplot 


% DOUBLE-sided spectrum of filtered speech sampled at 8000 Hz
Z=[Y Y(1:N/2)];
Z=[Z(length(Z):-1:1) Z];
F1=linspace(-3*Fs/2,3*Fs/2,length(Z));
plot(F1/1000,Z),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE'),hold
title('SPECTRUM FOR HPF SPEECH [y(n)=x(n)-0.999y(n)] SAMPLED AT Fs=8kHZ ')
axis([min(F1/1000) max(F1/1000) 0 .04])
plot([0 0],[0 0.04],'k','LineWidth',2)
plot([-12 12],[0 0],'k','LineWidth',2)

% I've removed lines below so that you can see the HF part of the spectrum
% plot([Fs/2000 Fs/2000], [0 .04],'r--')
% plot([-Fs/2000 -Fs/2000], [0 .04],'r--')
text(Fs/2000,.025,'\leftarrowFs/2 = 4kHz')
text(-2.26*Fs/2000,.025,'-Fs/2 = -4kHz\rightarrow') 
pause,hold off,axis normal




% Single-sided plot of filtered speech sampled at 8kHz and DAC Transfer function

xx=[Fs/2 Fs/2];yy=[0 0.04];     % co-ordinates for plotting lines
F=linspace(0,1.5*Fs,3*N/2);
hdac=0.025*abs(sin(pi*F/Fs)./(pi*F/Fs));
Z=[Y Y(1:N/2)];
plot(F,Z),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE'),hold

% I've removed line below so that you can see the HF part of the spectrum

% plot(xx,yy,'r--')
plot(xx+Fs/2,yy,'k--'),
axis([0 3*Fs/2 0 0.04])
plot([0 Fs/2], [0.025 0.025], 'k')		% plot non-ideal LP smoothing filter
plot([0.5*Fs 0.53*Fs], [0.025 0], 'k')
   
plot(F,hdac,'r-.')						% DAC transfer function
text(4100,0.022,'\leftarrow non-ideal LPF (if it exists)','color','black')
text(4500,0.015,'\leftarrow DAC transfer function','color','red')

% I've removed text below so that you can see the HF part of the spectrum
% text(Fs/2,0.035,'\leftarrowFs/2 = 4000Hz','color','red')
text(Fs,0.035,'\leftarrowFs = 8000Hz','color','black')
title('HPF SPEECH [y(n)=x(n)-0.999y(n)] THROUGH DAC, Fs=8000Hz')
hold off
axis normal
pause,soundsc(y,Fs),pause

  
     
   
   
   
   
   
elseif flag9==5 		% Return to Demo8 main menu
   
   break
   
elseif flag9==6		% End
   
   return
   
end				% goes with if flag9==1


   
   
   
										end			% goes with while 9==9






elseif flag8==3 		% Return to main menu
   
   break
   
elseif flag8==4		% End
   
   return
   
end

   
									 end  							% goes with while 8==8  


% ----------------------------------------------------------------------------------
 
 
 
 
 
 
 
 














function demo12
% ----------------------------------------------------------------------------------
%           DEMO 12: PSYCHOACOUSTICAL EFFECTS
% ----------------------------------------------------------------------------------
 
 
 	while 9==9 
    
                                                                 
   C9={	'VARIATION OF HEARING SENSITIVITY WITH FREQUENCY'...
   		'BEAT FREQUENCIES'...
   		'ONE FREQUENCY MASKING ANOTHER FREQUENCY'...
         'PERCEPTION OF PITCH - RISETS DEMO'...
         'CIRCULAR PITCH - SHEPARDS DEMO'...
         'IS THE EAR INSENSITIVE TO PHASE ?'...
   		'RETURN TO THE MAIN MENU'...
   		'END'};

flag9=menu('DEMO12: PSYCHOACOUSTICAL EFFECTS          ' ,C9);
   
  
  if flag9==1;
     
     
 % VARIATION OF HEARING SENSITIVITY WITH FREQUENCY 
 
Fs=40000;							% sampling frequency=40000 Hz
Tlength=1;							% Set length of tone to one second
t=[0:1:Tlength*Fs-1];			% This is to keep N even, otherwise FFT takes a long time???
  
   
   
   
    Tdisplay=.005;						% Display 5 ms of tone 
    t1=[0:1:Tdisplay*Fs];
    Fo=1000;
    y=sin(2*pi*t*Fo/Fs);                            
    plot(1000*t1/Fs,y(t1+1)),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 5 -1.5 1.5])
    title(' 5 MS SAMPLE OF SINUSOID, Fo Hz ')
    text(1,1.3, ['Frequency Fo=', num2str(Fo),'Hz'],'fontsize',14,'color','red')
    pause,soundsc(y,Fs),pause
    N1=length(y);
    % Single-sided spectrum
    Y=(2/N1)*fft(y);		
    Y=abs(Y);
    N=length(Y);
    F=linspace(0,Fs/2,N/2);
    plot(F/1000,Y(1:N/2)),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
    title('SINGLE-SIDED MAGNITUDE SPECTRUM FOR SINUSOID Fo=1000Hz')
    axis([0 Fs/2000 0 2])
    text((Fo+50)/1000,0.45,'\leftarrow+1000Hz component','fontsize',12,'color','red')
    text((Fo+500)/1000,0.35,'(magnitude=1.0)','fontsize',12,'color','red')
    hold
    plot([0 0],[0 1],'k'),hold off,axis normal
    pause
    
    
    for Fo=[100:100:400 500:500:5500 6000:1000:16000]
   
    y=sin(2*pi*t*Fo/Fs);                            
    % Single-sided spectrum
     N1=length(y);
    Y=(2/N1)*fft(y);		
    Y=abs(Y);
    N=length(Y);
    F=linspace(0,Fs/2,N/2);
    plot(F/1000,Y(1:N/2)),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE'),hold
    text(2,1.6,'HEARING SENSITIVITY VARIES WITH FREQUENCY','fontsize',12,'color','black')
    text(Fo/1000,1.1,['Fo = ', num2str(Fo/1000),'kHz'],'fontsize',12,'color','red')
    title('SINGLE-SIDED MAGNITUDE SPECTRUM FOR SINUSOID Fo Hz')
    axis([0 Fs/2000 0 2])
    hold off
    pause(1),soundsc(y,Fs)
    
 end
 
 hold off
 axis normal,pause
    
  
   
   
   
   
   
elseif flag9==2;
   
  % BEAT FRQUENCIES
 
 
Fs=20000;							% sampling frequency=20000 Hz
Tlength=2;							% Set length of tone to two second
t=[0:1:Tlength*Fs-1];			% This is to keep N even, otherwise FFT takes a long time???
Tdisplay=.005;						% Display 5 ms of tone 
t1=[0:1:Tdisplay*Fs];
  
    

for Fo=[0:50:750 800:20:940 950:10:990 991:1:999 999.5]
   
   F1=0+Fo;
   F2=2000-Fo;
   diff=F2-F1;
   y1=sin(2*pi*t*F1/Fs);  
   y2=sin(2*pi*t*F2/Fs);
   y=y1+y2;
    % Single-sided spectrum
    N=length(y);
    Y=(2/N)*fft(y);		
    Y=abs(Y);
    N=length(Y);
    %F=linspace(0,Fs/2,N/2);
    F=[0:Fs/N:3000];		% display between 0 and 3000Hz
    N1=length(F);
    plot(F,Y(1:N1),'LineWidth',1.5),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE'),hold
    text(50,1.7,'CAN YOU HEAR F1(LOWER) AND/OR F2 (UPPER) OR BEAT FREQ. ?','fontsize',10,'color','black')
    text(700,1.1,['F2-F1 = ', num2str(diff),'Hz'],'fontsize',12,'color','red')
    title('MAGNITUDE SPECTRUM FOR SUM OF TWO SINUSOIDS F1 & F2 Hz')
    axis([0 3000 0 2]),grid
    hold off,
    pause(1),soundsc(y,Fs),pause(1)
    
 end
 
 pause
 subplot(211)
 plot(t/Fs,y(t+1))
 xlabel('TIME IN SECS')
 ylabel('AMPLITUDE')
 title('SUM OF TWO SINUSOIDS F1 & F2 Hz')
 
 subplot(212)
 plot(F,Y(1:N1),'LineWidth',1.5),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE'),hold
 text(50,1.7,'YOU CAN NOW ONLY HEAR THE BEAT FREQ.','fontsize',10,'color','black')
 text(750,1.1,['BEAT FREQ F2-F1 = ', num2str(diff),'Hz'],'fontsize',10,'color','red')
 title('MAGNITUDE SPECTRUM FOR SUM OF TWO SINUSOIDS F1 & F2 Hz')
 axis([0 3000 0 2]),grid,pause
 soundsc(y,Fs),pause
subplot 
 
 axis normal
 
  
   
   
   elseif flag9==3;
      
    % Listen to two tones separated in frequency, but different amplitudes

Fs=20000;							% sampling frequency=20000 Hz
Tlength=2;							% Set length of tone to one second
t=[0:1:Tlength*Fs-1];			% This is to keep N even, otherwise FFT takes a long time???
Fo=100;
F1=1000;
A0=1;
N=length(t);



for A1=0:0.2:2.0;
  y0=A0*sin(2*pi*t*Fo/Fs);
  y1=A1*sin(2*pi*t*F1/Fs);
  y=y0+y1;
  Y=(2/N)*fft(y);			% mult by 2 because single-sided spectrum
  Y=abs(Y);
  F=linspace(0,Fs/8,N/8);
  plot(F,Y(1:N/8),'LineWidth',2),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
  title('MAGNITUDE SPECTRUM FOR SUM OF TWO SINUSOIDS')
  axis([0 Fs/8 0 2])
  text(Fo+20,0.9,'Fo=100Hz','fontsize',12,'color','red')
  text(F1+20,0.5,'F1=1000Hz','fontsize',12,'color','red')
  grid
  pause(1),soundsc(y,Fs),pause(1)
end
axis normal


A0=1;A1=1;

for Fo=100:100:900;
  y0=A0*sin(2*pi*t*Fo/Fs);
  y1=A1*sin(2*pi*t*F1/Fs);
  y=y0+y1;
  Y=(2/N)*fft(y);			% mult by 2 because single-sided spectrum
  Y=abs(Y);
  F=linspace(0,Fs/8,N/8);
  plot(F,Y(1:N/8),'LineWidth',2),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
  title('MAGNITUDE SPECTRUM FOR SUM OF TWO SINUSOIDS')
  axis([0 Fs/8 0 2])
  
  text(Fo+20,0.9,['\leftarrowFo=', num2str(Fo),'Hz'],'fontsize',12,'color','red')
  text(F1+20,0.5,'F1=1000Hz','fontsize',12,'color','red')
  grid
  pause(1),soundsc(y,Fs),pause(1)
end
axis normal 










elseif flag9==4;
   %PERCEPTION OF PITCH - RISETS DEMO
   
load speech;				% loads variable speech, Fs=8000Hz, 8bits PCM, 2.5 secs
x=speech;
Fs=8000;						% sampling frequency=8000 Hz
N=length(x);
t=[0:1:N-1]/Fs;
plot(t,x);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF SPEECH AT 8000 SAMPLES/SEC')
text(0.5,3500,'PLAYED AT 8000 SAMPLES/SEC','fontsize',12,'color','red')
pause,soundsc(x,8000)
pause

% Single-sided spectrum
    X=(1/Fs)*fft(x);		
    X=abs(X);
    N=length(X);
    F=linspace(0,Fs/2,N/2);
    plot(F,X(1:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
    title('SPECTRUM FOR SPEECH SIGNAL PLAYED AT NORMAL SPEED')
    text(1000,80,'Spectrum for speech played at 8 ksamples/sec','fontsize',12,'color','red')
    axis([0 8000 0 120])
    pause
    soundsc(x,8000),pause

    
    
    
    % play speech at 16000 samples/sec
    
x1=x(1:2:N);
t2=t(1:2:N)/2;
plot(t2,x1)
axis([0 2.5 -3000 4000])
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF SPEECH AT 16000 SAMPLES/SEC')
text(0.2,3500,'NOW PLAYED AT 16000 SAMPLES/SEC','fontsize',12,'color','red')
pause,soundsc(x,16000),pause
axis normal

F=linspace(0,Fs,N/4);
plot(F,X(1:2:N/2)),xlabel('FREQ IN HZ'),ylabel('AMPLITUDE')
title('SPECTRUM FOR SPEECH SIGNAL PLAYED AT TWICE NORMAL SPEED')
text(1000,80,'Spectrum for speech played at 16 ksamples/sec','fontsize',12,'color','red')
axis([0 8000 0 120])
pause,soundsc(x,16000),pause
axis normal

  
   
Fs=20000;							% sampling frequency=20000 Hz
Tlength=2;							% Set length of tone to two seconds
t=[0:1:Tlength*Fs-1];			% This is to keep N even, otherwise FFT takes a long time???                    
N=length(t);
xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')

   
   
   Fstep=2^(1.1);
   Fo=100;
   F(1)=Fo;           	% True freq
   y=cos(2*pi*t*Fo/Fs);  
   for j=1:6
      Fo=Fo*Fstep;
      F(j+1)=Fo;		% True freq
      y=y+cos(2*pi*t*Fo/Fs);  
   end
   plot(t/Fs,y)
   xlabel('TIME IN SECS')
   ylabel('AMPLITUDE')
   title('WHAT IS THIS SIGNAL? ')
   text(0.8,7,'ZOOM IN ON PLOT - HIT RETURN','fontsize',12,'color','red')
   pause
   
   
   % zoom in on plot
   plot(t(1:10000)/Fs,y(1:10000))
   xlabel('TIME IN SECS')
   ylabel('AMPLITUDE')
   title('WHAT IS THIS SIGNAL? ')
   text(0.2,7,'ZOOM IN ON PLOT - HIT RETURN','fontsize',12,'color','red')
   pause
   
   plot(t(1:5000)/Fs,y(1:5000))
   xlabel('TIME IN SECS')
   ylabel('AMPLITUDE')
   title('WHAT IS THIS SIGNAL? ')
   text(0.1,7,'ZOOM IN ON PLOT - HIT RETURN','fontsize',12,'color','red')
   pause
   
   plot(t(1:2000)/Fs,y(1:2000))
   xlabel('TIME IN SECS')
   ylabel('AMPLITUDE')
   title('WHAT IS THIS SIGNAL? ')
   text(0.04,7,'ZOOM IN ON PLOT-  HIT RETURN','fontsize',12,'color','red')
   pause

   plot(t(1:500)/Fs,y(1:500))
   xlabel('TIME IN SECS')
   ylabel('AMPLITUDE')
   title('WHAT IS THIS SIGNAL? ')
   text(0.01,7,'ZOOM IN ON PLOT - HIT RETURN','fontsize',12,'color','red')
   pause
   
   plot(t(1:100)/Fs,y(1:100))
   xlabel('TIME IN SECS')
   ylabel('AMPLITUDE')
   title('WHAT IS THIS SIGNAL? ')
   pause
   text(0.0005,7,'IS THIS WHITE NOISE? - HIT RETURN AND LISTEN','fontsize',12,'color','red')
   pause

   plot(t/Fs,y)
   xlabel('TIME IN SECS')
   ylabel('AMPLITUDE')
   title('WHAT IS THIS SIGNAL? ')
   text(0.05,7,'SUM OF SEVEN EQUAL AMPLITUDE  SINUSOIDS','fontsize',12,'color','red')
   soundsc(y,Fs),pause



for j=1:2   % play signal four times
   
   plot(t/Fs,y)
   xlabel('TIME IN SECS')
   ylabel('AMPLITUDE')
   title('SUM OF SEVEN EQUAL AMPLITUDE  SINUSOIDS ')
   text(0.2,7,'HIT RETURN TO PLAY SIGNAL AT NORMAL SPEED - Fs = 20 ksamples/sec ','fontsize',8,'color','red')
   pause
   soundsc(y,Fs)
   pause
   
   y1=y(1:2:N);
   t2=t(1:2:N)/2;
   plot(t2/Fs,y1),hold
   xlabel('TIME IN SECS')
   ylabel('AMPLITUDE')
   title('SUM OF SEVEN EQUAL AMPLITUDE  SINUSOIDS ')
   text(0.05,7,'HIT RETURN TO PLAY SIGNAL AT TWICE NORMAL SPEED - Fs = 40 ksamples/sec ','fontsize',8,'color','red')
   axis([0 2 -8 8])
   plot([1 2],[0 0],'b')
   pause
   soundsc(y,2*Fs)
   pause
   axis normal
   hold off
end

A(1)=1; A(2)=2.1;A(3)=3.2; A(4)=4.3;A(5)=5.4; A(6)=6.5;A(7)=7.6; 
plot([0 10],[0 0],'b'),hold
axis([0 10 0 2])
for j=1:7;
plot([A(j) A(j)], [0 1],'LineWidth',2,'color','blue')
end
xlabel('RELATIVE FREQ. IN OCTAVES - normalised log2(f)')
ylabel('AMPLITUDE'),grid
title ('SPECTRUM FOR SIGNAL PLAYED AT ORIGINAL SPEED')
text(1.5,1.5,'EACH PARTIAL SEPARATED BY 1.1 OCTAVES','fontsize',12,'color','red')
text(0.1,1.3,'KEEP HITTING RETURN TO SEE EFFECT OF DOUBLING PAYBACK SPEED','fontsize',9,'color','black')
pause,hold off



% initialise B(i) - if you don't do this you get an error using MATLAB 6. This is because
% you first assign a value to B(7), although you have said nothing about B(1 to 6). It doesn,t seem to
% like this and wouldn't implement plot([B(j) B(j)], [0 1],'LineWidth',2,'color','red'). Don't know why this
% is not a problem with MATLAB 5!!!

B(1:7)=0;

for j=7:-1:1;  % modify the j-th partial
      
   	for k=1:5;		% move the j-th partial 0.25 each step
      plot([0 10],[0 0],'b'),hold 
      axis([0 10 0 2]),grid
      xlabel('RELATIVE FREQ. IN OCTAVES - normalised log2(f)')
      ylabel('AMPLITUDE')
      title ('SPECTRUM FOR SIGNAL PLAYED AT TWICE ORIGINAL SPEED')
      text(0.5,1.7,'BLUE = spectrum for signal played at original speed','fontsize',12,'color','blue')
      text(0.5,1.5,'RED = spectrum for signal played at twice original speed','fontsize',12,'color','red')
      text(0.5,1.3,'EACH BLUE PARTIAL MOVES UP ONE OCTAVE','fontsize',12,'color','black')


      		for i=1:7; % plot the original spectrum of the partials	
            plot([A(i) A(i)], [0 1],'LineWidth',2,'color','blue')
            end
            if j<7
               for i=7:-1:j+1
               plot([B(i) B(i)], [0 1],'LineWidth',2,'color','red')
               end
            end
        
                        
      B(j)=A(j)+(k-1)*0.25;
      plot([B(j) B(j)], [0 1],'LineWidth',2,'color','red')
      pause(0.1),hold off
		end
      pause
      
end

hold off





for j=1:2   % play signal last four times
   
   plot(t/Fs,y)
   xlabel('TIME IN SECS')
   ylabel('AMPLITUDE')
   title('SUM OF SEVEN EQUAL AMPLITUDE  SINUSOIDS ')
   text(0.2,7,'NORMAL SPEED - Fs = 20 ksamples/sec ','fontsize',10,'color','red')
   pause
   soundsc(y,Fs)
   pause
   
   y1=y(1:2:N);
   t2=t(1:2:N)/2;
   plot(t2/Fs,y1),hold
   xlabel('TIME IN SECS')
   ylabel('AMPLITUDE')
   title('SUM OF SEVEN EQUAL AMPLITUDE  SINUSOIDS ')
   text(0.01,7,'TWICE NORMAL SPEED - Fs = 40 ksamples/sec. PITCH DECREASED!','fontsize',10,'color','red')
   axis([0 2 -8 8])
   plot([1 2],[0 0],'b')
   pause
   soundsc(y,2*Fs)
   pause
   axis normal
   hold off
end

   
   
elseif flag9==5;   %CIRCULAR PITCH - SHEPARD'S DEMO
   
   F(1)=100;F(2)=200;F(3)=400;F(4)=800;
   F(5)=1600;F(6)=3200;F(7)=6400;
   S=2^(1/12);  % semitone frequency multiplier
   
   x=[1:1:84];
   c=60;b=37;a=1/(5^2);  % 5^2 seems to work well
   % In fact it does not seem to be the 'y' wieghting that creates the
   % effect as much as the motion of the harmonics in a circular form
   
   y=c-a*(x-b).^2;
   % plot(x,y);
   P=2; % No. octaves that program will cycle through   
   
   % assign amplitudes and freqs to 67 notes
   for k=1:12;							% k-th note of octave
      for j=1:7; 						%identifies octaves one to 7
         A(j,k)=y(12*(j-1)+k); 	% amplitude of kth-note of octave 'j'
         FF(j,k)=F(j)*S^(k-1);  	% frquency of kth-note of octave 'j'
      end
      A(7,2:12)=0;					 % set amplitudes of all notes of octave seven (except first) to zero           
   end
      
   % create signal
    Fs=20000;		% set sampling frq.
  	Tlength=0.5;							% Set length of tone to 0.75 seconds
Tdisplay=.050;						% Display 50 ms of tone 
t=[0:1:Tlength*Fs-1];			% This is to keep N even, otherwise FFT takes a long time???
t1=[0:1:Tdisplay*Fs];			% Plotting vector - number of samples to make up Tdisplay
N=length(t);  

 for l=1:P;								% repeat P times 
    for k=1:12;						% k-th note of octave
       x=zeros(1,N);					% set dimension of vector 

 for j=1:7; 					   	%identifies octaves one to 7
    
    
    x=x+A(j,k)*sin(2*pi*t*FF(j,k)/Fs);                            
      
      
    
 end
 
 plot(1000*t(1:500)/Fs,x(1:500));
 xlabel('TIME IN MSECS')
 ylabel('AMPLITUDE')
 title('25 MSECS of SIGNAL')
 grid,
 axis([0 25 -200 200])
 text(6,170,'WHERE IS THE PITCH GOING?','fontsize',12,'color','red')
 soundsc(x,Fs),pause(0.7)

end
end  
subplot, axis normal,pause   




% Repeat demo with spectral information


 for l=1:P;								% repeat P times 
    for k=1:12;						% k-th note of octave
       x=zeros(1,N);					% set dimension of vector 

 for j=1:7; 					   	%identifies octaves one to 7
    
    
    x=x+A(j,k)*sin(2*pi*t*FF(j,k)/Fs);                            
      
      
    
 end
 
 subplot(211)
 plot(1000*t(1:500)/Fs,x(1:500));
 xlabel('TIME IN MSECS')
 ylabel('AMPLITUDE')
 title('25 MSECS of SIGNAL')
 grid
 subplot(212)
 
 for m=1:7
     plot([log2(FF(m,k))-log2(100) log2(FF(m,k))-log2(100)],[0 A(m,k)],'LineWidth',2,'color','blue'), hold on
 end

 FFF=log2([FF(1,:) FF(2,:) FF(3,:) FF(4,:) FF(5,:) FF(6,:) FF(7,:)]);
 plot(FFF-log2(100),y,'r--');grid
 axis([0 7 0 70])
 xlabel('SPACING IN OCTAVES')
 ylabel('AMPLITUDE')
 title('SIGNAL SPECTRUM:MOVEMENT IN SEMITONES: "0" = 100HZ')
 text(4.1,65,'CIRCULAR PITCH PARADOX EXPLAINED','fontsize',10,'color','red')

 soundsc(x,Fs),pause(0.7),hold off

end
end  
subplot, axis normal   
   






   
elseif flag9==6;  
   
   
   
   % IS THE EAR INSENSITIVE TO PHASE ?
   
   
   
   while 40==40 
    
                                                                 
   C40={	'LISTEN TO SINUSOIDAL TONES WITH DIFFERENT PHASES'...
   		'LISTEN TO A MUSICAL CHORD, AND ALTER THE PHASE OF EACH NOTE'...
   		'RECONSTRUCT SPEECH USING THE NEGATED PHASE COMPONENT OF THE DFT SPEECH SPECTRUM'...
         'RECONSTRUCT SPEECH USING ONLY THE PHASE COMPONENT OF THE DFT SPEECH SPECTRUM'...
         'RECONSTRUCT SPEECH USING ONLY THE MAGNITUDE COMPONENT OF THE DFT SPEECH SPECTRUM'...
         'RECONSTRUCT SPEECH USING ONLY THE REAL PART OF THE DFT SPEECH SPECTRUM'...
         'RECONSTRUCT SPEECH USING ONLY THE IMAGINARY PART OF THE DFT SPEECH SPECTRUM'...
         'MIX THE MAGNITUDE OF DFT OF ONE SIGNAL WITH PHASE OF DFT OF ANOTHER'...
         'FILTER SPEECH WITH WITH AN ALL-PASS FILTER - 2nd ORDER AND 100th ORDER'...
	   	'RETURN TO THE MAIN MENU FOR DEMO 12 '...
   		'END'};

flag40=menu('SUB MENU OF DEMO12:   IS THE EAR INSENSITIVE TO PHASE?         ' ,C40);
   
  
  if flag40==1;   % LISTEN TO SINUSOIDAL TONES WITH DIFFERENT PHASES
     
     
     Fs=32000;							% sampling frequency=32000 Hz
Tlength=2;							% Set length of tone to two seconds
t=[0:1:Tlength*Fs-1];			% This is to keep N even, otherwise FFT takes a long time???
  
   
   
   
    Tdisplay=.005;						% Display 5 ms of tone 
    t1=[0:1:Tdisplay*Fs];
    Fo=1000;
    
    close all
    % EXAMINE TWO SINUSOIDS OF DIFFERENT PHASES
    y=sin(2*pi*t*Fo/Fs);                            
    subplot(211)
    plot(1000*t1/Fs,y(t1+1)),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 5 -1.5 1.5])
    title(' 5 MS SAMPLE OF SINUSOID, Fo Hz ')
    text(0.75,1.25,['cos(2\piFot),  Frequency Fo=', num2str(Fo),'Hz'],'fontsize',12,'color','blue')    
    pause,soundsc(y,Fs),pause
    
    
    y=sin(2*pi*t*Fo/Fs-pi/3);                            
    subplot(212)
    plot(1000*t1/Fs,y(t1+1),'r'),grid
    xlabel('TIME IN MSEC'),ylabel('AMPLITUDE')
    axis([0 5 -1.5 1.5])
    title(' 5 MS SAMPLE OF PHASE DELAYED SINUSOID, Fo Hz ')
    text(0.75,1.25,['cos(2\piFot-\pi/3),  Frequency Fo=', num2str(Fo),'Hz'],'fontsize',12,'color','red')    
    pause,soundsc(y,Fs),pause

    subplot(211),text(2.75,0.25,'LISTEN','color','blue','fontsize',13)
    soundsc(y,Fs),pause,
    subplot(212),text(2.75,0.25,'LISTEN','color','red','fontsize',13)
    soundsc(y,Fs),pause,
    
    subplot(211),text(1.1,-1.25,'\itBOTH SOUND THE SAME!!','color','black','fontsize',13)
    subplot(212),text(1.1,-1.25,'\itBOTH SOUND THE SAME!!','color','black','fontsize',13)
    pause,subplot

     
       
     
     

elseif flag40==2 % LISTEN TO A MUSICAL CHORD, AND ALTER THE PHASE OF EACH NOTE
   
    % EXAMINE A TONE MADE UP OF FOUR SINUSOIDS
    
    
Fs=11025;Ts=1/Fs;
N=30000;
t1=[0:N-1];
t=[0:Ts:(N-1)*Ts];
x1=sin(2*pi*256*t1*Ts);
x2=sin(2*pi*322*t1*Ts);
x3=sin(2*pi*383.5*t1*Ts);
x4=sin(2*pi*456.1*t1*Ts);
y1=x1;
y2=y1+x2;
y3=y2+x3;
y4=y3+x4;

N1=220;
t2=[0:Ts:(N1-1)*Ts]*1000;
plot(t2,x1(1:N1)),grid,
axis([0 20 -1.5 1.5])
title('NOW LISTEN TO THE NOTES OF C-DOMINANT SEVENTH')
text(6,1.25,'256 HZ SINUSOID: Middle-C','color','red','fontsize',13),
xlabel('TIME IN MS'), ylabel('AMPLITUDE'),pause
soundsc(x1,Fs),pause

plot(t2,x2(1:N1)),grid,
axis([0 20 -1.5 1.5])
title('NOW LISTEN TO THE NOTES OF C-DOMINANT SEVENTH')
text(6,1.25,'322 HZ SINUSOID: E','color','red','fontsize',13),
xlabel('TIME IN MS'), ylabel('AMPLITUDE'),pause
soundsc(x2,Fs),pause

plot(t2,x3(1:N1)),grid,
axis([0 20 -1.5 1.5])
title('NOW LISTEN TO THE NOTES OF C-DOMINANT SEVENTH')
text(6,1.25,'383.5 HZ SINUSOID: G','color','red','fontsize',13),
xlabel('TIME IN MS'), ylabel('AMPLITUDE'),pause
soundsc(x3,Fs),pause

plot(t2,x4(1:N1)),grid,
axis([0 20 -1.5 1.5])
title('NOW LISTEN TO THE NOTES OF C-DOMINANT SEVENTH')
text(6,1.25,'456.1 HZ SINUSOID: B-Flat','color','red','fontsize',13),
xlabel('TIME IN MS'), ylabel('AMPLITUDE'),pause
soundsc(x4,Fs),pause


text(0.5,-1.3,'NOW ADD THESE TONES TOGETHER TO FORM C-DOMINANT SEVENTH','color','black','fontsize',11),pause
N2=1102;
t3=[0:Ts:(N2-1)*Ts]*1000;
plot(t3,y1(1:N2)),grid,title('256 HZ SINUSOID: Middle-C')
axis([0 100 -5 5])
xlabel('TIME IN MS'), ylabel('AMPLITUDE'),pause
soundsc(y1,Fs),pause
plot(t3,y2(1:N2)),grid,title('256 & 322 HZ SINUSOIDS: C & E')
axis([0 100 -5 5])
xlabel('TIME IN MS'), ylabel('AMPLITUDE'),pause
soundsc(y2,Fs),pause
plot(t3,y3(1:N2)),grid,title('256,322 & 383.5 HZ SINUSOIDS: C, E & G')
axis([0 100 -5 5])
xlabel('TIME IN MS'), ylabel('AMPLITUDE'),pause
soundsc(y3,Fs),pause
plot(t3,y4(1:N2)),grid,title('256,322,383.5 & 456.1 HZ SINUSOIDS: C, E, G & B-Flat')
axis([0 100 -5 5])
xlabel('TIME IN MS'), ylabel('AMPLITUDE'),pause
soundsc(y4,Fs),pause
title('THE CHORD C-DOMINANT SEVENTH'),pause,soundsc(y4,Fs),pause
subplot, axis normal

subplot(511)
plot(t3,x1(1:N2)),grid,title('SUMMING TONES TO PRODUCE C-DOMINANT SEVENTH')
text(42,2.7,'256 HZ SINUSOID: Middle-C','fontsize',10,'color','red')
axis([0 100 -5 5])
soundsc(x1,Fs),pause
subplot(512)
plot(t3,x2(1:N2)),grid,
text(42,2.7,'322 HZ SINUSOID: E','fontsize',10,'color','red')
axis([0 100 -5 5])
soundsc(x2,Fs),pause
subplot(513)
plot(t3,x3(1:N2)),grid,
text(42,2.7,'383.5 HZ SINUSOID: G','fontsize',10,'color','red')
axis([0 100 -5 5])
soundsc(x3,Fs),pause
subplot(514)
plot(t3,x4(1:N2)),grid,
text(42,2.7,'456.1 HZ SINUSOID: B-Flat','fontsize',10,'color','red')
axis([0 100 -5 5])
soundsc(x4,Fs),pause
subplot(515)
plot(t3,y4(1:N2),'r'),grid,
text(42,3.3,'C-DOMINANT SEVENTH CHORD','fontsize',10,'color','blue')
xlabel('TIME IN MS')
axis([0 100 -5 5])
soundsc(y4,Fs),pause
subplot, axis normal,close all

% Phase and Magnitude spectrum of C-DOMINANT SEVENTH


% mag. sectrum
   plot([0 600],[0 0],'b','LineWidth',2),hold
   plot([0 0],[0 2],'k','LineWidth',2),grid
   axis([0 600 0 2])
     
F1=256;
F2=322;
F3=383;
F4=456;

plot([F1 F1],[0 1],'b','LineWidth',2)
plot([F2 F2],[0 1],'b','LineWidth',2)
plot([F3 F3],[0 1],'b','LineWidth',2)
plot([F4 F4],[0 1],'b','LineWidth',2)
xlabel('FREQ IN HZ')
ylabel('AMPLITUDE')
title('MAGNITUDE SPECTRUM OF C-DOMINANT SEVENTH')
text(F1+5,0.9,[num2str(F1),'Hz'],'fontsize',10,'color','red')
text(F2+5,0.9,[num2str(F2),'Hz'],'fontsize',10,'color','red')
text(F3+5,0.9,[num2str(F3),'Hz'],'fontsize',10,'color','red')
text(F4+5,0.9,[num2str(F4),'Hz'],'fontsize',10,'color','red')
text(F1,1.05,'1.0','fontsize',10,'color','black')
text(F2,1.05,'1.0','fontsize',10,'color','black')
text(F3,1.05,'1.0','fontsize',10,'color','black')
text(F4,1.05,'1.0','fontsize',10,'color','black')


hold off,pause

% phase spectrum
   plot([0 600],[0 0],'b','LineWidth',2),hold
   axis([0 600 -180 180])
   plot([0 0],[-180 180],'k','LineWidth',2),grid
     
P1=-90;
P2=-90;
P3=-90;
P4=-90;

plot([F1 F1],[0 P1],'b','LineWidth',2)
plot([F2 F2],[0 P2],'b','LineWidth',2)
plot([F3 F3],[0 P3],'b','LineWidth',2)
plot([F4 F4],[0 P4],'b','LineWidth',2)

text(F1+5,-70,[num2str(F1),'Hz'],'fontsize',10,'color','red')
text(F2+5,-70,[num2str(F2),'Hz'],'fontsize',10,'color','red')
text(F3+5,-70,[num2str(F3),'Hz'],'fontsize',10,'color','red')
text(F4+5,-70,[num2str(F4),'Hz'],'fontsize',10,'color','red')
text(F1,-95,'-90','fontsize',10,'color','black')
text(F2,-95,'-90','fontsize',10,'color','black')
text(F3,-95,'-90','fontsize',10,'color','black')
text(F4,-95,'-90','fontsize',10,'color','black')
xlabel('FREQ IN HZ')
ylabel('PHASE IN DEGREES')
title('PHASE SPECTRUM OF C-DOMINANT SEVENTH')
hold off,pause


% new phase spectrum

subplot(211)
plot([0 600],[0 0],'b','LineWidth',2),hold
   axis([0 600 -180 180])
   plot([0 0],[-180 180],'k','LineWidth',2),grid
     
plot([F1 F1],[0 P1],'b','LineWidth',2)
plot([F2 F2],[0 P2],'b','LineWidth',2)
plot([F3 F3],[0 P3],'b','LineWidth',2)
plot([F4 F4],[0 P4],'b','LineWidth',2)
xlabel('FREQ IN HZ')
ylabel('PHASE IN DEGREES')
title('ORIGINAL PHASE SPECTRUM OF C-DOMINANT SEVENTH')
hold off,pause

subplot(212)
plot([0 600],[0 0],'b','LineWidth',2),hold
axis([0 600 -180 180])
plot([0 0],[-180 180],'k','LineWidth',2),grid


PP1=-150;
PP2=-45;
PP3=+162;
PP4=-150;

plot([F1 F1],[0 PP1],'r','LineWidth',2)
plot([F2 F2],[0 PP2],'r','LineWidth',2)
plot([F3 F3],[0 PP3],'r','LineWidth',2)
plot([F4 F4],[0 PP4],'r','LineWidth',2)

xlabel('FREQ IN HZ')
ylabel('PHASE IN DEGREES')
title('ALTERED PHASE SPECTRUM OF C-DOMINANT SEVENTH')
hold off,pause


% alter the phase of each component
x1=-sin(2*pi*256*t1*Ts+2*pi/3);
x2=sin(2*pi*322*t1*Ts+pi/4);
x3=-sin(2*pi*383.5*t1*Ts+2*pi/5);
x4=sin(2*pi*456.1*t1*Ts-2*pi/6);
y=x1+x2+x3+x4;
subplot(211)
plot(t3,y4(1:N2)),grid
title('C7 USING ORININAL PHASE INFORMATION')
ylabel('AMPLITUDE')
subplot(2,1,2)
plot(t3,y(1:N2),'r'),grid,title('C7 USING ALTERED PHASE INFORMATION')
xlabel('TIME IN MS'), ylabel('AMPLITUDE'),pause
subplot(211),text(45,3.5,'LISTEN','color','red'),soundsc(y4,Fs),pause
subplot(212),text(45,3.5,'LISTEN','color','blue'),soundsc(y,Fs),pause
subplot(211),text(42,-3.5,'BOTH SOUND THE SAME','color','red'),soundsc(y4,Fs),pause
subplot(212),text(42,-3.5,'BOTH SOUND THE SAME','color','blue'),soundsc(y4,Fs),pause
subplot off, close all


   
   
elseif flag40==3 % NEGATE THE PHASE COMPONENT OF SPEECH
   
   
     

% Now negate the phase of a speech signal

load speech;				% loads variable speech, Fs=8000Hz, 8bits PCM, 2.5 secs
xx=speech/max(speech);
Fss=8000;		
NN=length(xx);
tt=[0:1:NN-1]/Fss;
plot(tt,xx);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH'),pause,soundsc(xx,Fss),pause
 XX=(1/Fss)*fft(xx);		
 XX=abs(XX);
 XX1=[XX(NN/2:-1:1) XX(1:NN/2)];
       FF=linspace(-Fss/2,Fss/2,length(XX1));
      plot(FF/1000,XX1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('DOUBLE-SIDED MAGN. SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause 
      hold off
      
      
      % plot phase spectrum of speech
      XX=angle(fft(xx))*180/pi;	% phase in degrees		
      XX1=[XX(NN/2:-1:1) XX(1:NN/2)];
      plot(FF/1000,XX1),xlabel('FREQ IN kHZ'),ylabel('PHASE IN DEGREES')
      title('DOUBLE-SIDED PHASE SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      text(-3,50,'(Speech has random phase spectrum)','fontsize',14,'color','red')
      hold
      plot([0 0],[-200 200],'k','LineWidth',2)
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, 
      hold off
      XX2=[-XX(100:-1:2) XX(1:100)];
      FFF=linspace(-40,40,199);
      plot(FFF,XX2),xlabel('FREQ IN HZ'),ylabel('PHASE IN DEGREES')
      title('PART OF THE PHASE SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      text(-20,-50,'ZOOMED IN ON -40 TO +40 HZ','fontsize',12,'color','black')
      hold
      plot([0 0],[-80 80],'k','LineWidth',1)
      plot([-40 40],[0 0],'k','LineWidth',1)
      pause
      plot(FFF,-XX2,'r')
      text(-30,60,'ALTERED PHASE = MINUS ORIGINAL PHASE','fontsize',12,'color','red'),pause   
      hold off
      
      subplot(211)
		plot(tt,xx);
		ylabel('AMPLITUDE'),grid
      title ('ORIGINAL SPEECH')
      axis([0 2.5 -1.5 1.5])
      pause
      subplot(212)
		plot(tt,xx(NN:-1:1),'r');
		ylabel('AMPLITUDE'),grid
      title ('PHASE ALTERED SPEECH')
      axis([0 2.5 -1.5 1.5])
      xlabel('TIME IN SECS')
      pause
      
      subplot(211),text(1.25,1.3,'ORIGINAL SPEECH','color','red')
      soundsc(xx,Fss),pause
      subplot(212),text(1.25,1.3, 'PHASE ALTERED SPEECH','color','blue')
      soundsc(xx(NN:-1:1),Fss),pause
subplot(211),text(1.1,-1.2,'BOTH SOUND DIFFERENT!!','color','black')
subplot(212),text(1.1,-1.2,'BOTH SOUND DIFFERENT!!','color','black'),pause
soundsc(xx,Fss),pause
soundsc(xx(NN:-1:1),Fss),pause
subplot, close all
 
   
elseif flag40==4 % USE ONLY THE PHASE COMPONENT OF THE SPEECH SPECTRUM
   
load speech;				% loads variable speech, Fs=8000Hz, 8bits PCM, 2.5 secs
xx=speech/max(speech);
Fss=8000;		
NN=length(xx);
tt=[0:1:NN-1]/Fss;
plot(tt,xx);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH'),pause,soundsc(xx,Fss),pause
 XX=(1/Fss)*fft(xx);		
 XX=abs(XX);
 XX1=[XX(NN/2:-1:1) XX(1:NN/2)];
       FF=linspace(-Fss/2,Fss/2,length(XX1));
      plot(FF/1000,XX1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('DOUBLE-SIDED MAGN. SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause 
      hold off
      
      
      % plot phase spectrum of speech
      XX=angle(fft(xx))*180/pi;	% phase in degrees		
      XX1=[XX(NN/2:-1:1) XX(1:NN/2)];
      plot(FF/1000,XX1),xlabel('FREQ IN kHZ'),ylabel('PHASE IN DEGREES')
      title('DOUBLE-SIDED PHASE SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      text(-3,50,'(Speech has random phase spectrum)','fontsize',14,'color','red')
      hold
      plot([0 0],[-200 200],'k','LineWidth',2)
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, 
      hold off
      XX2=[-XX(100:-1:2) XX(1:100)];
      FFF=linspace(-40,40,199);
      plot(FFF,XX2),xlabel('FREQ IN HZ'),ylabel('PHASE IN DEGREES')
      title('PART OF THE PHASE SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      text(-20,-50,'ZOOMED IN ON -40 TO +40 HZ','fontsize',12,'color','black')
      hold
      plot([0 0],[-80 80],'k','LineWidth',1)
      plot([-40 40],[0 0],'k','LineWidth',1)
      pause,hold off
      
      subplot(211)  % Plot altered magnitude component
      plot([0 0],[0 2],'k','LineWidth',2),grid,hold
      plot([-4 4],[0 0],'k','LineWidth',2)
      ylabel('AMPLITUDE')
      title('NEW MAGN. SPECTRUM FOR SPEECH')
      axis([-4 4 0 2])
      plot([-4 4],[1 1],'b','LineWidth',2)
      text(-3,1.25,'(SET MAGNITUDE SPECTRUM TO ONE)','fontsize',14,'color','red')
      pause 
      hold off

      
      
      subplot(212)
      plot(FF/1000,XX1),xlabel('FREQ IN kHZ'),ylabel('PHASE IN DEGREES')
      title('DOUBLE-SIDED PHASE SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      text(-3,50,'(KEEP ORIGINAL PHASE SPECTRUM)','fontsize',14,'color','red')
      hold
      plot([0 0],[-200 200],'k','LineWidth',2)
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, 
      hold off, subplot,close all
      
      
      % FFT OF ALTERED SPEECH USING ONLY PHASE
      
      XX=(1/Fss)*fft(xx);	
      Y=XX./abs(XX);
      y=real(ifft(Y));		% use real command to get read of zsro imaginary part that
      							% is still included
      y=y/max(y);
      subplot(211)
      plot(tt,xx);
		ylabel('AMPLITUDE'),grid
		title ('2.5 SECONDS OF ORIGINAL SPEECH'),pause,soundsc(xx,Fss),pause

      subplot(212)
      plot(tt,y,'r');, xlabel('TIME IN SECS')
		ylabel('AMPLITUDE'),grid
      title ('2.5 SECONDS OF SPEECH RECONSTRUCTED USING ONLY PHASE INFO.')
      pause,soundsc(y,Fss),pause
      
      
      subplot(211)
      text(0.25,0.75,'USING BOTH  MAGN. & PHASE INFO','fontsize',14,'color','red')
      soundsc(xx,Fss),pause

		subplot(212)
		text(0.25,0.75,'USING ONLY PHASE INFO','fontsize',14,'color','blue')
		soundsc(y,Fss),pause
      subplot,close all
      






      
         
   
   
   
elseif flag40==5 %USE ONLY THE MAGNITUDE COMPONENT OF THE SPEECH SPECTRUM
   
   
load speech;				% loads variable speech, Fs=8000Hz, 8bits PCM, 2.5 secs
xx=speech/max(speech);
Fss=8000;		
NN=length(xx);
tt=[0:1:NN-1]/Fss;
plot(tt,xx);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH'),pause,soundsc(xx,Fss),pause
 XX=(1/Fss)*fft(xx);		
 XX=abs(XX);
 XX1=[XX(NN/2:-1:1) XX(1:NN/2)];
       FF=linspace(-Fss/2,Fss/2,length(XX1));
      plot(FF/1000,XX1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('DOUBLE-SIDED MAGN. SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause 
      hold off
      
      
      % plot phase spectrum of speech
      XX=angle(fft(xx))*180/pi;	% phase in degrees		
      XX1=[XX(NN/2:-1:1) XX(1:NN/2)];
      plot(FF/1000,XX1),xlabel('FREQ IN kHZ'),ylabel('PHASE IN DEGREES')
      title('DOUBLE-SIDED PHASE SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      text(-3,50,'(Speech has random phase spectrum)','fontsize',14,'color','red')
      hold
      plot([0 0],[-200 200],'k','LineWidth',2)
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, 
      hold off
      XX2=[-XX(100:-1:2) XX(1:100)];
      FFF=linspace(-40,40,199);
      plot(FFF,XX2),xlabel('FREQ IN HZ'),ylabel('PHASE IN DEGREES')
      title('PART OF THE PHASE SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      text(-20,-50,'ZOOMED IN ON -40 TO +40 HZ','fontsize',12,'color','black')
      hold
      plot([0 0],[-80 80],'k','LineWidth',1)
      plot([-40 40],[0 0],'k','LineWidth',1)
      pause,hold off
      
      
      XX=(1/Fss)*fft(xx);		
      XX=abs(XX);
      XX1=[XX(NN/2:-1:1) XX(1:NN/2)];

      subplot(211)  % Plot altered phase component
      plot(FF/1000,XX1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('DOUBLE-SIDED MAGN. SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      text(-2.5,0.035,'(KEEP ORIGINAL MAGN. SPECTRUM)','fontsize',14,'color','red')
      pause 
      hold off

            
      subplot(212)
      xlabel('FREQ IN kHZ'),ylabel('PHASE IN DEGREES')
      title('DOUBLE-SIDED PHASE SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      text(-1.5,50,'(SET PHASE TO ZERO)','fontsize',14,'color','red')
      hold
      plot([0 0],[-200 200],'k','LineWidth',2)
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, 
      hold off, subplot,close all
      
      
      % FFT OF ALTERED SPEECH USING ONLY MAGNITUDE COMPONENT
      
      XX=(1/Fss)*fft(xx);	
      Y=abs(XX);
      y=real(ifft(Y));		% use real command to get read of zsro imaginary part that
      							% is still included
      y=y(500:19500);		% to get rid of large values at beginning and end
      							% that spoil the dynamic range of the soundcard.
      y=y/max(y);
                    
                           
     ttt=[0:1:length(y)-1]/Fss;
                      
                          
      subplot(211)
      plot(tt,xx);
		ylabel('AMPLITUDE'),grid
		title ('2.5 SECONDS OF ORIGINAL SPEECH'),pause,soundsc(xx,Fss),pause

      subplot(212)
      plot(ttt,y,'r');, xlabel('TIME IN SECS')
		ylabel('AMPLITUDE'),grid
      title ('2.2375 SECONDS OF SPEECH RECONSTRUCTED USING ONLY MAGN. INFO.')
      pause,soundsc(y,Fss),pause
      
      
      subplot(211)
      text(0.25,0.75,'USING BOTH  MAGN. & PHASE INFO.','fontsize',14,'color','red')
      soundsc(xx,Fss),pause

		subplot(212)
		text(0.25,0.75,'USING ONLY MAGN. INFO','fontsize',14,'color','blue')
		soundsc(y,Fss),pause
      subplot,close all
      
   
   
elseif flag40==6 % USE ONLY THE REAL PART OF THE SPEECH SPECTRUM
   
 load speech;				% loads variable speech, Fs=8000Hz, 8bits PCM, 2.5 secs
xx=speech/max(speech);
Fss=8000;		
NN=length(xx);
tt=[0:1:NN-1]/Fss;
plot(tt,xx);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH'),pause,soundsc(xx,Fss),pause
       
      
      % plot phase spectrum of speech
      XX=angle(fft(xx))*180/pi;	% phase in degrees		
      XX1=[XX(NN/2:-1:1) XX(1:NN/2)];
      FF=linspace(-Fss/2,Fss/2,length(XX1));

      plot(FF/1000,XX1),xlabel('FREQ IN kHZ'),ylabel('PHASE IN DEGREES')
      title('DOUBLE-SIDED PHASE SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      text(-3,50,'(Speech has random phase spectrum)','fontsize',14,'color','red')
      hold
      plot([0 0],[-200 200],'k','LineWidth',2)
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, 
      hold off
      XX2=[-XX(100:-1:2) XX(1:100)];
      FFF=linspace(-40,40,199);
      plot(FFF,XX2),xlabel('FREQ IN HZ'),ylabel('PHASE IN DEGREES')
      title('PART OF THE PHASE SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      text(-20,-50,'ZOOMED IN ON -40 TO +40 HZ','fontsize',12,'color','black')
      hold
      plot([0 0],[-80 80],'k','LineWidth',1)
      plot([-40 40],[0 0],'k','LineWidth',1)
      pause,hold off
      
      
      
      
      



     subplot(211)  % plot original magnitude spectrum
    XX=(1/Fss)*fft(xx);		
    XX=abs(XX);
    XX1=[XX(NN/2:-1:1) XX(1:NN/2)];
       FF=linspace(-Fss/2,Fss/2,length(XX1));
      plot(FF/1000,XX1),ylabel('AMPLITUDE')
      title('ORIGINAL SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause 
      hold off



     subplot(212)  % Plot altered magnitude component
      % FFT OF ALTERED SPEECH USING ONLY REAL PART OFF ORIGINAL FFT
      
      XX=(1/Fss)*fft(xx);	
      Y=real(XX); 
      y=real(ifft(Y));		% use real command to get read of zsro imaginary part that
      							% is still included
      y=y/max(y);				% Speech just based on real part.
      YABS=abs(Y);
      YY1=[YABS(NN/2:-1:1) YABS(1:NN/2)];
      plot(FF/1000,YY1),hold
      xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      ylabel('AMPLITUDE')
      title('NEW MAGN. SPECTRUM FOR SPEECH')
      text(-3.9,0.035,'(DERIVED FROM REAL PART OF ORIGINAL SPECTRUM)','fontsize',12,'color','red')
      pause 
      hold off, subplot, close all

            



% phase spectrum

subplot(211)
XX=angle(fft(xx))*180/pi;	% phase in degrees		
      XX1=[XX(NN/2:-1:1) XX(1:NN/2)];
      plot(FF/1000,XX1),ylabel('PHASE IN DEGREES')
      title('ORIGINAL SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      text(-3,50,'(Speech has random phase spectrum)','fontsize',14,'color','red')
      hold
      plot([0 0],[-200 200],'k','LineWidth',2)
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, 
      hold off
      XX2=[-XX(400:-1:2) XX(1:400)];
      FFF=linspace(-160,160,799);
      plot(FFF,XX2),xlabel('FREQ IN HZ'),ylabel('PHASE IN DEGREES')
      title('PART OF THE PHASE SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      text(-100,-180,'ZOOMED IN ON -160 TO +160 HZ','fontsize',12,'color','red')
      hold
      plot([0 0],[-200 200],'k','LineWidth',1)
      plot([-160 160],[0 0],'k','LineWidth',1)
      axis([-160 160 -200 200])
      pause,hold off




	subplot(212)
     YANGLE=angle(Y)*180/pi;	% phase of new speech in degrees  
      % now since we require the phase spectrum to have odd symmetry,
      % and sice the new phase spectrum will be either 0 or 180 degrees, so as
      % to get the -ve symmetry we will negate the phase spectrum
      % for negative freqs, so that 180 goes to -180. Remember that the
      % new time domain signal is 0.5* (x(t) + x(-t)).
      
      
      XX1=[-YANGLE(NN/2:-1:1) YANGLE(1:NN/2)];
	   plot(FF/1000,XX1)
      xlabel('FREQ IN kHZ'),ylabel('PHASE IN DEGREES')
      title('NEW PHASE SPECTRUM FOR SPEECH SIGNAL')
      text(-3.9,50,'(NEW PHASE SPECTRUM BASED UPON REAL PART OF ORIGINAL SPECTRUM)','fontsize',8,'color','red')
      hold
      plot([0 0],[-200 200],'k','LineWidth',2)
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, 
      hold off       
      
      XX2=[-YANGLE(400:-1:2) YANGLE(1:400)];
      FFF=linspace(-160,160,799);
      plot(FFF,XX2),xlabel('FREQ IN HZ'),ylabel('PHASE IN DEGREES')
      title('NEW PHASE SPECTRUM FOR SPEECH SIGNAL')
      text(-100,-180,'ZOOMED IN ON -160 TO +160 HZ','fontsize',12,'color','red')
      hold
      plot([0 0],[-200 200],'k','LineWidth',1)
      plot([-160 160],[0 0],'k','LineWidth',1)
      axis([-160 160 -200 200])
      pause,hold off
      subplot,close all

            
            
      
      
      subplot(211)
      plot(tt,xx);
		ylabel('AMPLITUDE'),grid
		title ('2.5 SECONDS OF ORIGINAL SPEECH'),pause,soundsc(xx,Fss),pause

      subplot(212)
      plot(tt,y,'r');, xlabel('TIME IN SECS')
		ylabel('AMPLITUDE'),grid
      title ('2.5 SECONDS OF SPEECH RECONSTRUCTED USING ONLY REAL PART OF SPECTRUM')
      pause,soundsc(y,Fss),pause
      
      
      subplot(211)
      text(0.25,0.75,'USING BOTH REAL & IMAGIN. PART OF SPECTRUM','fontsize',12,'color','red')
      soundsc(xx,Fss),pause

		subplot(212)
		text(0.25,0.75,'USING ONLY REAL PART OF SPECTRUM','fontsize',12,'color','blue')
		soundsc(y,Fss),pause
      subplot,close all
      
  
   
   
   
   
   
   
elseif flag40==7 %   USE ONLY THE IMAGINARY PART OF THE SPEECH SPECTRUM
   
   
   load speech;				% loads variable speech, Fs=8000Hz, 8bits PCM, 2.5 secs
xx=speech/max(speech);
Fss=8000;		
NN=length(xx);
tt=[0:1:NN-1]/Fss;
plot(tt,xx);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH'),pause,soundsc(xx,Fss),pause
       
      
      % plot phase spectrum of speech
      XX=angle(fft(xx))*180/pi;	% phase in degrees		
      XX1=[XX(NN/2:-1:1) XX(1:NN/2)];
       FF=linspace(-Fss/2,Fss/2,length(XX1));

      plot(FF/1000,XX1),xlabel('FREQ IN kHZ'),ylabel('PHASE IN DEGREES')
      title('DOUBLE-SIDED PHASE SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      text(-3,50,'(Speech has random phase spectrum)','fontsize',14,'color','red')
      hold
      plot([0 0],[-200 200],'k','LineWidth',2)
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, 
      hold off
      XX2=[-XX(100:-1:2) XX(1:100)];
      FFF=linspace(-40,40,199);
      plot(FFF,XX2),xlabel('FREQ IN HZ'),ylabel('PHASE IN DEGREES')
      title('PART OF THE PHASE SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      text(-20,-50,'ZOOMED IN ON -40 TO +40 HZ','fontsize',12,'color','black')
      hold
      plot([0 0],[-80 80],'k','LineWidth',1)
      plot([-40 40],[0 0],'k','LineWidth',1)
      pause,hold off
      
      
     subplot(211)  % plot original magnitude spectrum
    XX=(1/Fss)*fft(xx);		
    XX=abs(XX);
    XX1=[XX(NN/2:-1:1) XX(1:NN/2)];
       FF=linspace(-Fss/2,Fss/2,length(XX1));
      plot(FF/1000,XX1),ylabel('AMPLITUDE')
      title('ORIGINAL SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause 
      hold off



     subplot(212)  % Plot altered magnitude component
     
     
     % FFT OF ALTERED SPEECH USING ONLY IMAG PART OFF ORIGINAL FFT
      
      XX=(1/Fss)*fft(xx);	
      Y=sqrt(-1)*imag(XX); 
      y=real(ifft(Y));		% use real command to get read of zsro imaginary part that
      							% is still included
      y=y/max(y);				% Speech just based on real part.
      YABS=abs(Y);
      YY1=[YABS(NN/2:-1:1) YABS(1:NN/2)];
      plot(FF/1000,YY1),hold
      xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      ylabel('AMPLITUDE')
      title('NEW MAGN. SPECTRUM FOR SPEECH')
      text(-3.9,0.035,'(DERIVED FROM IMAG. PART OF ORIGINAL SPECTRUM)','fontsize',12,'color','red')
      pause 
      hold off, subplot, close all

            



% phase spectrum

subplot(211)
XX=angle(fft(xx))*180/pi;	% phase in degrees		
      XX1=[XX(NN/2:-1:1) XX(1:NN/2)];
      plot(FF/1000,XX1),ylabel('PHASE IN DEGREES')
      title('ORIGINAL SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      text(-3,50,'(Speech has random phase spectrum)','fontsize',14,'color','red')
      hold
      plot([0 0],[-200 200],'k','LineWidth',1)
      plot([-4 4],[0 0],'k','LineWidth',1)
      pause, 
      hold off
      XX2=[-XX(100:-1:2) XX(1:100)];
      FFF=linspace(-40,40,199);
      plot(FFF,XX2),ylabel('PHASE IN DEGREES')
      title('PART OF THE PHASE SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      text(-20,-50,'ZOOMED IN ON -40 TO +40 HZ','fontsize',12,'color','red')
      hold
      plot([0 0],[-100 100],'k','LineWidth',1)
      plot([-40 40],[0 0],'k','LineWidth',1)
      pause,hold off




	subplot(212)
     YANGLE=angle(Y)*180/pi;	% phase of new speech in degrees  
      % now since we require the phase spectrum to have odd symmetry,
      % and sice the new phase spectrum will be either 0 or 180 degrees, so as
      % to get the -ve symmetry we will negate the phase spectrum
      % for negative freqs, so that 180 goes to -180. Remember that the
      % new time domain signal is 0.5* (x(t) - x(-t)).
      
      
      XX1=[YANGLE(NN/2:-1:1) YANGLE(1:NN/2)];
	   plot(FF/1000,XX1)
      xlabel('FREQ IN kHZ'),ylabel('PHASE IN DEGREES')
      title('NEW PHASE SPECTRUM FOR SPEECH SIGNAL')
      text(-3.5,150,'(NEW PHASE SPECTRUM BASED UPON IMAG. PART OF ORIGINAL SPECTRUM)','fontsize',9,'color','red')
      hold
      plot([0 0],[-200 200],'k','LineWidth',2)
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, 
      hold off, 
      
      
      
      XX2=[-YANGLE(100:-1:2) YANGLE(1:100)];
      FFF=linspace(-40,40,199);
      plot(FFF,XX2),xlabel('FREQ IN HZ'),ylabel('PHASE IN DEGREES')
      title('NEW PHASE SPECTRUM FOR SPEECH SIGNAL')
      text(-20,-50,'ZOOMED IN ON -40 TO +40 HZ','fontsize',12,'color','red')
      hold
      plot([0 0],[-80 80],'k','LineWidth',1)
      plot([-40 40],[0 0],'k','LineWidth',1)
      pause,hold off
      subplot,close all
      
      
      
            
      
      
      subplot(211)
      plot(tt,xx);
		ylabel('AMPLITUDE'),grid
		title ('2.5 SECONDS OF ORIGINAL SPEECH'),pause,soundsc(xx,Fss),pause

      subplot(212)
      plot(tt,y,'r');, xlabel('TIME IN SECS')
		ylabel('AMPLITUDE'),grid
      title ('2.5 SECONDS OF SPEECH RECONSTRUCTED USING ONLY IMAG. PART OF SPECTRUM')
      pause,soundsc(y,Fss),pause
      
      
      subplot(211)
      text(0.25,0.75,'USING BOTH REAL & IMAGIN. PART OF SPECTRUM','fontsize',12,'color','red')
      soundsc(xx,Fss),pause

		subplot(212)
		text(0.25,0.75,'USING ONLY IMAG. PART OF SPECTRUM','fontsize',12,'color','blue')
		soundsc(y,Fss),pause
      subplot,close all
      
      
      
      
      
      
      
      
      
      
   elseif flag40==8    %MIX THE MAGNITUDE OF DFT OF ONE SIGNAL WITH PHASE OF DFT OF ANOTHER
      j=sqrt(-1);
      load salsa2, y1=y(1:2^17);  			 	% Salsa
      load miles,  y2=y(1:2^17);   				% Jazz
      Y1=fft(y1); Y2=fft(y2);      				% Calculate DFT of both
      X1=abs(Y2).*exp(j*(angle(Y1)));			% DFT magnitude of jazz but phase of salsa
      X2=abs(Y1).*exp(j*(angle(Y2)));			% DFT magnitude of salsa but phase of jazz
      x1=real(ifft(X1));							% Use real to remove zero imag. part
      x2=real(ifft(X2));							% Use real to remove zero imag. part
      Fss=11025;										% Sampling freq in Hz
      
      NN=length(y1);									% All musical selections the same length								
      tt=[0:1:NN-1]/Fss;
		plot(tt,y1);, xlabel('SECS')
		ylabel('AMPLITUDE'),grid
		title ('12 SECONDS OF SALSA'),pause,soundsc(y1,Fss),pause
		plot(tt,y2);, xlabel('SECS')
		ylabel('AMPLITUDE'),grid
		title ('12 SECONDS OF JAZZ'),pause,soundsc(y2,Fss),pause
      yy1=y1(1:600); yy2=y2(1:600); xx1=x1(1:600); xx2=x2(1:600);    % Take small blocks simply for display
      ttt=[1:600]/Fss;
      
      % DISPLAY 54 MILLI-SECONDS WITH DFT SALSA PHASE BUT DFT JAZZ MAGNITUDE
      plot(ttt,yy1,'b');
      xlabel('SECS')
		ylabel('AMPLITUDE'),grid
      title ('54 MILLI-SECONDS OF SALSA'),hold, pause
      plot(ttt,xx1,'r');
      legend('BLUE IS THE ORIGINAL SALSA SIGNAL','RED IS THE RECONSTRUCTED SIGNAL WITH SALSA PHASE & JAZZ MAGNITUDE')
      xlabel('SECS')
		ylabel('AMPLITUDE')
      title ('54 MILLI-SECONDS WITH DFT SALSA PHASE BUT DFT JAZZ MAGNITUDE'), 
      pause
      soundsc(x1,Fss),hold,pause
      
      subplot(211)
      specgram(y1,650,Fss)
		xlabel('TIME IN SECS')
		ylabel('FREQ IN HZ')
      title(' spectrogram OF ORIGINAL SALSA '),pause
      subplot(212)
      specgram(x1,650,Fss)
		xlabel('TIME IN SECS')
		ylabel('FREQ IN HZ')
      title(' RECONSTRUCTED WITH DFT SALSA PHASE/DFT JAZZ MAGNITUDE '),pause
		subplot
		
      
      % DISPLAY 54 MILLI-SECONDS WITH DFT JAZZ PHASE BUT DFT SALSA MAGNITUDE
      plot(ttt,yy1,'b');
      xlabel('SECS')
		ylabel('AMPLITUDE'),grid
      title ('54 MILLI-SECONDS OF SALSA'),hold, pause
      plot(ttt,xx2,'r');
      legend('BLUE IS THE ORIGINAL SALSA SIGNAL','RED IS THE RECONSTRUCTED SIGNAL WITH JAZZ PHASE BUT SALSA MAGNITUDE')
      xlabel('SECS')
		ylabel('AMPLITUDE')
      title ('54 MILLI-SECONDS WITH DFT JAZZ PHASE BUT DFT SALSA MAGNITUDE'), 
      pause
      soundsc(x2,Fss),pause, hold
      
      subplot(211)
      specgram(y1,650,Fss)
		xlabel('TIME IN SECS')
		ylabel('FREQ IN HZ')
      title(' spectrogram OF ORIGINAL SALSA '),pause
      subplot(212)
      specgram(x2,650,Fss)
		xlabel('TIME IN SECS')
		ylabel('FREQ IN HZ')
      title(' RECONSTRUCTED WITH DFT JAZZ PHASE/DFT SALSA MAGNITUDE '),pause
		subplot

      
      
      
      
      
           
 elseif flag40==9    %FILTER SPEECH WITH WITH AN ALL-PASS FILTER    
    
    % Second-order APF
    load speech;
    x=speech;
    Fss=8000;
    NN=length(x);																
      tt=[0:1:NN-1]/Fss;
		plot(tt,x);, xlabel('SECS')
		ylabel('AMPLITUDE'),grid
		title ('THE ORIGINAL SPEECH'),pause,soundsc(x,Fss),pause

      
    
	 b=[1 0 .9];
	 a=[.9 0 1];
    [H,W] = freqz(a,b,10000,'whole');
    H=(H(1:5000));
    f=linspace(0,Fss/2,5000);
    subplot(211)
    plot(f,round(abs(H))),ylabel('LINEAR') % I don't know why I need round - it should be a straight line
	 grid, title('MAGNITUDE RESPONSE OF SECOND-ORDER ALL-PASS FILTER')	
    subplot(212)
    HH=unwrap(angle(H))*180/pi; % angle in degrees
    plot(f,HH), xlabel('FREQ IN HZ'),ylabel('DEGREES') 
    grid, title('PHASE RESPONSE OF SECOND-ORDER ALL-PASS FILTER'),pause
    subplot
    
    
    y=filter(a,b,x);
    	plot(tt,y,'r');, xlabel('SECS')
		ylabel('AMPLITUDE'),grid
		title ('THE ALL-PASS (2nd-ORDER)FILTERED SPEECH'),pause,soundsc(y,Fss),pause
      
      subplot(211)
     	plot(tt,x);
		ylabel('AMPLITUDE'),grid
		title ('THE ORIGINAL SPEECH'),pause,soundsc(x,Fss),pause
      subplot(212)
     	plot(tt,y,'r');, xlabel('SECS')
		ylabel('AMPLITUDE'),grid
		title ('THE ALL-PASS(2nd-ORDER)FILTERED SPEECH'),pause,soundsc(y,Fss),pause
      subplot
      
      close all
      subplot(211)
      specgram(x,300,Fss)
		xlabel('TIME IN SECS')
		ylabel('FREQ IN HZ')
      title(' spectrogram OF ORIGINAL SPEECH '),soundsc(x,Fss), pause
      subplot(212)
      specgram(y,300,Fss)
		xlabel('TIME IN SECS')
		ylabel('FREQ IN HZ')
      title(' spectrogram OF ALL-PASS(2nd-ORDER)FILTERED SPEECH '),soundsc(y,Fss), pause
		subplot

      
      
      
      
      
      
     % 100th-order APF
    	plot(tt,x);, xlabel('SECS')
		ylabel('AMPLITUDE'),grid
		title ('THE ORIGINAL SPEECH'),pause,soundsc(x,Fss),pause

        
	 b=[1 zeros(1,98) .95];
	a=b(100:-1:1);
    [H,W] = freqz(a,b,10000,'whole');
    H=(H(1:5000));
    f=linspace(0,Fss/2,5000);
    subplot(211)
    plot(f,round(abs(H))),ylabel('LINEAR') % I don't know why I need round - it should be a straight line
	 grid, title('MAGNITUDE RESPONSE OF 100th-ORDER ALL-PASS FILTER')	
    subplot(212)
    HH=unwrap(angle(H))*180/pi; % angle in degrees
    plot(f,HH), xlabel('FREQ IN HZ'),ylabel('DEGREES') 
    grid, title('PHASE RESPONSE OF 100th-ORDER ALL-PASS FILTER'),pause
    subplot
    
    
    y=filter(a,b,x);
    	plot(tt,y,'r');, xlabel('SECS')
		ylabel('AMPLITUDE'),grid
		title ('THE ALL-PASS (100th-ORDER) FILTERED SPEECH'),pause,soundsc(y,Fss),pause

      subplot(211)
     	plot(tt,x);
		ylabel('AMPLITUDE'),grid
		title ('THE ORIGINAL SPEECH'),pause,soundsc(x,Fss),pause
      subplot(212)
     	plot(tt,y,'r');, xlabel('SECS')
		ylabel('AMPLITUDE'),grid
		title ('THE ALL-PASS(100th-ORDER)FILTERED SPEECH'),pause,soundsc(y,Fss),pause
   	close all
    
      subplot(211)
      specgram(x,300,Fss)
		xlabel('TIME IN SECS')
		ylabel('FREQ IN HZ')
      title(' spectrogram OF ORIGINAL SPEECH '),pause,soundsc(x,Fss),pause
      subplot(212)
      specgram(y,300,Fss)
		xlabel('TIME IN SECS')
		ylabel('FREQ IN HZ')
      title(' spectrogram OF ALL-PASS(100th-ORDER)FILTERED SPEECH '),soundsc(y,Fss),pause
		subplot
    
    
    
    
     
  elseif flag40==10   
     
     
     
   break
   
  else
   
   return
   
   end
											end % GOES WITH WHILE 40==40


     elseif flag9==7; 		% jump to main menu
      break
      
           
      
      
   elseif flag9==8;		% end program
	close all
	   return
       end					% goes with 'if flag9==1'
       
       
       
       
       
       
       
       
    end % goes with while 9==9 
    
% -------------------------------------------------------------------------------------
    
    
    
    














function demo13
% ----------------------------------------------------------------------------------
%         DEMO 13 : DSP SOUNDEFFECTS
% ----------------------------------------------------------------------------------





							while 60==60 %
                        
                        
                        
                        
                        
C5={'Frequency shift a speech signal'...
    'RETURN TO THE MAIN MENU'};

 flag5=menu('DEMO13: DSP SOUNDEFFECTS        ' ,C5);
 
 if flag5==1
    
    
%--------------------------------------------------------------------------
%
%
disp(' THIS PROGRAM PRODUCES SOME SOUND EFFECTS FOR SPEECH. THE SPEECH')
disp(' IS BANLIMITED TO 4kHZ')
disp('  ')
disp(' The first experiment simply shows what happens when you reflect the')
disp('spectrum in the passband about 2kHz')
disp('  ')
disp(' The second experiment shifts both the positive and negative spectrra of ')
disp('speech by F0=500 Hz using a complex LPF. It then shifts the spectrum by a time-varying ')
disp('amount')
disp('  ')
disp(' The third experiment shifts both the positive and negative spectrra of speech (in a sinusoidal manner)')
disp('using a complex LPF')
% -------------------------------------------------------------------------
%
%
%
close all
pause
disp( '---------------------------------------------------------------------')
disp(' EXPERIMENT ONE: Normal Speech Multiplied (-1)^n')
disp('This is just the same as multiplying by cos(n theta) where')
disp('theta = pi. And so the spectrum is shifted by pi. This means')
disp('that inside the passband the spectrum is reversed.')
disp('----------------------------------------------------------------------')
pause
clc
clear all


% Double-sided spectrum of a speech signal

load speech;				% loads variable speech, Fs=8000Hz, 8bits PCM, 2.5 secs
xx=speech/max(speech);
Fss=8000;		
NN=length(xx);
BB=NN;
tt=[0:1:NN-1]/Fss;
plot(tt,xx);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH'),pause,soundsc(xx,Fss),pause
 XX=(1/Fss)*fft(xx);		
 XX=abs(XX);
 XX1=[XX(NN/2:-1:1) XX(1:NN/2)];
       FF=linspace(-Fss/2,Fss/2,length(XX1));
      plot(FF/1000,XX1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('DOUBLE-SIDED MAGN. SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, 
      text(-3.5,0.0358,'(Non-periodic signals have continuous spectra)','fontsize',14,'color','red')
		pause
      hold off
      
      
% Multiply the speech xx(n) by (-1)^n and examine the resulting spectrum

ttt=[0:1:NN-1];
code=(-1).^ttt;
xxx=xx.*code;
plot(tt,xxx);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('ORIGINAL SPEECH x(n) MULT. BY (-1)^n'),pause,soundsc(xxx,Fss),pause
 XXX=(1/Fss)*fft(xxx);		
 XXX=abs(XXX);
 XXX1=[XXX(NN/2:-1:1) XXX(1:NN/2)];
       FFF=linspace(-Fss/2,Fss/2,length(XXX1));
      plot(FFF/1000,XXX1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('DOUBLE-SIDED MAGN. SPECTRUM FOR ORIGINAL SPEECH x(n) MULT. BY (-1)^n')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, 
      text(-3.5,0.0358,'(HOW HAS SPECTRUM CHANGED?)','fontsize',14,'color','red')
		pause
      hold off

subplot(211)
plot(FF/1000,XX1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title(' ORIGINAL SPEECH SPECTRUM')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, 
 subplot(212)
 plot(FFF/1000,XXX1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('SPECTRUM FOR ORIGINAL SPEECH x(n) MULT. BY (-1)^n')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause
      
  subplot(211),text(-3.5,0.0358,'LISTEN','fontsize',18,'color','blue'),
    soundsc(xx,Fss),pause,
    subplot(212),text(-3.5,0.0358,'LISTEN','fontsize',18,'color','red'),
    soundsc(xxx,Fss),pause,hold off
 close all    
subplot(211)
specgram(xx,300,8000)
title('spectrogram OF ORIGINAL SPEECH x(n)')
ylabel('Frequency in Hz')
xlabel('Time in seconds'),pause
subplot(212)
specgram(xxx,300,8000)
title('spectrogram OF ORIGINAL SPEECH SPEECH x(n) MULT. BY (-1)^n')
ylabel('Frequency in Hz')
xlabel('Time in seconds'),pause



subplot(211),text(1,3000,'LISTEN','fontsize',18,'color','blue'),
    soundsc(xx,Fss),pause,
    subplot(212),text(1,500,'LISTEN','fontsize',18,'color','red'),
    soundsc(xxx,Fss),pause,hold off
 close all    


 % --------------------------------------------------
%  EXPERIMENT TWO: Shift the speech spectrum (originally from 0 to Fmax)
%  by F0 Hz (now from F0 to Fmax+F0). Also then shifts the spectrum by a varying amount of
%  frequency.
%
% 
% --------------------------------------------------------- 


close all
clc
disp('')
disp('')
disp('              EXPERIMENT TWO: USING A SINGLE COMPLEX FILTER (WITH 1001 COEFFS)  ')
disp('              TO FREQUENCY SHIFT THE SPECTRUM BY 500HZ. THEN THE SPECTRUM IS SHIFTED BY')
disp('              A TIME-VARYING AMOUNT')
disp('')
disp('')
pause





load('speech'),Fs=8000;y=speech'; %sampling rate 8000
y=y/max(y);
x=upsample(y,2); % adds one zero between each sample
Fs=2*Fs;
n=[0:1:length(x)-1]';

% Design complex LPF with cutoff of Fc=4kHz
% Let the ideal LPF have 2M+1 coefficients (ie from -M to +M)
M=500;
p=[-M:1:+M];
h2=4*(exp((j*pi/4)*p)).*(sinc(p/4));
c=exp((j*pi/16)*n);


% Now filter x(n) to get z(n)

z=filter (h2,1,x);
MMM=length(z);
m=[0:1:MMM-1]';

% Now multiply z(n) by a complex exponential c(n)
z1=z.*c;

% Now take twice the real part of z1(n) to get y(n)

y=2*real(z1);  % Final frequency shifted speech

	
NN=length(y);
tt=[0:1:NN-1]/Fs;
plot(tt,y);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH WITH SHIFTED SPECTRUM'),pause,soundsc(y,Fs),pause
 XX=(1/Fs)*fft(y);		
 XX=abs(XX);
 XX1=[XX(NN/2:-1:1)' XX(1:NN/2)'];
       FF=linspace(-Fs/2,Fs/2,length(XX1));
      plot(FF/1000,XX1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('DOUBLE-SIDED MAGN. SPECTRUM FOR FREQ-SHIFTED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.03],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      text(-6,.3,'SPECTRUM SHIFTED BY 500 HZ','fontsize',18,'color','red'),
      pause, 
       hold off


       subplot(211)
WW=(1/8000)*fft(xx);		
 WW=abs(WW);
 WW1=[WW(BB/2:-1:1) WW(1:BB/2)];
       FF=linspace(-Fss/2,Fss/2,length(WW1));
      plot(FF/1000,WW1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('DOUBLE-SIDED MAGN. SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, 
      
 
      subplot(212)
   FF=linspace(-Fs/2,Fs/2,length(XX1));
      plot(FF/1000,XX1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('DOUBLE-SIDED MAGN. SPECTRUM FOR FREQ-SHIFTED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.03],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      text(-6,.3,'SPECTRUM SHIFTED BY 500 HZ','fontsize',18,'color','red'),
      pause, 
       hold off
      
  
       
       
     subplot(211),text(-3.5,0.0358,'LISTEN','fontsize',18,'color','blue'),
    soundsc(xx,8000),pause,
    subplot(212),text(-6.0,.2,'LISTEN','fontsize',18,'color','red'),
    soundsc(y,16000),pause,subplot
      

close all    
subplot(211)
specgram(xx,300,8000)
title('spectrogram OF ORIGINAL SPEECH x(n)')
ylabel('Frequency in Hz')
xlabel('Time in seconds'),pause
subplot(212)
specgram(y,300,16000)
title('spectrogram OF ORIGINAL SPEECH SPEECH FREQUENCY-SHIFTED')
ylabel('Frequency in Hz')
xlabel('Time in seconds'),pause



subplot(211),text(1,3000,'LISTEN','fontsize',18,'color','blue'),
    soundsc(xx,8000),pause,
    subplot(212),text(1,7000,'LISTEN','fontsize',18,'color','red'),
    soundsc(y,16000),pause,hold off
 close all   

 
 
 
 
% Now vary the amount of frequency shift over time



c=exp((j*pi/100)*n.^(1.3));


% Now filter x(n) to get z(n)

z=filter (h2,1,x);
MMM=length(z);
m=[0:1:MMM-1]';

% Now multiply z(n) by a complex exponential c(n)
z1=z.*c;

% Now take twice the real part of z1(n) to get y(n)

y=2*real(z1);  % Final frequency shifted speech

	
NN=length(y);
tt=[0:1:NN-1]/Fs;
plot(tt,y);, xlabel('SECS')
ylabel('AMPLITUDE'),grid
title ('2.5 SECONDS OF 4KHZ BANDLIMITED SPEECH WITH SHIFTED SPECTRUM'),pause,soundsc(y,Fs),pause
 XX=(1/Fs)*fft(y);		
 XX=abs(XX);
 XX1=[XX(NN/2:-1:1)' XX(1:NN/2)'];
       FF=linspace(-Fs/2,Fs/2,length(XX1));
     plot(FF/1000,XX1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
     title('DOUBLE-SIDED MAGN. SPECTRUM FOR FREQ-SHIFTED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.03],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      text(-6,.3,'SPECTRUM SHIFTED BY 500 HZ','fontsize',18,'color','red'),
      pause, 
       hold off


       subplot(211)
WW=(1/8000)*fft(xx);		
 WW=abs(WW);
 WW1=[WW(BB/2:-1:1) WW(1:BB/2)];
       FF=linspace(-Fss/2,Fss/2,length(WW1));
      plot(FF/1000,WW1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('DOUBLE-SIDED MAGN. SPECTRUM FOR 4KHZ BANDLIMITED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.04],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      pause, 
      
 
      subplot(212)
   FF=linspace(-Fs/2,Fs/2,length(XX1));
      plot(FF/1000,XX1),xlabel('FREQ IN kHZ'),ylabel('AMPLITUDE')
      title('DOUBLE-SIDED MAGN. SPECTRUM FOR FREQ-SHIFTED SPEECH SIGNAL')
      hold
      plot([0 0],[0 0.03],'k','LineWidth',2),grid
      plot([-4 4],[0 0],'k','LineWidth',2)
      text(-7.5,.1,'SPECTRUM SHIFTED BY A VARYING AMOUNT','fontsize',14,'color','red'),
      pause, 
       hold off
      
  
       
       
     subplot(211),text(-3.5,0.0358,'LISTEN','fontsize',18,'color','blue'),
    soundsc(xx,8000),pause,
    subplot(212),text(-6.0,.15,'LISTEN','fontsize',18,'color','red'),
    soundsc(y,16000),pause,subplot
      

close all    
subplot(211)
specgram(xx,300,8000)
title('spectrogram OF ORIGINAL SPEECH x(n)')
ylabel('Frequency in Hz')
xlabel('Time in seconds'),pause
subplot(212)
specgram(y,300,16000)
title('spectrogram OF ORIGINAL SPEECH SPEECH FREQUENCY-SHIFTED')
ylabel('Frequency in Hz')
xlabel('Time in seconds'),pause



subplot(211),text(1,3000,'LISTEN','fontsize',18,'color','blue'),
    soundsc(xx,8000),pause,
    subplot(212),text(1,7000,'LISTEN','fontsize',18,'color','red'),
    soundsc(y,16000),pause,hold off
 close all   

 
 



% -------------------------------------------------------------------------
%
disp(' ')
disp(' EXPERIMENT THREE: Shift the speech spectrum (originally from 0 to Fmax)')
disp(' by F0 Hz (now from F0 to Fmax+F0) but in a sinusoidal fashion')
disp(' ')
 
% -------------------------------------------------------------------------- 

close all
clc

%  VARIABLE F0 (sinusoid)
%
load speech;				% loads variable speech, Fs=8000Hz, 8bits PCM, 2.5 secs
x=speech/max(speech);
n=[0:1:length(x)-1];
T=length(x)/8000;  % Total time of song
P=1.5;  % Number of wahwah periods per second
Pt=P*T; % Total number of wahwah periods
Fc=100;   % Wahwah centre freq in Hz
Fd=20;   % Freq deviation in Hz from Fc - ie Fc+/-Fd 
theta=(Pt*2*pi/length(x));


F0=Fc+Fd*sin(n*theta);

s=sin(2*pi*F0.*n/8000);
c=cos(2*pi*F0.*n/8000);
x1=imag(hilbert(x));  % -90 degree phase shift on x
x2=x1.*s;x3=x.*c;
y=x3-x2;
specgram(y,400,8000);
title('spectrogram OF ORIGINAL SPEECH FREQUENCY-SHIFTED BY SINUSOID')
ylabel('Frequency in Hz')
xlabel('Time in seconds')
pause
soundsc(y,8000),pause


   
        
     
  
    

   elseif flag5==2    
    break % Continue with rest of program
 
 end
 


 
 
 
  								end % goes with 'While 60==60'




%---------------------------------------------------------------------------------------








 
 
 
    
    
    
    
    
    
% -------------------------------------------------------------------------------------
% 				BEGINING OF FUNCTIONS THAT ARE USED FOR QUANTISING A SIGNAL   
% -------------------------------------------------------------------------------------


    
%===========================================================================    
% Quantisation Subroutine

    function [out] = dquantize(x,no_bits,flag)

% DQUANTIZE .... Maps an analog sequence sequence into a quantized sequence.
%
%	DQUANTIZE(X,N) Takes the analog input sequence (analog within the limits
%		of machine accuracy) and quantizes each element of X using an 
%		N-bit, mid-riser type uniform quantizer. Number of quantization 
%		levels is 2^N, where 1 <= N <= 8.
%		The quantizer range is restricted to the interval [-1, 1].
%
%		If non-uniform quantization is desired, the input sequence has 
%		to be first companded by applying the M-function MU_LAW.
%		For example the sequence XCQ generated by using 
%		DQUANTIZE(MU_LAW(X,255),8) will be the MU-LAW companded
%		(with MU=255) 256-level quantized sequence.
%
%	DQUANTIZE(X,N,'scale') overrides the default input magnitude range of
%		[-1, 1] and adjusts quantizer range to [-K, K], where 
%		K = max( |x(t)| ).
%
%	DQUANTIZE(X,N,'no_scale') is equivalent to QUANTIZE(X,N).
%		
%	See also MU_LAW, QUANT_EF and QUANT_CH.
%===========================================================================
% Modifications history:
% ----------------------
%	o   Added 'scaling' input parameter. 06.06.91 MZ
%	o   Changed input N to "quantization levels". 06.17.91 MZ
%	o   Changed input N to "bits/sample". 06.19.91 MZ
%	o   Added "checking"  11.30.1992 MZ
%	o	Tested (and modified) under MATLAB 4.0/4.1 08.16.1993 MZ
%===========================================================================

global START_OK;
global BELL;
global WARNING;

check;

if ((nargin ~= 3) & (nargin ~= 2))
   error(eval('eval(BELL),eval(WARNING),help quantize'));
   return;
end   
no_qs = 2^no_bits;
if ( (no_bits > 8) | (no_qs < 1) | (no_bits ~= fix(no_bits)) )
   error('Number of bits/sample must be an integer between 1 and 8.');
end

%---------------------------------------------------------------------------
%	Input parameter set-up
%---------------------------------------------------------------------------

scale_flag_default = 'no_scale';

if (nargin == 2)
   scale_flag = scale_flag_default; 
elseif (nargin == 3)
   scale_flag = flag; 
end

%---------------------------------------------------------------------------
%	To prevent overload distortion check for overload conditions
%	and normalize if necessary: |x(n)| <= 1.
%---------------------------------------------------------------------------
if strcmp(scale_flag, 'scale')
   scale_factor = max( abs(max(x)), abs(min(x)) ); 
   in = x/max(abs(max(x)),abs(min(x))); 
elseif strcmp(scale_flag, 'no_scale')
   scale_factor = 1;
   in = x;
else
   error('Unknown scaling option.');
end

%---------------------------------------------------------------------------
%	Set up output vector, quantization step size, QSTEP, and
%	quantization range values RANGE, and quantized values Q,
%	for a mid-riser type uniform quantization.
%---------------------------------------------------------------------------

qstep = 2/no_qs;

for ii = 1:no_qs
   range(ii) = -1 + (ii-1)*qstep;
end

%---------------------------------------------------------------------------
%	Now check for x(n) values with respect to RANGE parameters and
%	assign appropriate quantized values, such that if
%	(RANGE(i) <= x(n) < RANGE(i+1)) then  x(n) --> xq(n) = Q(i).
%---------------------------------------------------------------------------

out = zeros(size(in));
for ii = no_qs:(-1):1
    out = out + (in>=range(ii));
end

out = out - 1;
out = (out) * qstep + (-1 + qstep/2);
out = scale_factor * out;

if strcmp(scale_flag, 'no_scale')
   out = limiter(out,(-1+qstep/2),(1-qstep/2));
end



% ---------------------------------------------------------------------

function check

% CHECK .........       Checks whether the global variables have been
%                   initialized or not.   If they are not set then
%                   will issue the initialization command "start"
%                   allowing the user to enter the experiment number
%                   before returning the control to the calling function.

%       
%===========================================================================
% Modifications history:
% ----------------------
%       o       Tested (and modified) under MATLAB 4.0/4.1 08.16.1993 MZ
%===========================================================================

%-----------------------------------------
%  if "start" has been called before 
%    START_OK = 1,
%  else 
%    START_OK = 0
%-----------------------------------------

global START_OK

if ( exist('START_OK') )

  return;

else

eval('fprintf(''\007\007\007'')');

disp(' ');
disp('********************************************************************');
disp('*                                                                  *');
disp('*   Please initiliaze global variables first.  You will now be     *');
disp('*   be prompted to enter the experiment number.   Enter the        *');
disp('*   experiment number and these variables will be set for you.     *');
disp('*                                                                  *');
disp('*   Please read page 11 in the User''s Manual on how to initialize  *');
disp('*   the simulation environment.                                    *');
disp('*                                                                  *');
disp('********************************************************************');
disp(' ');

  start;

end



% --------------------------------------------------------------------------
function out = limiter(in,xmin,xmax)

% LIMITER .....	Limiting function
%
%	[Y] = LIMITER(X,A,B) generates the output sequence Y from X such that:
%
%			      ( A,	if      X <= A; 
%			Y   = < X,	if  A < X <= B;
%			      ( B,	if  B < X.

%===========================================================================
% Modifications history:
% ----------------------
%	o	Tested (and modified) under MATLAB 4.0/4.1 08.16.1993 MZ
%===========================================================================

out = in;
nmin = length(out(out<xmin));
nmax = length(out(out>xmax));
out(out<xmin) = xmin*ones(1,nmin);
out(out>xmax) = xmax*ones(1,nmax);


%===========================================================================  


    
  
% -------------------------------------------------------------------------------------
% 			END OF FUNCTIONS THAT ARE USED FOR QUANTISING A SIGNAL   
% -------------------------------------------------------------------------------------


    

       


 
 
 
 
 
 
 
 
 
 
    
    
    
 
 
 
 
 
 


   


    
    
    
    
     












% ===========================================================================
%												 COMMENTS
% ==========================================================================



% Change all double-sided plots to give 0.5 mag for sine spectra.
% I do not think that a proper smoothing filter is used here.





% Autocorelation functions
% Show how to see a sinusoid in noise by examining the fft. Increase the value
% of N to increase the SNR of display.


% Show sampling of bandpass signals
% Signals at five stages in DSP chain
% Beat freqs, and swept freq.
% Chirp
% Pulse and triangular transient
% Add increasing/decreasing pitch effect
% Masking effec/loudness of tones
% Add periodic chirp and change phase - ear sensitive to time reversal.








