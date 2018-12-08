function output = smkLinearSweepSample(vstart, vstop, vinc, icc)

k = smkConnect();
output=smkLinearSweep(k,vstart, vstop, vinc, icc);
smkDisconnect(k);

end