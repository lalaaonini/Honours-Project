%% Average total usage for each day of the week for each household
function [dayAverages] = ATDOW(numhouse,daylength,numpts,x_filtered,children_filtered,social_grade)

    dayAverages.all = zeros(numhouse,7);
    for i = 1:numhouse
        k=1;
        for j=1:daylength:numpts
        dayAverages.all(i,k)=dayAverages.all(i,k)+sum(x_filtered(i,j:j+daylength-1));
        k=k+1;
            if k==8
                k=1;
            end
        end
    end
    
    
    dayAverages.all=dayAverages.all/daylength;
    dayAverages.child = zeros(children_filtered.numChild,7);
    dayAverages.noChild = zeros(children_filtered.numNoChild,7);
    j=1;
    k=1;
    
    dayAverages.sgA=[];
    dayAverages.sgB=[];
    dayAverages.sgC1=[];
    dayAverages.sgC2=[];
    dayAverages.sgD=[];
    dayAverages.sgE=[];
    
    for i= 1:numhouse
        if children_filtered.all(i)==0
            dayAverages.noChild(j,:)=dayAverages.all(i,:);
            j=j+1;
        elseif children_filtered.all(i)==1
            dayAverages.child(k,:)=dayAverages.all(i,:);
            k=k+1;
        end
        
        if social_grade.all(i)==1
            dayAverages.sgE=[dayAverages.sgE;dayAverages.all(i,:)];
        elseif social_grade.all(i)==2
            dayAverages.sgD=[dayAverages.sgD;dayAverages.all(i,:)];
        elseif social_grade.all(i)==3
            dayAverages.sgC2=[dayAverages.sgC2;dayAverages.all(i,:)];
        elseif social_grade.all(i)==4
            dayAverages.sgC1=[dayAverages.sgC1;dayAverages.all(i,:)];
        elseif social_grade.all(i)==5
            dayAverages.sgB=[dayAverages.sgB;dayAverages.all(i,:)];
        elseif social_grade.all(i)==6
            dayAverages.sgA=[dayAverages.sgA;dayAverages.all(i,:)];
        end
    end
end