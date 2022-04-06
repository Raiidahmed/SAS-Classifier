clc
clear 

data = load('Flipped 100 Epochs Training.csv');

epochs = data(:,1);
trainloss = data(:,2);
validloss = data(:,3);
accuracy = data(:,4);


subplot(1,2,1)
    hold on
    plot(epochs, trainloss)
    plot(epochs, accuracy)
         title('Response of Training for 100 Epochs', 'FontSize', 20)
         xlabel('Epochs', 'FontSize', 20)
         ylabel('Portion of Set', 'FontSize', 20)
         legend('Training Loss','Accuracy', 'FontSize', 20)

subplot(1,2,2)
    plot(epochs, validloss)
    title('Response of Training for 100 Epochs', 'FontSize', 20)
         xlabel('Epochs', 'FontSize', 20)
         ylabel('Portion of Set', 'FontSize', 20)
         legend('Validation Loss', 'FontSize', 20)
