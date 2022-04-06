clc
clear

files = dir();

for i = 3:37
    filename = files(i).name;

    I = imread(filename);
    
    I = imresize(I,2);
    I = I(329:983, 439:1313, 1:3);

    I(:, 1:114, 1:3) = 255; 
    I(:, (875-82):875, 1:3) = 255; 
    I(1:49, :, 1:3) = 255; 
    I((656-71):656,:,1:3) = 255; 
    
    filename = strcat('new',filename);
    imwrite(I,filename)
end