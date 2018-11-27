output = smkConstantVoltageSample(-0.7, 5);

f1 = figure(1);hold off;
plot(output.time, output.current,'-x');

figure(2);hold off;
semilogy(output.time, output.current);

% theme(f1);