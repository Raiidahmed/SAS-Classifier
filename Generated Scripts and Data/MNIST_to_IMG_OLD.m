clc
clear

readDigits = 2;
offset = 7;
padding = 20;

[img, labels] = readMNIST('train-images.idx3-ubyte', 'train-labels.idx1-ubyte', readDigits, offset);

for i = 1:readDigits
    image = img(:,:,i);
    
    image = [zeros(length(image(:,1)),2), image, zeros(length(image(:,1)),2)];
    image = vertcat(zeros(2,length(image(1,:))),image);
    image = vertcat(image,zeros(2,length(image(1,:))));
 
    label = labels(i);

    Z = vertcat(zeros(padding,length(image(1,:))),image,(zeros(padding,length(image(1,:)))));
    Z = horzcat(zeros(length(Z(:,1)),padding),Z,(zeros(length(Z(:,1)),padding)));
    
    for j = 1:length(Z(:,1))
        for k = 1:length(Z(1,:))
            if Z(j,k) == 0
                Z(j,k) = 1;
            end
        end
    end
    
    Z = imgaussfilt(Z,.7);
    [X,Y] = meshgrid(1:length(Z(:,1)),1:length(Z(:,1)));
    f = figure(i);
    newXvec = 1:.1:length(Z(:,1));
    newYvec = 1:.1:length(Z(:,1));
    [newX,newY] = meshgrid(newXvec,newYvec);
    newZ = interp2(X,Y,Z,newX,newY,'nearest');
    
    faces = delaunay(newX,newY);
    trisurf(faces,newX,newY,newZ)
        axis([1 length(Z(1,:)) 1.2 length(Z(:,1))])
        colormap(f, flipud(colormap(f)))
        colorbar
        shading interp
        title(label)
        view(0,90)
     
    filename = strcat('MNIST', num2str(i),'_' , num2str(label), '.png');    
    saveas(f,filename)
end

disp(labels)