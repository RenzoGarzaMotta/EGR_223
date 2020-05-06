%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Title: Lab 1 - Introduction to MATLAB
%Filename: Lab1
%Author: Renzo Garza Motta
%Course: EGR 223 - 01
%Course Name:Probability and Signal Analysis
%Date: May 4th, 2020
%Instructor: Dr. Karl Brakora
%Description:
%   This program generates a 3Hz sinusoidal signal with 1 unit of amplitude
%   and a 120 degree offset. Additionally, the script generates three 
%   signals with 6dB, 0dB, and -6dB noise level from the original
%   sinusoidal equation.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
%Clean Signal Parameter Definition
amplitude = 1;                                  %Amplitude of the clean signal
frequency = 3;                                  %Clean Signal Frequency (Hz)
period = 1/frequency;                           %period of the clean signal
degreePhaseOffset = 120;                        %Clean Signal Phase Offset (Degrees)
radsPhaseOffset = (degreePhaseOffset*pi)/180;   %Convert Phase Offset to radians
cycles = 4;                                     %Amount of cycles graphed
 
xStart = 0;                                     %Starting value of t vector
xStep = period/100;                             %Step value of t vector
xFinal = cycles*period;                         %Final value of t vector
t = xStart:xStep:xFinal;                        %Generating vector t from xStart to xFinal with a step value of xStep
cleanSignal = amplitude*sin(2*pi*frequency*t + radsPhaseOffset); %Defining clean sinusoidal signal
 
%Noise Level Definition
SNR6dB = 6;             %noise indicated in decibels (dB)
SNR0dB = 0;             %noise indicated in decibels (dB)
SNRn6dB = -6;           %noise indicated in decibels (dB)
 
SNR = @(dB) 10^(dB/10); %Custom equation calculated SNR value from given dB value
dB6 = SNR(SNR6dB);      %Generates SNR value for a 6dB level
dB0 = SNR(SNR0dB);      %Generates SNR value for a 0dB level
dBn6 = SNR(SNRn6dB);    %Generates SNR value for a -6dB level
 
%Noise Signal Generation
noiseGen = @(SNRatio) (randn(size(t))/sqrt(SNRatio));   %Noise vector of size t generator with a SNR input
signal1 = noiseGen(dB6);                                %Generates a 6dB noise vector
signal2 = noiseGen(dB0);                                %Generates a 0dB noise vector
signal3 = noiseGen(dBn6);                               %Generates a -6dB noise vector
noisySignal1 = cleanSignal + signal1;                   %Combining 6dB noise and clean signal
noisySignal2 = cleanSignal + signal2;                   %Combining 0dB noise and clean signal
noisySignal3 = cleanSignal + signal3;                   %Combining -6dB noise and clean signal
 
%Subplot setup
subplot(4,1,1);         %Locate graph one in the first row
plot(cleanSignal);      %Plot clean signal for 4 cycles
grid on;                %Turn major grid on
title('Clean Signal');  %Set title
ylabel('y');            %Set y-axis label
xlabel('t');            %Set x-axis label
 
subplot(4,1,2);             %Locate graph one in the first row
plot(noisySignal1, 'r');    %Plot clean signal for 4 cycles in a red line
grid on;                    %Turn major grid on
title('6dB Noise Signal');  %Set title
ylabel('y');                %Set y-axis label
xlabel('t');                %Set x-axis label
 
subplot(4,1,3);             %Locate graph one in the first row
plot(noisySignal2, 'g');    %Plot clean signal for 4 cycles in a green line
grid on;                    %Turn major grid on
title('0dB Noise Signal');  %Set title
ylabel('y');                %Set y-axis label
xlabel('t');                %Set x-axis label
 
subplot(4,1,4);             %Locate graph one in the first row
plot(noisySignal3, 'c');    %Plot clean signal for 4 cycles in a cyan line
grid on;                    %Turn major grid on
title('-6dB Noise Signal'); %Set title
ylabel('y');                %Set y-axis label
xlabel('t');                %Set x-axis label
