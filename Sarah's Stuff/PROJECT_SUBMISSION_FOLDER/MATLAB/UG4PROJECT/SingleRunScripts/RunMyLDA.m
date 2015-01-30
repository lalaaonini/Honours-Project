function [Precision_micro,...
        Precision_Macro,...
        Recall_micro,...
        Recall_Macro,...
        Fscore_Macro,...
        Fscore_micro,...
        Acc,...
        Confusion]...
        = RunMyLDA(FeatureMatrix,ClassLabels)
    
    
    
X = FeatureMatrix;
Y = ClassLabels;

% call the Knn_Kfold Script
LDA_10fold

Precision_micro = Precision_mu;
Precision_Macro = Precision_M;

Recall_micro = Recall_mu;
Recall_Macro = Recall_M;

Fscore_micro = F1Score_mu;
Fscore_Macro = F1Score_M;
Acc          = Accuracy;
Confusion    = ConfMat;

%Should also return precision, recall, mu and M
end