function data = smkSetReset(k, vset, vreset, vinc, icc, n)
%SMKSETRESET (k, vset, vreset, vinc, icc, n)
if(nargin ==5)
    n=2;
end

if(n==2)
    %Run set
    data = smkDoubleSweep(k, 0, vset, vinc, icc(1));
    %Run reset
    data2 = smkDoubleSweep(k,0,vreset, -1*vinc, icc(length(icc)));
    data = [data; data2];
    smkPlot(data,4);
elseif(n==1)
    %Run set
    data = smkLinearSweep(k, 0, vset, vinc, icc(1));
    %Run reset
    data2 = smkLinearSweep(k,0,vreset, -1*vinc, icc(length(icc)));
    data = [data; data2];
    smkPlot(data,2);
end
end