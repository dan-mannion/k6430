% Test script for Keithley 6430

%Connect to keithley
disp('Connecting...');
k = smkConnect();
%Define current compliance
icc=1e-3;
%Linear Sweep
% data = smkLinearSweep(k, 0,0.4,0.1, 5e-3);


%List Sweep
% v = [0:0.1:0.5];
% data = smkListSweep(k, v, icc);

% % Pulse exication
% p_amp = 1;
% p_width = 1;
% p_delay = 0;
% v = genPulse(p_amp, p_width, p_delay);
% %Run pulse
% data = smkListSweep(k, v, icc);

% Double sweep
% data = smkDoubleSweep(k, 0,5,0.05,icc);
data = smkSetReset(k,-.5,0.5,-0.01,icc);

if(length(data)==0)
    disp('ERROR');
    return
end

v=data(:,1);
i=data(:,2);
t=data(:,3);
figure(1);
semilogy(v,abs(i));
title('SET RESET');
xlabel('V');
ylabel('I');
%Disconnect and dispose of keithley
disp('Disconnecting');
smkDisconnect(k);

