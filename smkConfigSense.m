function smkConfigSense(k, icc)
%SMKCONFIGSENSE (k, icc)

disp('Configuring Sense module');
%Choose measurement to be current
fprintf(k, ':SENSE1:FUNCTION:CONCURRENT OFF');
fprintf(k, ':SENSE1:FUNCTION:ON "CURRENT"');
%Set compliance
fprintf(k, ':SENSE1:CURRENT:PROTECTION:LEVEL %e',icc);
%Timing and ranges
fprintf(k, ':SENSE1:CURRENT:NPLCYCLES 1');
fprintf(k, ':SENSE1:CURRENT:RANGE:AUTO ON');
%COnfiguring the filters used in sense1
fprintf(k, ':SENSE1:AVERAGE:AUTO ON');
fprintf(k, ':SENSE1:AVERAGE:STATE ON');
fprintf(k, ':SENSE1:AVERAGE:ADVANCED:STATE OFF');
fprintf(k, ':SENSE1:AVERAGE:REPEAT:STATE OFF');
fprintf(k, ':SENSE1:MEDIAN:STATE OFF');

end