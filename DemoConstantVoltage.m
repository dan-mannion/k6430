output = smkConstantVoltageSample(0.5, 10);

f1 = figure(1);
plot(output.time, output.current);

theme(f1);