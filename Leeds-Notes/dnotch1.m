

%--------------------------------------------------------------------------------------------------------
%
% This program dnotch1 designs a simple second-order IIR DSP notch filter. The designer inputs three parameters:
% Fs = sampling frequency in Hz; Fc = notch centre frequency in Hz; the 3dB notch width in Hz; and the notch depth 
% in dB's. 
%
% NOTCH BANDWIDTH - adjusted by the radius of the poles
% NOTCH DEPTH - adjusted by the radius of both the poles and the zsros
%
% The prgram then returns the filter coeficients a0, a1, a2, b0, b1 and b2 (where a0 = b1 =1). If x(n) is the sampled 
% input and y(n) is the sampled output, then we implement the filter (direct form-I) as:
%
%                              y(n)=x(n)+a1*x(n-1)+a2*x(n-2)-b1*y(n-1)-b2*y(n-2)
%
% The direct form-II realisation uses the same coefficients, but requires two less memory locations:
%
%                               u(n)=x(n)-b1*u(n-1)-b2*u(n-2)
%                               y(n)=u(n)+a1*u(n-1)+a2*u(n-2)
%
%
%  NOTE THAT THIS PROGRAM IS DIFFERENT FROM dnotch.m WHICH DOES NOT ALLOW
%  YOU TO DEFINE THE NOTCH BANDWIDTH AND THE NOTCH DEPTH. IN dnotch THE
%  ZEROS ARE PLACED ON THE UNIT CIRCLE BUT IN THIS PROGRAM THEY ARE PLACED
%  JUST OFF THE UNIT CIRCLE SO AS TO ADJUST THE NOTCH DEPTH. IF THEY WERE
%  ON THE UNIT CIRCLE THE NOTCH DEPT WOULD BE INFINITY DB AS IN dnotch.m.
%
%----------------------------------------------------------------------------------------------------------
%
%


clc
clear			% clears all variables
close all		% closes all windows
help dnotch1, pause

Fs=input('Give the sampling frequency in Hz:  ');
Fc=input('Enter the notch filter centre frequency in Hz:  '); % sets the angle of the poles
Notch_bandwidth=input('Enter the notch bandwidth (3dB points) in Hz:  ');  % set by the radius of the poles
Notch_depth=input('Enter the notch depth in dB:  '); % sets the radius of both the poles and the zeros.

Pole_radius=1-(Notch_bandwidth/Fs)*pi;
Zero_radius=1-(1-Pole_radius)*10^(-Notch_depth/20);
a0=1;a1=-2*Zero_radius*cos(2*pi*Fc/Fs);a2=Zero_radius^2; % numerator coefficients
b0=1;b1=-2*Pole_radius*cos(2*pi*Fc/Fs);b2=Pole_radius^2; % numerator coefficients
A=[a0 a1 a2];B=[b0 b1 b2];

% Plot the frequency response of H(z)

figure(1)
freqz(A,B,10000,Fs)
title('FREQUENCY RESPONSE OF NOTCH FILTER')
pause

figure(2)
zplane(A,B)
title('POLES AND ZEROS OF NOTCH FILTER')
pause

disp(' ')
disp(' ')
disp('-------------------------------------------------------------------------------------')
disp(' ')
disp(' ')
disp('THE PARAMETERS OF THE SECOND-ORDER NOTCH FILTER H(z)')
disp(' ')
disp(' ')
disp('The sampling frequency, Fs in Hz:');
disp(Fs)
disp('The centre frequency of the notch, Fc in Hz:')
disp(Fc)
disp('The notch 3dB bandwidth in Hz:')
disp(Notch_bandwidth)
disp('The notch depth in dBs:')
disp(Notch_depth)
disp('The feedforward coefficients, a0, a1 and a2 (shown only to four decimal places):')
disp(A)
disp('The feedback coefficients, b0, b1 and b2 (shown only to four decimal places):')
disp(B)
disp(' ')
disp(' ')
disp('  y(n)=a0x(n)+a1*x(n-1)+a2*x(n-2)-b1*y(n-1)-b2*y(n-2) ')
disp(' ')
disp('                       or')
disp(' ')
disp('                 u(n)=x(n)-b1*u(n-1)-b2*u(n-2) ')
disp('                 y(n)=a0u(n)+a1*u(n-1)+a2*u(n-2) ')
disp(' ')
disp('-------------------------------------------------------------------------------------')
disp(' ')
disp(' ')


