function [ P ] = Serie3n_add1( r )
P=r
for i=1:length(r)
    if mod(r(i),2)==0
        P(i)=r(i)/2;
    else
        P(i)=(r(i)*3+1)/2;
    end
end



end

