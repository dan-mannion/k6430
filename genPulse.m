function v = genPulse(amp, width, delay)
%GENPULSE (amp, width, delay)

v = zeros(1,100);
v(delay+1:delay+width)=amp;

end