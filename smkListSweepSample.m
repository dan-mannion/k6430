function output = smkListSweepSample(v, t_int, icc)

k = smkConnect();
output = smkListSweep(v, t_int, icc);
smkDisconnect(k);

end