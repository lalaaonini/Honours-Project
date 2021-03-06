function acc=crossval_run_knn(x_train,y_train,task,k)

    %cross validation
    shuffled=shuffle(x_train,y_train);
    x_shuffled=shuffled.x;
    y_shuffled=shuffled.y;
    
    numFolds=5;%5 fold cross validation
    splitt=split(x_shuffled,y_shuffled,numFolds);
    x_split=splitt.x;
    y_split=splitt.y;
    accuracy=zeros(numFolds,1);
    for i=1:numFolds
       x_trn=[];
       y_trn=[];
       x_tst=x_split{i};
       y_tst=y_split{i}';

       for j=1:numFolds
           if j~=i
              x_trn=[x_trn;x_split{j}];
              y_trn=[y_trn;y_split{j}'];
           end
       end
       acc.each(i)=runIt(x_trn,x_tst,y_trn,y_tst,task,k);
    end
    
    acc.ave=sum(acc.each)/numFolds;
    

end

function accuracy=runIt(x_train,x_test,y_train,y_test,task,k)
    %if strmatch(task,{'child','children','c'},'exact')~=0
        
        mdl = fitcknn(x_train,y_train,'NumNeighbors',k,'Distance','euclidean');
        y_hat = predict(mdl,x_test);


        accuracy=sum(y_test==y_hat)/length(y_test);
    
%     else 
%         y_train;
%         [b,dev,stats] = mnrfit(x_train,y_train,'model','ordinal'); % Logistic regression
%         size(b);
%         size(x_test);
%         pihat = mnrval(b,x_test,'model','ordinal');
% 
%         [m_prob,y_hat]= max(pihat');
% 
%         accuracy=sum(y_test==y_hat')/length(y_test);
%     end

    if strmatch(task,{'child','children','c'},'exact')~=0
        TP=sum(y_hat==0 & y_hat==y_test);
        TN=sum(y_hat==1 & y_hat==y_test);
        FP=sum(y_hat==0 & y_hat~=y_test);
        FN=sum(y_hat==1 & y_hat~=y_test);

        precision=TP/(TP+FP);
        recall=TP/(TP+FN);
        f_one=2*(precision*recall)/(precision+recall);
    end

end

function out=shuffle(x_in,y_in)
    r=randperm(length(y_in));
    for i=1:length(y_in)
        out.x(i,:)=x_in(r(i),:);
        out.y(i)=y_in(r(i));
    end
end

function out=split(x_in,y_in,k)
    splitOn=ceil(length(y_in)/k);
    cross_counter=1;
    split_counter=1;
    while cross_counter<=k
        out.x{cross_counter}=x_in(split_counter:split_counter+splitOn-2,:);
        out.y{cross_counter}=y_in(split_counter:split_counter+splitOn-2);
        cross_counter=cross_counter+1;
        split_counter=split_counter+splitOn;
    end
end