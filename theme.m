function theme(fh)
%Apply theme
%Font sizes
fh.Children.FontSize = 13;
% fh.Children.FontWeight = 'bold';
fh.Children.FontName = 'Book Antiqua';
fh.Children.Title.FontSize = 18;

%Grid lines
grid;
cols = ["black","red","blue","green"];
%Plots
if(strcmp(class(fh.Children.Children),'matlab.graphics.chart.primitive.Line'))
    lne = fh.Children.Children;
    for i=1:length(lne)
        lne(i).Color = cols(i);
        lne(i).LineWidth = 1.2;
    end
elseif(strcmp(class(fh.Children.Children),'matlab.graphics.chart.primitive.Histogram'))
   h=fh.Children.Children;
   h.FaceColor = 'black';
end
end