function mat = xlor( xvel )
%this takes a velocity as a ratio v/c and gives a matrix that will boost in
%the x direction
    gamma = sqrt(1/(1-xvel));
    beta = xvel;
    mat = [gamma -gamma*beta 0 0; -gamma*beta gamma 0 0; 0 0 1 0; 0 0 0 1];
end