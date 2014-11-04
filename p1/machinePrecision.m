function [ t, eps ] = machinePrecision()
%MACHINEPRECISION Return computer's machine precision
%   Return the least numeric value that is threated by the computer as
%   value above 0.
    eps = 1.0;
    t = 0;
    while (1.0 + eps/2.0 > 1.0)
        eps = eps/2.0;
        t = t + 1;
    end
    [t, eps];
end