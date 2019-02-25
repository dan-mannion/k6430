function output = smkLinearSweepDual(vstart, vstop, vinc, icc)
vinc = sign(vstop)*abs(vinc);

k = smkConnect();
data=smkLinearSweep(k,vstart, vstop, vinc, icc);
data2=smkLinearSweep(k,vstop, vstart, -1.*vinc, icc);
smkDisconnect(k);

%Package data into struct
output.voltage = [data(:,1); data2(:,1),];
output.current = [data(:,2); data2(:,2),];
output.time = [data(:,4); data2(:,4)+data(end,4)];

end