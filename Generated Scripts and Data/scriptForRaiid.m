%%

load('X.mat')

%% Upsampling the letter

% So instead of taking steps of "1" we'll take steps of "0.1"
newXvec = 1:.1:24;
newYvec = 1:.1:24;

% Rebuild our meshgrid for this new set of samples
[newX,newY] = meshgrid(newXvec,newYvec);

% This is the step where we use nearest neighbor interpolation to make the
% Z surface be sampled on our new grid
newZ = interp2(X,Y,Z,newX,newY,'nearest');


%% Trying to make the letter thinner

% So this is the erode function. The bigger the number that goes into the
% "ones" function the more it will erode
thinZ = imerode(newZ,ones(10));


%% Let's look at what we've done
figure(1)
faces = delaunay(X,Y);
trisurf(faces,X,Y,Z)
shading interp
title('Original Number')
view(0,90)

figure(2)
faces = delaunay(newX,newY);
trisurf(faces,newX,newY,newZ)
shading interp
title('New Number')
view(0,90)

figure(3)
faces = delaunay(newX,newY);
trisurf(faces,newX,newY,thinZ)
shading interp
title('Thin New Number')
view(0,90)