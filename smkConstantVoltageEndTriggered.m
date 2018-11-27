function output = smkConstantVoltageEndTriggered(voltage, R_end, ICC)
%SMKCONSTANTVOLTAGEENDTRIGGERED (voltage, R_end, ICC) Applies the voltage
%passed to the function until the measured resistance reaches R_End. 
    k = smkConnect();
    %Configure voltage source 
    smkConfigSource(k);
    fprintf(k, ':SOURCE1:VOLTAGE:MODE FIXED');
    fprintf(k, ':SOURCE1:VOLTAGE:LEVEL %E', voltage);
    fprintf(k, ':SOURCE1:CLEAR:AUTO OFF');
    %Configure sense 
    if(~exist('ICC', 'var'))
       ICC = 100e-3; 
    end
    smkConfigSense(k, ICC);
    
    %Init data variable
    data = zeros(1,5);
    R = 0;
    %Turn output on 
    %Reset timer
    fprintf(k, ':SYSTEM:TIME:RESET');
    fprintf(k, ':OUTPUT1:STATE ON');
    while(R<R_end)
    fprintf(k,':READ?');
    data = [data; smkDataParse(fscanf(k))];
    tmp = voltage./data(:,2);    
    R = abs(tmp(end));
    end
    fprintf(k, ':OUTPUT1:STATE OFF');

    
    %Package data into struct
    output.voltage = data(:,1);
    output.current = data(:,2);
    output.time = data(:,4);
    output.R=R;
end