function data = dcCurrentRun(k, t_int, num_samples)
%DCCURRENTRUN (k, t_int, num_samples)
figure(1);
t=t_int.*[0:num_samples-1];
fprintf(k, ':TRIG:COUNT %i', 1);
disp('Applying DC current');
fprintf(k, ':OUTPUT:STATE ON');
data = [];
for i =0:num_samples-1
    tic
    data = [data;  singleDCCurrentRead(k)];
    if(mod(i,5)==0)
        plot(t(1:length(data(:,1))), data(:,1))
        drawnow;
    end
    
    while(toc<t_int)
        ;
    end    
end
while(~strcmp(query(k,':OUTPUT:STATE?'),char([48, 10])))
    fprintf(k, ':OUTPUT:STATE OFF'); 
end
end