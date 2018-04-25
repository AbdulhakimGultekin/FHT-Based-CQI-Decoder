% In this work, it is aimed to show a basic way for how to implement 
% UL (Uplink) CQI (Channel Quality Indication) encoding and decoding
% processes for PUSCH (Physical Uplink Shared Channel). Encoding process is
% performed regarding "3GPP TS 36.212 version 11.2.0 Release 11" 
% standart which can be accessed via 
% 
% http://www.etsi.org/deliver/etsi_ts/136200_136299/136212/11.02.00_60/ts_136212v110200p.pdf
%
% For decoding process a method which is based on Fast Hadamard Transform
% has been utilized. This method implemented considering an article. 
% For details of decoding process you can access the article from
%
% https://ieeexplore.ieee.org/document/5622951/

% Date           : 18.04.2018
% Author         : Abdülhakim Gültekin
% GitHub Profile : github.com/AbdulhakimGultekin

clc, clear all, close all;
%% Definitions

O = 6;                          % number of bits of CQI
B = 32;                         % number of rows of encoder matrix (32x11)
repeatNumber = 100;           % number of repetition of test
Q_CQI = 32;                     % number of bits on resource grid (by default)
N_L = 1;                        % number of transmission layers (by default)
SNR_Counter = 0;                % SNR increment counter

flag = 1;                       % whether O > 7 or not
if O >= 7
    flag = 0; 
end

foldername = '..\handlers';     % DO NOT CHANGE
addpath(foldername);
filename = 'EncoderMatrix.mat'; % DO NOT CHANGE
obj = matfile(filename);
M = obj.M;                      % The Encoder Matrix (32x11)
%% CQI Encoder-Decoder Simulation
for SNR = -10 : 5 : 20                      % signal-to-noise ratio
    nErrorsTotal = 0;                       % number of total bit errors
    for repeatNum = 1 : repeatNumber
        %% Encoding
        CQI = randi([0, 1], 1, O);
        EncodedBlock = encodeCQI(CQI, M);   % encoding with RM code
        %% Modulation --> AWGN Channel --> Demodulation
        modulate = comm.QPSKModulator('BitInput', true);                    % QPSK modulation
        demodulate = comm.QPSKDemodulator('BitOutput', true, ...
            'DecisionMethod', 'Log-likelihood ratio');                                  
        EncodedSignal = modulate(EncodedBlock.');
        channelOutSignal = awgn(EncodedSignal, SNR, 'measured');            % AWGN channel 
        receivedBlock = demodulate(channelOutSignal).';
        %% Decoding
        decodedBlock = decodeCQI(receivedBlock, M, flag);
        decodedBlock = decodedBlock(1 : O);
        %% SNR-BER
        nErrors(repeatNum) = biterr(CQI, decodedBlock);
        nErrorsTotal = nErrorsTotal + nErrors(repeatNum); 
    end
    SNR_Counter = SNR_Counter + 1;
    BER(SNR_Counter) = nErrorsTotal / (repeatNumber * O);                   % BER calc.
    SNR_BER(SNR_Counter, :) = [SNR, BER(SNR_Counter)];
end
%% Results
figure;
plot(SNR_BER(:, 1), SNR_BER(:, 2), '--*', 'Color', 'r');
grid on;
title(['Simulation for ', num2str(O),' bit CQI']);
xlabel('SNR [dB]'), ylabel('BER');