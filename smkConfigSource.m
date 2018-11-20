function smkConfigSource(k)
%SMKCONFIGSOURCE (k)

%Source voltage
fprintf(k, ':SOURCE1:FUNCTION:MODE VOLTAGE');
%Timings and range
fprintf(k, ':SOURCE1:VOLTAGE:RANGE:AUTO ON');
fprintf(k, ':SOURCE1:DELAY:AUTO OFF');
fprintf(k, ':SOURCE1:DELAY 0');
fprintf(k, ':SOURCE1:SOAK 0');
fprintf(k, ':SOURCE1:CLEAR:AUTO ON');

end