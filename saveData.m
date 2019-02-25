function saveData(data)
while(1)
    s=input('Save data (y/n)? ','s');
    if(s=='y')
        f='';
        while( exist(strcat('data/',f,'.mat')) || strcmp(f,''))
            f = input('Filename: ','s');
        end
        
        save(strcat('data/',f),'data');
        disp('SAVED');
        return
    elseif(s=='n')
        return
    end
end
end