%% Clear previous output and variables
clc
clear

%% Allocate ReadMNIST parameters
readDigits = 5; %Range of digits for whole set
offset = 0; %Offset for initial digit
numstl = 2; %Number of 3D files to create

%% Run ReadMNIST storing imagery in img and number labels in labels
[img, labels] = readMNIST('train-images.idx3-ubyte', 'train-labels.idx1-ubyte', readDigits, offset);

%% Loop to Clean Data and Save to .STL file format
for i = 1:numstl
    imgindex = round(rand*readDigits);
    image = img(:,:,imgindex);
    
    image = [zeros(length(image(:,1)),2), image, zeros(length(image(:,1)),2)];
    image = vertcat(zeros(2,length(image(1,:))),image);
    image = vertcat(image,zeros(2,length(image(1,:))));
    label = labels(imgindex);

    Z = zeros(length(image));

    for x = 1:length(image(:,1))
        for y = 1:length(image(1,:))
            if image(x,y) > 0
                Z(x,y) = 2.5;
            end
        end
    end
    
    [X,Y] = meshgrid(1:24,1:24);
    figure(i)
    newXvec = 1:.1:24;
    newYvec = 1:.1:24;
    [newX,newY] = meshgrid(newXvec,newYvec);
    newZ = interp2(X,Y,Z,newX,newY,'nearest');
%     thinZ = imerode(newZ,ones(10)); Uncomment to thin out letter
    faces = delaunay(newX,newY);
    trisurf(faces,newX,newY,newZ)
    shading interp
    title(label)

    filename = strcat('MNIST', num2str(imgindex),'_' , num2str(label), '.stl');
%     surf2stl(filename,1,1,newZ)
end

disp(labels)