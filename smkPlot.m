function smkPlot(data, split)
if(nargin~=2)
    split=1
end
v=data(:,1);
i=data(:,2);
t=data(:,3);

if(split == 2)
    i = splitData(i);
    v = splitData(v);
    figure(1);
    semilogy(v,abs(i));
        
elseif(split == 4)
    i = splitData(i);
    i1 = splitData(i(:,1));
    i2 = splitData(i(:,2));
    i = [i1,i2];
    
    v = splitData(v);
    v1 = splitData(v(:,1));
    v2 = splitData(v(:,2));
    v = [v1,v2];
end

fh = figure(1);
semilogy(v,abs(i));
title('IV');
theme(fh);
xlabel('V');
ylabel('I');
if split==2
    legend('1','2','Location','southeast');
elseif split==4
    legend('1','2','3','4','Location','southeast');
end
end

function o = splitData(data)
o = zeros(length(data)/2,2);
o(:,1) = data(1:length(data)/2);
o(:,2) = data(length(data)/2+1:length(data));
end