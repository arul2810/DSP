

%--------------------------------------------------------------------------------------------------------
% Program RC_Filter_Bilinear.m
%
%
% This program 'RC_Filter_Bilinear.m' models a simple first-order RC filter
% in the time domain using the bilinear transformation. We compare the step
% response of both the analogue and the discrete-time systems for differing
% sampling rates (T) for the digital filter
%
%
% The analogue LPF is Ha(jw)=1/(1+jwRC). We use the bilinear transform
% to get the equivalent digital filter H(z) below.
%
%  H(z) = (a0+a1z-1)/(1+b1z-1) where a0=(T/T+2RC), a1=(T/T+2RC),
%  and b1=(T-2RC)/(T+2RC)
%
%  For analogue filter the step response is ya(t)=1-exp(-t/RC).
%
%  For the digital filter the step response is y(n)=a0x(n)+a1x(n-1)-b1y(n-1)
%  where x(n)=u(nT) is a step input u(t) sampled every T secs.
%
%
%
% We set R=C=1 for this example
%
%           _________
%          |         |       
%      ----|  R=1    |----------------------
%          |_________|            |
%                                 |
%                                -----                         
%      x(t)=u(t)                 ----- C=1   ya(t)
%                                  |
%                                  |
%     ---------------------------------------                             
%
%
%   For x(n) = x(nT) we want the digital filter output y(n)=ya(nT), as
%   closely as possible where:
%
%   y(n) = a0x(n) + a1x(n-1) - b1y(n-1)
%
%
% HIT CR TO CONTINUE
%----------------------------------------------------------------------------------------------------------
%
%


clc
clear			% clears all variables
close all		% closes all windows
help RC_Filter_Bilinear.m, pause

R=1;C=1;
T1=5; % look over range approx 0 to 5 secs

%---------------------------------------------------------------
T=.5; % set the DSP sampling period
Ts=T/20; %set the sampling interval to plot the continuous time response
td=[0:T:T1];  % for ploting discrete-time output;
tc=[0:Ts:T1];  % for ploting continuous-time output;
x=ones(1,length(td));
a0=(T/(T+2*R*C));a1=(T/(T+2*R*C)); b1=(T-2*R*C)/(T+2*R*C); A=[a0 a1]; B=[1 b1];yd=filter(A,B,x);
figure('units','normalized','outerposition',[0 0 1 1])
yc=1-exp(-tc/R*C); figure(1)
plot(tc,yc,'k'),grid,
xlabel('TIME IN SECS'),title('STEP RESPONSE FOR R-C ANALOGUE LPF AND DIGITAL EQUIVALENT(T=0.5)')
pause,hold 
stem(td,yd,'filled','r'),
legend('RC Filter Response','Digital Filter Response (T=0.5s)','location','NorthWest'),pause

%---------------------------------------------------------------
T=.4; % set the DSP sampling period
Ts=T/20; %set the sampling interval to plot the continuous time response
td=[0:T:T1];  % for ploting discrete-time output;
tc=[0:Ts:T1];  % for ploting continuous-time output;
x=ones(1,length(td));
a0=(T/(T+2*R*C));a1=(T/(T+2*R*C)); b1=(T-2*R*C)/(T+2*R*C); A=[a0 a1]; B=[1 b1];yd=filter(A,B,x);
figure('units','normalized','outerposition',[0 0 1 1])
yc=1-exp(-tc/R*C); figure(2)
plot(tc,yc,'k'),grid,
xlabel('TIME IN SECS'),title('STEP RESPONSE FOR R-C ANALOGUE LPF AND DIGITAL EQUIVALENT (T=0.4)')
pause,hold 
stem(td,yd,'filled','r'),
legend('RC Filter Response','Digital Filter Response (T=0.4s)','location','NorthWest'),pause

%---------------------------------------------------------------
T=.3; % set the DSP sampling period
Ts=T/20; %set the sampling interval to plot the continuous time response
td=[0:T:T1];  % for ploting discrete-time output;
tc=[0:Ts:T1];  % for ploting continuous-time output;
x=ones(1,length(td));
a0=(T/(T+2*R*C));a1=(T/(T+2*R*C)); b1=(T-2*R*C)/(T+2*R*C); A=[a0 a1]; B=[1 b1];yd=filter(A,B,x);
figure('units','normalized','outerposition',[0 0 1 1])
yc=1-exp(-tc/R*C); figure(3)
plot(tc,yc,'k'),grid,
xlabel('TIME IN SECS'),title('STEP RESPONSE FOR R-C ANALOGUE LPF AND DIGITAL EQUIVALENT (T=0.3)')
pause,hold 
stem(td,yd,'filled','r'),
legend('RC Filter Response','Digital Filter Response (T=0.3s)','location','NorthWest'),pause


