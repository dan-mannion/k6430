function data_final = smkDoubleSweep(k, vstart, vstop, vinc, icc)
%SMKDOUBLESWEEP (k, vstart, vstop, vinc, icc)
smkDispTop(k,'Double Lin Sweep >>');
smkDispBottom(k,sprintf('ICC: %3.2E A',icc));
% input('Press ENTER if correct.');
smkDispTop(k,'Forward Sweep');
%Setting up outputs
fprintf(k, ':OUTPUT:STATE OFF');
%Configure sense
smkConfigSense(k, icc);

%Configure sources
disp('Configuring sources');
smkConfigSource(k);
fprintf(k, ':SOURCE1:VOLTAGE:MODE SWEEP');
%Configuring sweep
fprintf(k, ':SOURCE1:SWEEP:SPACING LINEAR');
fprintf(k, ':SOURCE1:VOLTAGE:START %f',vstart);
fprintf(k, ':SOURCE1:VOLTAGE:STOP %f', vstop);
fprintf(k, ':SOURCE1:VOLTAGE:STEP %f', vinc);
fprintf(k, ':SOURCE1:SWEEP:DIRECTION UP');
% Turn on output
fprintf(k, ':TRIG:COUNT %i', floor((vstop-vstart)/vinc)+1);
disp('Initiating sweep');
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
smkDispTop(k,'Reverse Sweep');
data = smkDataParse(data);
%Store in final data
data_final = data;

%Run in opposite direction
fprintf(k, ':SOURCE1:SWEEP:DIRECTION DOWN');
fprintf(k, ':TRIG:COUNT %i', floor((vstop-vstart)/vinc)+1);
disp('Initiating sweep');
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
%    check=buff(length(buff)-1:length(buff)); 
end
smkDispTop(k,'Sweep complete.');
data = smkDataParse(data);
data_final = [data_final; data];
end