function smkConfigVoltageSense(k)

fprintf(k, ':SENSE1:FUNCTION:CONCURRENT OFF');
fprintf(k, ':SENSE1:VOLTAGE:RANGE:AUTO ON');
fprintf(k, ':SENSE1:VOLTAGE:NPLCYCLES 0.01');
fprintf(k, ':SENSE1:VOLTAGE:PROTECTION 20');
end