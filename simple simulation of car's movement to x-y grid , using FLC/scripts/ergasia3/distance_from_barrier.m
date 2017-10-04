function [ dh , dv ] = distance_from_barrier( x,y )
if(y<=1)
   dh = 5-x;   
elseif(y<=2)
   dh = 6-x;
elseif(y<=3)
    dh = 7-x;
else
    dh = 10.7-x;
end

if(x<=5)
    dv = y;
elseif(x<=6)
    dv = y-1;
elseif(x<=7)
    dv = y-2;
else
    dv = y-3;
end

dv = dv+1.8;
dh = dh+1.8;
end

