clc
clear

readDigits = 25;
offset = 0;

[img, labels] = readMNIST('train-images.idx3-ubyte', 'train-labels.idx1-ubyte', readDigits, offset);

for i = 1:readDigits
    image = img(:,:,i);
    
    image = [zeros(length(image(:,1)),2), image, zeros(length(image(:,1)),2)];
    image = vertcat(zeros(2,length(image(1,:))),image);
    image = vertcat(image,zeros(2,length(image(1,:))));
    image = imresize(image,10);
    indices = find(image<.005);
    image(indices) = 0;
 
    label = labels(i);

    Z = zeros(length(image));

    for x = 1:length(image(:,1))
        for y = 1:length(image(1,:))
            if image(x,y) > 0
                Z(x,y) = 2.5;
            end
        end
    end
    
    Z = imgaussfilt(Z,4);
    
    figure(i)
    [X,Y] = meshgrid(1:x,1:y);
    faces = delaunay(X,Y);
    trisurf(faces,X,Y,Z,'Edgecolor','None');
        title(label)

    filename = strcat('MNISTsmooth', num2str(i),'_' , num2str(label), '.stl');
    surf2stl(filename,1,1,Z)
end

disp(labels)

