v1 = input('a aracın hızı kaç:');
v2 = input('b aracaın hızı kaç:');
uzunluk = input('A ile B şehirleri arasındaki mesafe ne kadar:');
%%maximum süre şimdilik 10 olsun
for t=0 : 10
    if v1*t < uzunluk
         fprintf ('saat %d :',t);
         fprintf('a aracının konumu %d \n' ,v1*t);
    elseif v1*t == uzunluk 
         fprintf ('saat %d :',t);
         fprintf('a aracımız hedefe vardı.\n');
    else
        break ;
    end
    if v2*t <uzunluk
        fprintf ('saat %d :',t);
        fprintf('b aracının konumu %d \n' ,v2*t);
    
    elseif v2*t == uzunluk
        fprintf ('saat %d :',t);
        fprintf('b aracımız hedefe vardı.\n');
    else
        break;
   
    end
    
end
        
       
