function data = smkListSweep(k, v, icc)
smkDispTop(k,'List Sweep');
smkDispBottom(k,sprintf('ICC: %3.2E A',icc));

%Check lenght of list
if(length(v)>100)
    disp('ERROR: List sweep too long');
    data=[];
    return;
end
%Clear Buffer data
fprintf(k, ':TRACE:CLEAR');
%Setting up outputs
disp('Configuring output');
fprintf(k, ':OUTPUT:STATE OFF');
%Configure sense
smkConfigSense(k, icc);

%Configure sources
disp('Configuring sources');
smkConfigSource(k);
fprintf(k, ':SOURCE1:VOLTAGE:MODE LIST');

%Configuring sweep
fprintf(k, ':SOURCE1:SWEEP:POINTS %i', length(v));
%Create string of values
list_str = sprintf('%3.3f, ',v);
%Remove last comma and space
list_str = list_str(1:length(list_str)-2);
fprintf(k, ':SOURCE1:LIST:VOLTAGE %s',list_str);
% Turn on output
fprintf(k, ':TRIG:COUNT %i', length(v));
disp('Start sweep');
smkDispTop(k,'Starting sweep');
% fprintf(k, ':INIT');
% % fprintf(k, ':OUTPUT1:STATE ON');
% fprintf(k, ':READ?');
disp('Start sweep');
fprintf(k, ':INIT');
o=query(k,'*OPC?');
disp('Sweep complete, get data');
fprintf(k, ':FETCH?;*OPC?');
buff=[];
data = [];
check = [];
while(~strcmp(check,char([49 10])))
   buff=fscanf(k);
   check=buff(length(buff)-1:length(buff)); 
   if(strcmp(check,char([49 10])))
      buff = buff(1:length(buff)-3); 
   end
   data= [data, buff]; 
end
data = smkDataParse(data);
end