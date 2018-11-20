tint = 10e-3;
samples = 500;
idc = -5e-3;
t = tint.*(0:samples-1);

fh = figure(1);
k = smkConnect();
smkConfigCurrentSource(k, idc);
smkConfigVoltageSense(k);
data = dcCurrentRun(k,  tint, samples);
smkDisconnect(k);

fh = figure(1);
plot( t(1:length(data(:,1))), data(:,1));
theme(fh);
ylabel('V');
xlabel('t (s)');
saveData(data);