function smkDisconnect(k)
%SMKDISCONNECT Disconnects from keithley 6430
%% Disconnect and Clean Up

% Disconnect from instrument object, obj1.
fclose(k);
end

