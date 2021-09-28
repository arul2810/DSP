% This program will compare how the Levinson-Durbin algorithm
% can be used to speed up the inversion of a symmetric Toeplitz
% matrix by a considerable amount.
%
% First we take a (10000 by 10000) symmetric Toeplitz matrix R and invert it by using "inv" that takes
% no account of the special structure, and just uses the most general
% mathematical means to find inv(R).
%
% Then we take a (10000 by 10000) symmetric Toeplitz matrix R and invert it by using the
% Levinson-Durbin algorithm, that takes account of the Toeplitz symmetric
% nature of R to speed up inversion. This algorithm is used in LPC coding
% in  mobiles.
%
%
%

close all
clear all
clc

help levinson_demo

X=randn(1,10000);       
R=toeplitz(X);          % forms a 10000 by 100000 symmetric Toeplitz matrix

display ('HIT RETURN (TWICE) TO START INVERTING A 10000 by 10000 SYMMETRIC TOEPLITZ MATRIX R BY NORMAL MEANS')
display ('BE PATIENT - TAKES ABOUT 20 SECS!')
disp(' ')
pause
inv(R);                 % inverts X - takes about 20 secs
disp(' ')
display ('FINISHED INVERTING 10000x10000 SYMMETRIC TOEPLITZ MATRIX R BY NORMAL MEANS')
disp(' ')


Z=rand(1,4001);         % is used to produce first row of (10000 by 100000) autocorrelation matrix R
disp(' ')
display ('NOW HIT RETURN TO START INVERTING A 10000 by 10000 SYMMETRIC TOEPLITZ MATRIX R BY LEVINSON-DURBIN ALGORITHM ')
disp(' ')
pause
levinson (Z,4000);      % effectively inverts autocorrelation matrix R
display ('FINISHED INVERTING 10000x10000 SYMMETRIC TOEPLITZ MATRIX BY LEVINSON-DURBIN ALGORITHM - Just a fraction of a second!!')





