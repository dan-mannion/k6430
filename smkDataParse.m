function data = smkDataParse(d)
    data = textscan(d,'%f,');
    data = cell2mat(data);
    data =reshape(data, [5 length(data)/5])';
end