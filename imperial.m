%At Imperial work
%Connect to keithley
disp('Connecting...');
k = smkConnect();
%Define current compliance
icc_set=1e-3;
icc_reset=5e-3;
icc=[icc_set,icc_reset];
% data = smkLinearSweep(k, 0,5,0.1,icc0;
data = smkDoubleSweep(k, 0, -4, -0.05, icc_set);
vset = -2;
vreset = 2;
vinc = -0.08;
% data = smkSetReset(k,vset,vreset,vinc,icc);

%Plot data and disconnect
smkPlot(data);
%Disconnect and dispose of keithley
disp('Disconnecting');
smkDisconnect(k);
