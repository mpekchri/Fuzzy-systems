function m = my_shuffle( m )
r = size(m,1);
c = size(m,2);
index = (1:r)';
index = index(randperm(r));
temp = m;
for i=1:r
   m(i,:) = temp(index(i),:);
end

end

