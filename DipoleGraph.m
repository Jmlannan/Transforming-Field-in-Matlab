%lets graph a dipole now
type emtensor
type xlor
type offcentercoulomb


%so now we are going to translate the reference frame to one where this
%charge is moving at a relativistic speed, lets say .5c 
v = .1  %ratio of the speed of light that this thing is moving

x = -3:1:3;
y = -3:1:3;
z = -3:1:3;
[X,Y,Z] = meshgrid(x, y, z);
U = X;
V = Y;
W = Z;
%this spits out tensors that have the xyz coordinates for the values in UVW

for idx = 1:numel(X)
    elementx = X(idx);
    elementy = Y(idx);
    elementz = Z(idx);
    vec = offcentercoulomb(elementx,elementy,elementz,1,1,0,0) + offcentercoulomb(elementx,elementy,elementz,1,-1,0,0); %using superposition principle here
    U(idx) = vec(1);
    V(idx) = vec(2);
    W(idx) = vec(3);
end

%We now need to create the EM tensor at every point so we can transform it
%lets map out a function that puts in a emtensor for each point in the
%original XYZ matrix

%lets create our lorentz transform matrix
lor = xlor(v);
%and make some more variables to hold our new E and B fields
EU = U;
EV = V;
EW = W;
BU = U;
BV = V;
BW = W;
for idx =1:numel(X)
    Ex = U(idx);
    Ey = V(idx);
    Ez = W(idx);
    transformedtensor = lor*emtensor(Ex,Ey,Ez,0,0,0)*lor;
    %there should be no B field from this charge, and the transformed tensor is specific to the point
    % we now need to pull out our B and E fields from this tensor
    EU(idx) = transformedtensor(2);
    EV(idx) = transformedtensor(3);
    EW(idx) = transformedtensor(4);
    BU(idx) = transformedtensor(12);
    BV(idx) = -transformedtensor(8);
    BW(idx) = transformedtensor(7);
end
%now we can graph either our B or our E fields

figure
quiver3(X,Y,Z,U,V,W)
view(-5,5)

figure
quiver3(X,Y,Z,BU,BV,BW)
view(-5,5)

figure
quiver3(X,Y,Z,EU,EV,EW)
view(-5,5)