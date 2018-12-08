function output = smkListSweepSample(v, t_int, icc)

k = smkConnect();
try
output = smkListSweep(k, v, t_int, icc);
catch
   disp(sprintf('List sweep failed. Length of list: %d. Thi smust be <= 100', length(v))); 
end
smkDisconnect(k);

end