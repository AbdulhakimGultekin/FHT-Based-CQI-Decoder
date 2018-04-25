% This function is used in some parts of the CQI decoder implementation.

% Date           : 18.04.2018
% Author         : Abdülhakim Gültekin
% GitHub Profile : github.com/AbdulhakimGultekin

function  output = interleaver(input)

    if ~isvector(input)
        inputMatrix = input; 
        for rowNum = 1 : 32
            inputMatrix = input; 
            outputMatrix(rowNum, 1) = inputMatrix(rowNum, 32);
            outputMatrix(rowNum, 2) = inputMatrix(rowNum, 1);
            outputMatrix(rowNum, 3) = inputMatrix(rowNum, 21);
            outputMatrix(rowNum, 4) = inputMatrix(rowNum, 2);
            outputMatrix(rowNum, 5) = inputMatrix(rowNum, 3);
            outputMatrix(rowNum, 6) = inputMatrix(rowNum, 22);
            outputMatrix(rowNum, 7) = inputMatrix(rowNum, 4);
            outputMatrix(rowNum, 8) = inputMatrix(rowNum, 5);
            outputMatrix(rowNum, 9) = inputMatrix(rowNum, 23);
            outputMatrix(rowNum, 10) = inputMatrix(rowNum, 6);
            outputMatrix(rowNum, 11) = inputMatrix(rowNum, 7);
            outputMatrix(rowNum, 12) = inputMatrix(rowNum, 24);
            outputMatrix(rowNum, 13) = inputMatrix(rowNum, 8);
            outputMatrix(rowNum, 14) = inputMatrix(rowNum, 9);
            outputMatrix(rowNum, 15) = inputMatrix(rowNum, 10);
            outputMatrix(rowNum, 16) = inputMatrix(rowNum, 25);
            outputMatrix(rowNum, 17) = inputMatrix(rowNum, 20);
            outputMatrix(rowNum, 18) = inputMatrix(rowNum, 26);
            outputMatrix(rowNum, 19) = inputMatrix(rowNum, 11);
            outputMatrix(rowNum, 20) = inputMatrix(rowNum, 12);
            outputMatrix(rowNum, 21) = inputMatrix(rowNum, 13);
            outputMatrix(rowNum, 22) = inputMatrix(rowNum, 14);
            outputMatrix(rowNum, 23) = inputMatrix(rowNum, 27);
            outputMatrix(rowNum, 24) = inputMatrix(rowNum, 28);
            outputMatrix(rowNum, 25) = inputMatrix(rowNum, 15);
            outputMatrix(rowNum, 26) = inputMatrix(rowNum, 16);
            outputMatrix(rowNum, 27) = inputMatrix(rowNum, 29);
            outputMatrix(rowNum, 28) = inputMatrix(rowNum, 17);
            outputMatrix(rowNum, 29) = inputMatrix(rowNum, 18);
            outputMatrix(rowNum, 30) = inputMatrix(rowNum, 19);
            outputMatrix(rowNum, 31) = inputMatrix(rowNum, 30);
            outputMatrix(rowNum, 32) = inputMatrix(rowNum, 31);
        end
		output = outputMatrix;
    else
        inputVector = input;         
        outputVector(1) = inputVector(32);
        outputVector(2) = inputVector(1);
        outputVector(3) = inputVector(21);
        outputVector(4) = inputVector(2);
        outputVector(5) = inputVector(3);
        outputVector(6) = inputVector(22);
        outputVector(7) = inputVector(4);
        outputVector(8) = inputVector(5);
        outputVector(9) = inputVector(23);
        outputVector(10) = inputVector(6);
        outputVector(11) = inputVector(7);
        outputVector(12) = inputVector(24);
        outputVector(13) = inputVector(8);
        outputVector(14) = inputVector(9);
        outputVector(15) = inputVector(10);
        outputVector(16) = inputVector(25);
        outputVector(17) = inputVector(20);
        outputVector(18) = inputVector(26);
        outputVector(19) = inputVector(11);
        outputVector(20) = inputVector(12);
        outputVector(21) = inputVector(13);
        outputVector(22) = inputVector(14);
        outputVector(23) = inputVector(27);
        outputVector(24) = inputVector(28);
        outputVector(25) = inputVector(15);
        outputVector(26) = inputVector(16);
        outputVector(27) = inputVector(29);
        outputVector(28) = inputVector(17);
        outputVector(29) = inputVector(18);
        outputVector(30) = inputVector(19);
        outputVector(31) = inputVector(30);
        outputVector(32) = inputVector(31);
        output = outputVector;
    end
end