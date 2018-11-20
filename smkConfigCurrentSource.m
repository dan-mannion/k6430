function smkConfigCurrentSource(k, idc)
%Source voltage
fprintf(k, ':SOURCE1:FUNCTION:MODE CURRENT');
%Timings and range
fprintf(k, ':SOURCE1:DELAY:AUTO OFF');
fprintf(k, ':SOURCE1:DELAY 0');
fprintf(k, ':SOURCE1:SOAK 0');
fprintf(k, ':SOURCE1:CLEAR:AUTO OFF');

fprintf(k, ':SOURCE1:CURRENT:MODE FIXED');
fprintf(k, ':SOURCE1:CURRENT:RANGE:AUTO ON');
fprintf(k, ':SOURCE1:CURRENT:LEVEL:IMMEDIATE:AMPLITUDE %e', idc);

end