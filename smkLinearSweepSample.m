function output = smkLinearSweepSample(vstart, vstop, vinc, icc)
vinc = sign(vstop-vstart)*abs(vinc);

k = smkConnect();
data=smkLinearSweep(k,vstart, vstop, vinc, icc);
smkDisconnect(k);

%Package data into struct
output.voltage = data(:,1);
output.current = data(:,2);
output.time = data(:,4);

end