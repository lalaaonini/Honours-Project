function SVM_Binary(FileName,DirectoryName)

ones(10)*ones(10);

WorkingfileName = FileName;

length_of_file_name = length(WorkingfileName);
length_file_name_without_extention = length_of_file_name - 4;
ChosenMatrix = WorkingfileName(1:length_file_name_without_extention);
ChosenFeatures = ChosenMatrix;
    
toWorkWith = sprintf('%s/%s',DirectoryName, WorkingfileName);

% load the features to work with
 load(toWorkWith)

 % Turn Labels into binary class labels

    BInY = BinarizeMyClassLabels(InY);
    
    % Start by removing outliers
    [InX,BInY,NumberRemoved] = RemoveOutliers(InX,BInY);

    % Balance The classes
    [InX,BInY] = EvenMyBinaryClasses(InX,BInY);
    
    % Normalize columns to have mean 0, std 1
    InX = zscore(InX);
    
    [NumberOfInstances,NumberOfFeatures] = size(InX);
    
    %Methods
    % CFS
    % FCBF
    % Fisher

    InBinY = BInY;
    % Binary-Class
[CFS_B,cfs_bin_columns,FCBF_B,fcbf_bin_columns,...
Fisher_B,fisher_bin_columns] = FSMyMatrix(InX,InBinY);

    
%Original Matrix binary Class
[Orig_B_SVM_Precision_Macro,...
 Orig_B_SVM_Precision_micro,...
 Orig_B_SVM_Recall_Macro,...
 Orig_B_SVM_Recall_micro,...
 Orig_B_SVM_F1Score_Macro,...
 Orig_B_SVM_F1Score_micro, ...
 Orig_B_SVM_Final__Accuracy,...
 Orig_B_SVM_Best_Cost,...
 Orig_B_SVM_Best_Gamma,...
 Orig_B_SVM_Final_ConfMatrix,...
 Orig_B_SVM_Final_Inconclusive] ...
    = RunMySVM(InX,BInY);

WriteMySVMFile(ChosenFeatures,...
'Original_Matrix',...
'Binary',...
Orig_B_SVM_Precision_Macro,...
 Orig_B_SVM_Precision_micro,...
 Orig_B_SVM_Recall_Macro,...
 Orig_B_SVM_Recall_micro,...
 Orig_B_SVM_F1Score_Macro,...
 Orig_B_SVM_F1Score_micro, ...
 Orig_B_SVM_Final__Accuracy,...
 Orig_B_SVM_Best_Cost,...
 Orig_B_SVM_Best_Gamma,...
 Orig_B_SVM_Final_ConfMatrix,...
 Orig_B_SVM_Final_Inconclusive);

%CFS Binary Class
[CFS_B_SVM_Precision_Macro,...
 CFS_B_SVM_Precision_micro,...
 CFS_B_SVM_Recall_Macro,...
 CFS_B_SVM_Recall_micro,...
 CFS_B_SVM_F1Score_Macro,...
 CFS_B_SVM_F1Score_micro, ...
 CFS_B_SVM_Final__Accuracy,...
 CFS_B_SVM_Best_Cost,...
 CFS_B_SVM_Best_Gamma,...
 CFS_B_SVM_Final_ConfMatrix,...
 CFS_B_SVM_Final_Inconclusive] ...
    = RunMySVM(CFS_B,BInY);

WriteMySVMFile(ChosenFeatures,...
'CFS_Matrix',...
'Binary',...
CFS_B_SVM_Precision_Macro,...
 CFS_B_SVM_Precision_micro,...
 CFS_B_SVM_Recall_Macro,...
 CFS_B_SVM_Recall_micro,...
 CFS_B_SVM_F1Score_Macro,...
 CFS_B_SVM_F1Score_micro, ...
 CFS_B_SVM_Final__Accuracy,...
 CFS_B_SVM_Best_Cost,...
 CFS_B_SVM_Best_Gamma,...
 CFS_B_SVM_Final_ConfMatrix,...
 CFS_B_SVM_Final_Inconclusive);

%FCBF Binary Class
[FCBF_B_SVM_Precision_Macro,...
 FCBF_B_SVM_Precision_micro,...
 FCBF_B_SVM_Recall_Macro,...
 FCBF_B_SVM_Recall_micro,...
 FCBF_B_SVM_F1Score_Macro,...
 FCBF_B_SVM_F1Score_micro, ...
 FCBF_B_SVM_Final__Accuracy,...
 FCBF_B_SVM_Best_Cost,...
 FCBF_B_SVM_Best_Gamma,...
 FCBF_B_SVM_Final_ConfMatrix,...
 FCBF_B_SVM_Final_Inconclusive]...
    = RunMySVM(FCBF_B,BInY);

WriteMySVMFile(ChosenFeatures,...
'FCBF_Matrix',...
'Binary',...
FCBF_B_SVM_Precision_Macro,...
 FCBF_B_SVM_Precision_micro,...
 FCBF_B_SVM_Recall_Macro,...
 FCBF_B_SVM_Recall_micro,...
 FCBF_B_SVM_F1Score_Macro,...
 FCBF_B_SVM_F1Score_micro, ...
 FCBF_B_SVM_Final__Accuracy,...
 FCBF_B_SVM_Best_Cost,...
 FCBF_B_SVM_Best_Gamma,...
 FCBF_B_SVM_Final_ConfMatrix,...
 FCBF_B_SVM_Final_Inconclusive);

%Fisher Binary Class
[Fisher_B_SVM_Precision_Macro,...
 Fisher_B_SVM_Precision_micro,...
 Fisher_B_SVM_Recall_Macro,...
 Fisher_B_SVM_Recall_micro,...
 Fisher_B_SVM_F1Score_Macro,...
 Fisher_B_SVM_F1Score_micro, ...
 Fisher_B_SVM_Final__Accuracy,...
 Fisher_B_SVM_Best_Cost,...
 Fisher_B_SVM_Best_Gamma,...
 Fisher_B_SVM_Final_ConfMatrix,...
 Fisher_B_SVM_Final_Inconclusive] ...
    = RunMySVM(Fisher_B,BInY);

WriteMySVMFile(ChosenFeatures,...
'Fisher_Matrix',...
'Binary',...
Fisher_B_SVM_Precision_Macro,...
 Fisher_B_SVM_Precision_micro,...
 Fisher_B_SVM_Recall_Macro,...
 Fisher_B_SVM_Recall_micro,...
 Fisher_B_SVM_F1Score_Macro,...
 Fisher_B_SVM_F1Score_micro, ...
 Fisher_B_SVM_Final__Accuracy,...
 Fisher_B_SVM_Best_Cost,...
 Fisher_B_SVM_Best_Gamma,...
 Fisher_B_SVM_Final_ConfMatrix,...
Fisher_B_SVM_Final_Inconclusive);


end