%Joseph Lannan
%9/12/17
%Basic Field Transforms of the EM field
%499 Ji Research


% lets define the electromagnetic tensor
% to make this as general as possible, ill define it using the scalar and
% vector potentials so that it can more easily be generalized

function matrix = emtensor( Ex, Ey, Ez, Bx, By, Bz )
%This function returns the 4x4 matrix given the electric and magnetic field
%for a point
    matrix = [ 0 -Ex -Ey -Ez; Ex 0 -Bz By; Ey Bz 0 -Bx; Ez -By Bx 0];
end

%Lets make a function to generate the lorentz matrix given a velocity in
%the x direction

function mat = xlor( xvel )
%this takes a velocity as a ratio v/c and gives a matrix that will boost in
%the x direction
    gamma = sqrt(1/(1-x))
    beta = xvel
    mat = [gamma -gamma*beta 0 0; -gamma*beta gamma 0 0; 0 0 1 0; 0 0 0 1]
end