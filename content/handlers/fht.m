% This function is used in some parts of the CQI decoder implementation.

% Date           : 18.04.2018
% Author         : Abdülhakim Gültekin
% GitHub Profile : github.com/AbdulhakimGultekin

function output = fht(input)
    
    for ii = 1 : 5
        temp(1) = input(1) + input(17);
        temp(2) = input(1) - input(17);
        temp(3) = input(2) + input(18);
        temp(4) = input(2) - input(18);
        temp(5) = input(3) + input(19);
        temp(6) = input(3) - input(19);
        temp(7) = input(4) + input(20);
        temp(8) = input(4) - input(20);
        temp(9) = input(5) + input(21);
        temp(10) = input(5) - input(21);
        temp(11) = input(6) + input(22);
        temp(12) = input(6) - input(22);
        temp(13) = input(7) + input(23);
        temp(14) = input(7) - input(23);
        temp(15) = input(8) + input(24);
        temp(16) = input(8) - input(24);
        temp(17) = input(9) + input(25);
        temp(18) = input(9) - input(25);
        temp(19) = input(10) + input(26);
        temp(20) = input(10) - input(26);
        temp(21) = input(11) + input(27);
        temp(22) = input(11) - input(27);
        temp(23) = input(12) + input(28);
        temp(24) = input(12) - input(28);
        temp(25) = input(13) + input(29);
        temp(26) = input(13) - input(29);
        temp(27) = input(14) + input(30);
        temp(28) = input(14) - input(30);
        temp(29) = input(15) + input(31);
        temp(30) = input(15) - input(31);
        temp(31) = input(16) + input(32);
        temp(32) = input(16) - input(32);
        input = temp;
    end
    output = input;
end
        