%this function spits out the values of the coulomb potential centered at
%0,0,0

function vec = coulomb(n,o,p,q1)
    k = 1; %doesnt matter so much
    denom = (n.^2 + o.^2 + p.^2).^(3/2);
    if denom == 0;
        vec = [0,0,0];
    else
        a = n / denom *k *q1;
        b = o / denom *k *q1;
        c = p / denom *k *q1;
        vec = [a,b,c];
    end
end