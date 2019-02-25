function data = form(n)
if(nargin == 0)
    n = 1;
end
%At Imperial work
%Connect to keithley
disp('Connecting...');
k = smkConnect();
%Define current compliance
icc_form=1.0e-3;
vform=-2.0;
vinc=sign(vform)*0.05;
if(vform/vinc>4000)
disp('ERROR: Too large!');
keyboard;
end
%Run form
if(n==2)
    v = [0:vinc:vform];
    v = [v, fliplr(v)];
%     data = smkDoubleSweep(k, 0, vform, vinc, icc_form);
    data = smkListSweep(k, v, icc_form);

    smkPlot(data,2);
elseif(n==1)
    data = smkLinearSweep(k, 0, vform, vinc, icc_form);
    smkPlot(data);
end

%Disconnect and dispose of keithley
disp('Disconnecting');
smkDisconnect(k);
saveData(data);
end