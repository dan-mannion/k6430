function data = cycle(n)
if(nargin==0)
    n = 1;
end
%At Imperial work
%Connect to keithley
disp('Connecting...');
k = smkConnect();
%Define current compliance
icc_set=1e-3;
icc_reset=5e-3;
icc=[icc_set,icc_reset];
%Define setting and resetting
vset = -2;
vreset = 2;
vinc = -0.08;
data = smkSetReset(k,vset,vreset,vinc,icc,n);


%Disconnect and dispose of keithley
disp('Disconnecting');
smkDisconnect(k);

saveData(data);

end