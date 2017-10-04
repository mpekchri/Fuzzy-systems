function theta = normalize_theta( theta )
if(theta>0)
   if(theta>180)
       theta = mod(theta,180)-180;
   end
else
    if(abs(theta)>180)
        theta = mod(abs(theta),180);
    end
end

end

