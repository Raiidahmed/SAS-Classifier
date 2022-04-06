clc
clear
close all

tic
readDigits = 5000;
offset = 0;
padding = 20;
colorshift = .6;

[img, labels] = readMNIST('train-images.idx3-ubyte', 'train-labels.idx1-ubyte', readDigits, offset);

for i = 1:readDigits
%     tic
    image = img(:,:,i);
    
    image = [zeros(length(image(:,1)),2), image, zeros(length(image(:,1)),2)];
    image = vertcat(zeros(2,length(image(1,:))),image);
    image = vertcat(image,zeros(2,length(image(1,:))));
 
    label = labels(i);

    Z = vertcat(zeros(padding,length(image(1,:))),image,(zeros(padding,length(image(1,:)))));
    Z = horzcat(zeros(length(Z(:,1)),padding),Z,(zeros(length(Z(:,1)),padding)));
    
    for x = 1:length(Z(:,1))
        for y = 1:length(Z(1,:))
            if Z(x,y) == 0
                Z(x,y) = 1;
            elseif Z(x,y) > 0
                Z(x,y) = colorshift;
            end
        end
    end
    
    [X,Y] = meshgrid(1:length(Z(:,1)),1:length(Z(:,1)));
    f = figure(i);
    set(f,'visible','off')
    newXvec = 1:.1:length(Z(:,1));
    newYvec = 1:.1:length(Z(:,1));
    [newX,newY] = meshgrid(newXvec,newYvec);
    newZ = interp2(X,Y,Z,newX,newY,'nearest');
%     newZ = imerode(newZ,ones(10));
    faces = delaunay(newX,newY);
    trisurf(faces,newX,newY,newZ)
        axis([1 length(Z(1,:)) 1.2 length(Z(:,1))])
        colormap(f, flipud(colormap(f)))
%         colorbar
        caxis([0 1])
        shading interp
%         title(label)
        view(0,90)
        axis off
     
    filename = strcat('MNIST', num2str(i),'_' , num2str(label), 'train_CLEAN.png');    
    saveas(f,filename);
    close
    disp(i)
% 	time1 = toc
endD
time2 = toc

disp(labels)