c%this function spits out the values of the coulomb potential centered at
%x,y,z

function vec = coulombmoved(n,o,p,q1,x,y,z)
    k = 1; %doesnt matter so much
    denom = ((n-x).^2 + (o-y).^2 + (p-z).^2).^(3/2);
    if denom == 0;
        vec = [0,0,0];
    else
        a = (n - x) / denom *k *q1;
        b = (o - y) / denom *k *q1;
        c = (p - z) / denom *k *q1;
        vec = [a,b,c];
    end
end