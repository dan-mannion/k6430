function data = singleDCCurrentRead(k)
fprintf(k, ':INIT');
o=query(k,'*OPC?');
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