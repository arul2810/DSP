%           Program dtruncate_an_impulse_response.m
%    ---------------------------------------------
%         TRUNCATES FILTER IMPULSE RESPONSE AND PLOTS NEW TRANSFER FUNCTION
%     -------------------------------------------
%  
% This program designs an ideal lowpass digital filter based on a sampling frequency
% of Fs = (1/T) = 8000 Hz and a cutoff of Fc Hz. We can easily show that in order
% to realise this digital filter we must have a filter impulse response of:
%
%                         h(n)=sin(nwc)/(n*pi),   -infinity < n< infinity
%
% where 0<wc<pi is the normalised (rad/sec) digital cutoff frequency and we
% can say:
%
%                          wc=(Fc/Fs)*2*pi.
%
% In order to realise the filter we truncate h(n) to 2N+1 coeffs to get
% h1(n) where:
%                                  ( h(n), -N =< n <= N
%                          h1(n) = (
%                                  ( 0, otherwise
%
% and then delay h1(n) by N samples to get a causal representation h2(n):
%
%                          h2(n)=h1(n-N).
%
% We then compare the frequency response H(exp(jwT)) with H2(exp(jwT)), where
% Fs=1/T, and:
%
%    H(exp(jwT)=sum (over n) h(n)exp(jnwT) and H2(exp(jwT)=sum (over n) h2(n)exp(jnwT)
%
% where w=2.pi.f, and we evaluate and compare moduli of both transfer functions for 0=<f<=Fs/2.
%
%
%
close all,clear all,clc


help dtruncate_an_impulse_response,pause

% -----------------------------------------------------------------------
% IDEAL LOW PASS FILTER WITH CUTOFF wc rad/s
% Assume sampling frequency of Fs=8000Hz, and cutoff Fc Hz.
% ------------------------------------------------------------------------

Fs=8000;
Fc = input('Input the desired cutoff frequency 0<Fc<4000 in Hz (e.g.,1000?):  ');
N = input('Input value for N where we have (2N+1) coefficients in impulse response (N<500) (e.g.,10?):  ');

wc=(Fc/Fs)*2*pi;% normalised digital cutoff frequency
n=[-1000:1:1000]; %almost infinite number of taps
h=sin(n*wc)./(n*pi); 
h(1001)=wc/pi;% due to inability to calculate sin(0)/0
n2=[-N:1:N]; % set to 2N+1 taps
h2=sin(n2*wc)./(n2*pi); 
h2(N+1)=wc/pi;% due to inability to calculate sin(0)/0
M=2001-(2*N+1);% zero pad h2 from 2N+1 to 2001 samples for plotting, so we have same number of sample points
h2plot=[h2 zeros(1,M)];


% -----------------------------------------------------------------------
%       PLOT IMPULSE RESPONSES
% ------------------------------------------------------------------------
figure(1)
stem(n,h,'filled','b'),grid
xlabel('COEFFICIENT n')
title ('FILTER IMPULSE RESPONSE h(n) WITH 2001 COEFFS-ALMOST IDEAL'),pause
figure(2)
stem(n2,h2,'filled','r'),grid
xlabel('COEFFICIENT n')
title ('TRUNCATED FILTER IMPULSE RESPONSE h(n) WITH 2N+1 COEFFS')
c=axis;
xx=c(1)+0.75*(c(2)-c(1));
yy=c(3)+0.75*(c(4)-c(3));
text(xx,yy,['N=', num2str(N)],'fontsize',12,'color','red')
pause

figure(3)
n3=[0:1:2*N]; % set to 2N+1 taps
stem(n3,h2,'filled','r'),grid
xlabel('COEFFICIENT n')
title ('TRUNCATED/DELAYED FILTER IMPULSE RESPONSE h(n) WITH 2N+1 COEFFS')
c=axis;
xx=c(1)+0.75*(c(2)-c(1));
yy=c(3)+0.75*(c(4)-c(3));
text(xx,yy,['N=', num2str(N)],'fontsize',12,'color','red')
pause



% -----------------------------------------------------------------------
%       EVALUATE AND PLOT FREQUENCY RESPONSES
% ------------------------------------------------------------------------

    
    % SET 2001 COEFFS, ALMOST IDEAL IMPULSE RESPONSE
    % Filter response with N=1000 (i.e. 2001 coefficients)
    H=abs(fft(h));  
    % Hideal=20*log10(abs(Hideal));
    NH=length(H);
    Fplot=linspace(0,Fs/2,NH/2);
    figure(4)
    plot(Fplot,H(1:NH/2),'b'),xlabel('FREQ IN HZ - where Fs/2=4kHz'),ylabel('LINEAR AMPLITUDE RESPONSE')
    title('FILTER TRANSFER FUNCTION FROM IMPULSE RESPONSE WITH 2N+1 COEFFS')
    grid,hold
        
    % SET COEFFIENTS TO 2N+1 AND PLOT RESPONSE
    H2=abs(fft(h2plot));  
    % Hideal=20*log10(abs(Hideal));
    NH=length(H2);
    Fplot=linspace(0,Fs/2,NH/2);
    plot(Fplot,H2(1:NH/2),'r'),hold off
    legend('BLUE for 2001 COEFFS-ALMOST IDEAL','RED FOR (2N+1) COEFFS')
    text(1200,0.7,['N=', num2str(N)],'fontsize',12,'color','red')
    pause
    
    % Repeat in dBs
    
    figure(5)
    plot(Fplot,20*log10(H(1:NH/2)),'b'),xlabel('FREQ IN HZ - where Fs/2=4kHz'),ylabel('dB AMPLITUDE RESPONSE')
    title('FILTER TRANSFER FUNCTION FROM IMPULSE RESPONSE WITH 2N+1 COEFFS')
    grid,hold
    plot(Fplot,20*log10(H2(1:NH/2)),'r'),hold off
    legend('BLUE for 2001 COEFFS-ALMOST IDEAL','RED FOR (2N+1) COEFFS')
    c=axis;
    xx=c(1)+0.75*(c(2)-c(1));
    yy=c(3)+0.75*(c(4)-c(3));
    text(xx,yy,['N=', num2str(N)],'fontsize',12,'color','red')
    
    
    
    
    
    
    
    
    
    
    
    
    


