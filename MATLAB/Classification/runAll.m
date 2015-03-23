%% create a training and test set, then run the classification algorithms

numFeatures=10;
%% Children
x=compositeFeatures(monthSum,dayAverages,x_APOD,x_POW_ratio,x_ADV,x_corr,x_fourier);


%Baseline
baseline.acc=max([children_filtered.numChild, children_filtered.numNoChild])/numhouse;

%find the best features
%findOptFeatures;


%knn
[x_test,x_train,y_test,y_train]=create_test_set(numhouse,x_opt_knn_child.all,children_filtered.all);
knn.child=runKNN(x_train,x_test,y_train,y_test);
[knn.child.FPR,knn.child.TPR,knn.child.T,knn.child.AUC] = perfcurve(y_test,knn.child.score(:,2),1);
 
%logistic regression
[x_test,x_train,y_test,y_train]=create_test_set(numhouse,x_opt_log_reg_child.all,children_filtered.all);
log_reg.child=runLogReg(x_train,x_test,y_train,y_test,'c');
[log_reg.child.FPR,log_reg.child.TPR,log_reg_child.T,log_reg.child.AUC] = perfcurve(y_test,log_reg.child.predProb,1);
 
%random forest
[x_test,x_train,y_test,y_train]=create_test_set(numhouse,x_opt_rf_child.all,children_filtered.all);
randomForest.child= runRandomForest(x_train,x_test,y_train,y_test,'c');
[randomForest.child.FPR,randomForest.child.TPR, randomForest.child.T,randomForest.child.AUC] = perfcurve(y_test,randomForest.child.scores(:,2),1);
% 
% %Plot ROC
% plot(knn.FPR,knn.TPR,'b')
% hold on
% plot(log_reg.FPR,log_reg.TPR,'r')
% plot(randomForest.FPR,randomForest.TPR,'g')
% plot([0:0.1:1],[0:0.1:1],'color',[0.5 0.5 0.5])
% 
% knnAcc=knn.accuracy
% rfAcc=randomForest.accuracy
% lrAcc=log_reg.accuracy
% baselineAcc=baseline.acc

%% Social Grade

%logistic regression
[x_test,x_train,y_test,y_train]=create_test_set(numhouse,x_opt_log_reg_sg.all,social_grade.all);
log_reg.sg=runLogReg(x_train,x_test,y_train,y_test,'sg');
%[log_reg.sg.FPR,log_reg_sg.TPR,log_reg.sg.T,log_reg.sg.AUC] = perfcurve(y_test,log_reg.sg.predProb,1);

%knn
[x_test,x_train,y_test,y_train]=create_test_set(numhouse,x_opt_knn_social.all,social_grade.all);
knn.sg=runKNN(x_train,x_test,y_train,y_test);
[knn.sg.FPR,knn.sg.TPR,knn.sg.T,knn.sg.AUC] = perfcurve(y_test,knn.sg.score(:,2),1);

%random forest
[x_test,x_train,y_test,y_train]=create_test_set(numhouse,x_opt_rf_social.all,social_grade.all);
randomForest.sg=runRandomForest(x_train,x_test,y_train,y_test);
[randomForest.sg.FPR,randomForest.sg.TPR,randomForest.sg.T,randomForest.sg.AUC] = perfcurve(y_test,randomForest.sg.scores(:,2),1);
