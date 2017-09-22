function matrix = emtensor( Ex, Ey, Ez, Bx, By, Bz )
%This function returns the 4x4 matrix given the electric and magnetic field
%for a point
    matrix = [ 0 -Ex -Ey -Ez; Ex 0 -Bz By; Ey Bz 0 -Bx; Ez -By Bx 0];
end

