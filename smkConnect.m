function k = smkConnect()
%SMKCONNECT     Connects to the keithley6430

%% Instrument Connection

% Find a GPIB object.
try
    obj1 = instrfind('Type', 'gpib', 'BoardIndex', 0, 'PrimaryAddress', 27, 'Tag', '');
    % Create the GPIB object if it does not exist
    % otherwise use the object that was found.
    if isempty(obj1)
        obj1 = gpib('NI', 0, 27);
    else
        fclose(obj1);
        obj1 = obj1(1);
    end
    % Connect to instrument object, obj1.
    fopen(obj1);
catch
    obj1 = instrfind('Type', 'gpib', 'BoardIndex', 1, 'PrimaryAddress', 27, 'Tag', '');
    % Create the GPIB object if it does not exist
    % otherwise use the object that was found.
    if isempty(obj1)
        obj1 = gpib('NI', 1, 27);
    else
        fclose(obj1);
        obj1 = obj1(1);
    end
     % Connect to instrument object, obj1.
    fopen(obj1);
end




k=obj1;
%Modify buffer size
fclose(k);
k.OutputBufferSize = 100*14;
k.InputBufferSize = 100*14;
fopen(k);

%Display device info
fprintf(k,'*IDN?');
id=fscanf(k);
disp('Connected to:');
disp(id);
%Check if operation is complete
fprintf(k,'*OPC?');
o=fscanf(k);
%Turn of beeper
fprintf(k, ':SYSTEM:BEEPER:STATE OFF');
fprintf(k, ':OUTPUT:STATE OFF');


end

