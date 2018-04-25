% This function is used in the CQI encoder implementation.

% Date           : 18.04.2018
% Author         : Abdülhakim Gültekin
% GitHub Profile : github.com/AbdulhakimGultekin

function out = encodeCQI(CQI, M, varargin)

    if nargin == 4
        Q_CQI = varargin{1};
        N_L = varargin{2};
    elseif nargin == 3
        Q_CQI = varargin{1};
        N_L = 1;
    elseif nargin < 2
        error('Missing arguments: Either M or CQI or both of.');
    elseif nargin > 4
        error('Too many arguments.');
    else
        Q_CQI = 32;
        N_L = 1;
    end
        
    B = 32;
    O = length(CQI);
    preEncodedBlock(1 : B) = 0;
    % encoding with Reed-Muller code; it is a (32x11) matrix.
    for i = 0 : B - 1
        for n = 0 : O - 1
            preEncodedBlock(i + 1) = preEncodedBlock(i + 1) + ...
            CQI(n + 1) * M(i + 1, n + 1);
        end
        preEncodedBlock(i + 1) = mod(preEncodedBlock(i + 1), 2);
    end

    for i = 0 : (N_L * Q_CQI) - 1
        EncodedBlock(i + 1) = preEncodedBlock(mod(i, B) + 1);
    end
    out = EncodedBlock;
end