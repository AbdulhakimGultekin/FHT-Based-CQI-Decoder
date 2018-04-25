% This function is used in the CQI decoder implementation.

% Date           : 18.04.2018
% Author         : Abdülhakim Gültekin
% GitHub Profile : github.com/AbdulhakimGultekin

function output = decodeCQI(receivedBlock, M, flag)

        C = 1 - 2 * receivedBlock;                                   % bipolar transformation
        C = interleaver(C);                                          % interleaving
        
        if ~flag
           % constructing the mask matrix M_D
           iVal = 0 : 31;
           a(iVal + 1, :) = de2bi(iVal, 5, 'left-msb');
           v(iVal + 1, iVal + 1) = 0;
           for iVal = 0 : 31
               for maskNum = 7 : 11
                   v(iVal + 1, :) = v(iVal + 1, :) + ...
                       a(iVal + 1, maskNum - 6) * ( M(:, maskNum).' );
               end
           end
           pre_Mask_Matrix = v;
           pre_Mask_Matrix = mod(pre_Mask_Matrix, 2);                % mode 2 operation
           Mask_Matrix = 1 - 2 * pre_Mask_Matrix;                    % bipolar transformation
           Decoding_Matrix = interleaver(Mask_Matrix);               % interleaving
          
           % element-wise multiply of each row
           Decoding_Matrix = C .* Decoding_Matrix;           

           % Fast Hadamard Transform for each row
           for rowNum = 1 : 32
               D_Matrix(rowNum, :) = fwht(Decoding_Matrix(rowNum, :), 32, 'dyadic'); 
           end

           abs_D_Matrix = abs(D_Matrix);
           K = max(max(abs_D_Matrix));
%            find(abs_D_Matrix == K)              % to show at command prompt
           [x, y] = find(abs_D_Matrix == K);
           cntrl = sign(D_Matrix(x, y));

           bitArr2 = de2bi(x - 1, 5, 'left-msb'); % via row number 
           bitArr1 = de2bi(y - 1, 5, 'left-msb'); % via column number
           if cntrl == 1
              decodedBlock = [1 bitArr1 bitArr2];
           else
              decodedBlock = [0 bitArr1 bitArr2];
           end
        else
            % Fast Hadamard Transform for received word
            D_Matrix = fwht(C, 32, 'dyadic');
            abs_D_Matrix = abs(D_Matrix);
            K = max(abs_D_Matrix);
%             find(abs_D_Matrix == K)             % to show at command prompt
            [x, y] = find(abs_D_Matrix == K);
            cntrl = sign(D_Matrix(x, y));
            bitArr1 = de2bi(y - 1, 5, 'left-msb');
            if cntrl == 1
                decodedBlock = [1 bitArr1];
            else
                decodedBlock = [0 bitArr1];
            end
        end
        output = decodedBlock;
end