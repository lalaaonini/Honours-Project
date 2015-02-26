% Here we will deal with Accuracy
% RecreatededHourBinaryAccuracy
% Binary Accuracy Results
B_RWSHH = [77,78,81];
B_RWSH = [78,78,83];
B_RMSHH = [76,77,81];
B_RMSH = [76,79,80];

set(gca,'FontSize',15)
set(gca,'FontName','Copperplate Gothic Bold')

%%Y = [B_RWSHH; B_RWSH ; B_RMSHH; B_RMSH];
Y = [B_RWSH ; B_RMSH];

figure;
h = bar(Y,'grouped','LineWidth',0.3);
grid on;

ylabel('Accuracy','FontName','Copperplate Gothic Bold','FontSize',15);
x_labels={'RWH'; 'RMH'};
set(gca,'YLim',[50 90])
set(gca,'YTick', [50:5:90])
set(gca,'YTickLabel',['50%';'55%';'60%';'65%';'70%';'75%';'80%';'85%';'90%'])
set(gca,'XTickLabel',x_labels)
set(gca,'XLim',[0 3])

set(gca,'FontSize',15)
set(gca,'FontName','Copperplate Gothic Bold')
rotateXLabels( gca(), 45)

l = cell(1,3);
l{1} = 'LDA';l{2} ='SVM';l{3} = 'K-NN';
legend(h,l)

% Here we will deal with FScore

B_RWSHH = [77,78,86];
B_RWSH = [77,78,85];
B_RMSHH = [68,72,74];
B_RMSH = [70,75,76];

Y2 = [ B_RWSH;; B_RMSH];

figure;
h2 = bar(Y2,'grouped','LineWidth',0.3);
grid on;

ylabel('F_1 Score','FontName','Copperplate Gothic Bold','FontSize',15);
x_labels={'RWH'; 'RMH'};
set(gca,'YLim',[50 90])
set(gca,'YTick', [50:5:90])
set(gca,'YTickLabel',['50%';'55%';'60%';'65%';'70%';'75%';'80%';'85%';'90%'])
set(gca,'XTickLabel',x_labels)
set(gca,'XLim',[0 3])

set(gca,'FontSize',15)
set(gca,'FontName','Copperplate Gothic Bold')
rotateXLabels( gca(), 45)

l = cell(1,3);
l{1} = 'LDA';l{2} ='SVM';l{3} = 'K-NN';
legend(h2,l)