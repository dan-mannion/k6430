k = smkConnect();

smkConfigSource(k);
I_CC = 1e-3; %Set current compliance
smkConfigSense(k, I_CC);

%Set source to fixed value 
fprintf(k, ':SOURCE1:VOLTAGE:MODE FIXED');
fprintf(k, ':SOURCE1:VOLTAGE:LEVEL %E', 0.5e0);
fprintf(k, ':SOURCE1:CLEAR:AUTO OFF');

%COnfigure data readings
fprintf(k, ':TRACE:POINTS 1');
fprintf(k, ':TRACE:FEED SENSE1');

%Define timings
tend = 2;
data = zeros(1,5);
%Turn output on 
%Reset timer
fprintf(k, ':SYSTEM:TIME:RESET');
fprintf(k, ':OUTPUT1:STATE ON');
while(data(end,4)<tend)
fprintf(k,':READ?');
data = [data; smkDataParse(fscanf(k))];
end
fprintf(k, ':OUTPUT1:STATE OFF');

output.voltage = data(:,1);
output.current = data(:,2);
output.time = data(:,4);


disp('Disconnecting...');
smkDisconnect(k);