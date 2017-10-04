function pos = update_position(pos,v,theta, dt )
pos = (v*dt).*[cosd(theta),sind(theta)]+pos;
pos = pos';
end

