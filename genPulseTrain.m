function v = genPulseTrain(amp, width, period, delay)
%GENPULSETRAIN (amp, width, period, delay)
v = zeros(1,100);
i = 0;
while(1)
    vstart = delay+i*period;
    if(vstart+width>100)
       return; 
    end
    v = v+genPulse(amp, width, vstart);
    i=i+1;
end

end