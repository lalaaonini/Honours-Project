%%% Wanting to Plot the class vs features %%%%

function  plotMyClassFeatures(X,Y,NameOfFeatures)

% assuming that I'm using this for 6 classes

if length(unique(Y)) == 6
    One     =      find(Y==1);
    Twos    =      find(Y==2);
    Threes  =      find(Y==3);
    Fours   =      find(Y==4);
    Fives   =      find(Y==5);
    Sixes   =      find(Y==6);
    
    for i =1: length(One)
       TheOnes(i,:) = X(One(i),:);
    end
    
    for j = 1 : length(Twos)
        TheTwos(j,:) = X(Twos(j),:);
    end
    
    for k = 1: length(Threes)
        TheThrees(k,:) = X(Threes(k),:);
    end
    
    for l = 1:length(Fours)
        TheFours(l,:) = X(Fours(l),:);
    end
    
    for m = 1:length(Fives)
        TheFives(m,:) = X(Fives(m),:);
    end
    
    for n = 1:length(Sixes)
        TheSixes(n,:) = X(Sixes(n),:);
    end
    
    TheMeans = [mean(TheOnes), mean(TheTwos),mean(TheThrees),...
        mean(TheFours),mean(TheFives), mean(TheSixes)];
    
    TheSTDs = [std(TheOnes),std(TheTwos),std(TheThrees),...
        std(TheFours),std(TheFives),std(TheSixes)];
    
    
    figure;
    errorbar(TheMeans,TheSTDs,'s');
    
    title(NameOfFeatures);
    ylabel(NameOfFeatures);
    xlabel('Class');
    
    
    % Change the labels for the tick marks on the x-axis
    ClassLabelTicks = {'1', '2', '3','4','5','6+'};
    set(gca, 'XTick', 1:6, 'XTickLabel', ClassLabelTicks);
    
    

end

end