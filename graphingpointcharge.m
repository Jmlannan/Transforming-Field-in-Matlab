%lets graph a point charge
type emtensor
type xlor
type coulomb

v=.5; % this is the ratio of the speed of light that we will be transforming to

x = -3:1:3;
y = -3:1:3;
z = -3:1:3;
[X,Y,Z] = meshgrid(x, y, z);
U = X;
V = Y;
W = Z;
%this spits out tensors that have the xyz coordinates for the values

for idx = 1:numel(X)
    elementx = X(idx);
    elementy = Y(idx);
    elementz = Z(idx);
    vec = coulomb(elementx,elementy,elementz,1);
    U(idx) = vec(1);
    V(idx) = vec(2);
    W(idx) = vec(3);
   % [U(idx),V(idx),W(idx)] = vec;
end



%[U,V,W] = arrayfun(coulomb,X,Y,Z,1); %this should do what the for loop
%does but it didnt work


figure
quiver3(X,Y,Z,U,V,W)
view(-3,5)