%---------------------------------------------------------------
T=.2; % set the DSP sampling period
Ts=T/20; %set the sampling interval to plot the continuous time response
td=[0:T:T1];  % for ploting discrete-time output;
tc=[0:Ts:T1];  % for ploting continuous-time output;
x=ones(1,length(td));
a0=(T/(T+2*R*C));a1=(T/(T+2*R*C)); b1=(T-2*R*C)/(T+2*R*C); A=[a0 a1]; B=[1 b1];yd=filter(A,B,x);
figure('units','normalized','outerposition',[0 0 1 1])
yc=1-exp(-tc/R*C); figure(4)
plot(tc,yc,'k'),grid,
xlabel('TIME IN SECS'),title('STEP RESPONSE FOR R-C ANALOGUE LPF AND DIGITAL EQUIVALENT (T=0.2)')
pause,hold 
stem(td,yd,'filled','r'),
legend('RC Filter Response','Digital Filter Response (T=0.2s)','location','NorthWest'),pause

%---------------------------------------------------------------
T=.1; % set the DSP sampling period
Ts=T/20; %set the sampling interval to plot the continuous time response
td=[0:T:T1];  % for ploting discrete-time output;
tc=[0:Ts:T1];  % for ploting continuous-time output;
x=ones(1,length(td));
a0=(T/(T+2*R*C));a1=(T/(T+2*R*C)); b1=(T-2*R*C)/(T+2*R*C); A=[a0 a1]; B=[1 b1];yd=filter(A,B,x);
figure('units','normalized','outerposition',[0 0 1 1])
yc=1-exp(-tc/R*C); figure(5)
plot(tc,yc,'k'),grid,
xlabel('TIME IN SECS'),title('STEP RESPONSE FOR R-C ANALOGUE LPF AND DIGITAL EQUIVALENT (T=0.1)')
pause,hold 
stem(td,yd,'filled','r'),
legend('RC Filter Response','Digital Filter Response (T=0.1s)','location','NorthWest'),pause

%---------------------------------------------------------------
T=.05; % set the DSP sampling period
Ts=T/20; %set the sampling interval to plot the continuous time response
td=[0:T:T1];  % for ploting discrete-time output;
tc=[0:Ts:T1];  % for ploting continuous-time output;
x=ones(1,length(td));
a0=(T/(T+2*R*C));a1=(T/(T+2*R*C)); b1=(T-2*R*C)/(T+2*R*C); A=[a0 a1]; B=[1 b1];yd=filter(A,B,x);
figure('units','normalized','outerposition',[0 0 1 1])
yc=1-exp(-tc/R*C); figure(6)
plot(tc,yc,'k'),grid,
xlabel('TIME IN SECS'),title('STEP RESPONSE FOR R-C ANALOGUE LPF AND DIGITAL EQUIVALENT (T=0.05)')
pause,hold 
stem(td,yd,'filled','r'),
legend('RC Filter Response','Digital Filter Response (T=0.05s)','location','NorthWest'),pause

%---------------------------------------------------------------
T=.01; % set the DSP sampling period
Ts=T/20; %set the sampling interval to plot the continuous time response
td=[0:T:T1];  % for ploting discrete-time output;
tc=[0:Ts:T1];  % for ploting continuous-time output;
x=ones(1,length(td));
a0=(T/(T+2*R*C));a1=(T/(T+2*R*C)); b1=(T-2*R*C)/(T+2*R*C); A=[a0 a1]; B=[1 b1];yd=filter(A,B,x);
figure('units','normalized','outerposition',[0 0 1 1])
yc=1-exp(-tc/R*C); figure(7)
plot(tc,yc,'k'),grid,
xlabel('TIME IN SECS'),title('STEP RESPONSE FOR R-C ANALOGUE LPF AND DIGITAL EQUIVALENT (T=0.01)')
pause,hold 
stem(td,yd,'filled','r'),
legend('RC Filter Response','Digital Filter Response (T=0.01s)','location','NorthWest'),pause





