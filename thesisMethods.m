clc;
clear;
%%
% cd frog
cd rust
%%
dinfo = dir('*.txt');
%% Method 1: rank by max num of labels
count = [];
for K = 1 : length(dinfo)
    tempCount = 0;
    thisfilename = dinfo(K).name;  %just the name
    thisdata = load(thisfilename); %load just this file
    tot = length(thisdata(:,1));
    for i = 1:tot
%       if(thisdata(i,1) == 20)
      if(thisdata(i,1) == 21)
          tempCount = tempCount+1;
      end
    end
    count = [count; tempCount];
end

%
[out,idx] = sort(count,'descend');
%%

top5 = idx(1:100);
newD = dinfo(top5(:));

%%
smallArea = [];
for K = 1 : length(newD)
    tempCount = 0;
    thisfilename = dinfo(K).name;  %just the name
    thisdata = load(thisfilename); %load just this file
    tot = length(thisdata(:,1));
    for i = 1:tot
      if(thisdata(i,1) == 20)
%       if(thisdata(i,1) == 21)
          tempCount = tempCount+1;
          smallArea = [smallArea; thisdata(i,4)*thisdata(i,5)];
      end
    end
    count = [count; tempCount];
end
figure;
histogram(smallArea);
title('Label Area Histogram of frogeye');
xlabel('Label Area');
% xlim([0,0.02]);
grid;

%%
disp('result');
top5 = idx(1:20);
for i = 1: length(top5)
    top5Name = dinfo(top5(i)).name;
    disp(top5Name);
end

%%
% cd frog
cd rust
dinfo = dir('*.txt');
%% Method 2: rank by tot areas of bounding boxes (failed)
area = [];
for K = 1 : length(dinfo)
    tempArea = 0;
    thisfilename = dinfo(K).name;  %just the name
    thisdata = load(thisfilename); %load just this file
    tot = length(thisdata(:,1));
    for i = 1:tot
%       if(thisdata(i,1) == 20)
      if(thisdata(i,1) == 21)
          tempArea = tempArea + thisdata(i,4)*thisdata(i,5);
      end
    end
    area = [area; tempArea];
end

%%
[out,idx] = sort(area,'descend');

%%
disp('result');
top5 = idx(1:10);
for i = 1: length(top5)
    top5Name = dinfo(top5(i)).name;
    disp(top5Name);
end

%% Method 3: Filtered label num with top images of tot areas
% cd frog
cd rust
dinfo = dir('*.txt');
%%
count = [];
area = [];
avgArea = [];
avgArea2 = [];
for K = 1 : length(dinfo)
    tempCount = 0;
    tempArea = 0;
    thisfilename = dinfo(K).name;  %just the name
    thisdata = load(thisfilename); %load just this file
    tot = length(thisdata(:,1));
    for i = 1:tot
%       if(thisdata(i,1) == 20)
      if(thisdata(i,1) == 21)
          tempCount = tempCount+1;
          tempArea = tempArea + thisdata(i,4)*thisdata(i,5);
      end
      
    end
    tempAVG = tempArea/tempCount*100;
%     tempAVG2 = ;
    count = [count; tempCount];
    area = [area; tempArea];
    avgArea = [avgArea; tempAVG];
end

%%
medianCount = median(count);
meanCount = mean(count);
meanArea = mean(area);
medianArea = median(area);
%%
scale = 0.7/0.5;
ThreedBCount = meanCount*(scale);
%%
pos = find(count(:) >= ThreedBCount);

restCount = count(pos(:));
restArea = area(pos(:));

%%
[out,idx] = sort(restCount,'descend');
see = restArea(idx(:));

%%
[out,idx] = sort(count,'descend');
see2 = area(idx(:));
see4 = count(idx(:));
%%
[out,idx] = sort(count,'descend');
see3 = avgArea(idx(:));
see3 = see3(1:length(see3)-1);
meanSee3 = mean(see3);

%%
pos = find(count(:) >= 1);
restCount = count(pos(:));
restArea = area(pos(:));
[out,idx] = sort(restCount,'descend');
testA = restArea(idx(:));
testC = restCount(idx(:));
TestI2 = testC./testA/1000;

%%
[out,idx] = sort(restArea,'descend');
disp('result');
top5 = idx(1:10);
for i = 1: length(top5)
    top5Name = dinfo(top5(i)).name;
    disp(top5Name);
end

%% Method 4: count intensity
% cd frog
cd rust
dinfo = dir('*.txt');
%%
count = [];
area = [];
for K = 1 : length(dinfo)
    tempCount = 0;
    tempArea = 0;
    thisfilename = dinfo(K).name;  %just the name
    thisdata = load(thisfilename); %load just this file
    tot = length(thisdata(:,1));
    for i = 1:tot
%       if(thisdata(i,1) == 20)
      if(thisdata(i,1) == 21)
          tempCount = tempCount+1;
          tempArea = tempArea + thisdata(i,4)*thisdata(i,5);
      end
      
    end
%     tempAVG2 = ;
    count = [count; tempCount];
    area = [area; tempArea];
end

%%
figure;
histogram(count);
title('Count Histogram of Frogeye Leaf Spot');
xlabel('Count');
grid;
%%
figure;
histogram(area);
title('Total Area Histogram of Frogeye Leaf Spot');
xlabel('Area');
grid;
%%
pos = find(count(:) >= 1);

restCount = count(pos(:));
restArea = area(pos(:));
CountIntensity = restCount./restArea;

%%
figure;
histogram(CountIntensity);
title('Count Intensity Histogram of Frogeye Leaf Spot');
xlabel('Count Intensity');
grid;
%%
[out,idx] = sort(CountIntensity);
disp('result');
top5 = idx(1:10);
for i = 1: length(top5)
    top5Name = dinfo(top5(i)).name;
    disp(top5Name);
end
%% Method 5: rescaled count+area
% cd frog
cd rust
dinfo = dir('*.txt');
%%
count = [];
area = [];
for K = 1 : length(dinfo)
    tempCount = 0;
    tempArea = 0;
    thisfilename = dinfo(K).name;  %just the name
    thisdata = load(thisfilename); %load just this file
    tot = length(thisdata(:,1));
    for i = 1:tot
%       if(thisdata(i,1) == 20)
      if(thisdata(i,1) == 21)
          tempCount = tempCount+1;
          tempArea = tempArea + thisdata(i,4)*thisdata(i,5);
      end
      
    end
%     tempAVG2 = ;
    count = [count; tempCount];
    area = [area; tempArea];
end
%%
pos = find(count(:) >= 1);

restCount = count(pos(:));
restArea = area(pos(:));

%%
countScale = rescale(restCount,0,100);
areaScale = rescale(restArea,0,100);
totScore = countScale + areaScale;
%%
[out,idx] = sort(totScore);
disp('result');
top5 = idx(1:10);
for i = 1: length(top5)
    top5Name = dinfo(top5(i)).name;
    disp(top5Name);
end

%% Method 6: rescaled count+50%area
% cd frog
cd rust
dinfo = dir('*.txt');

count = [];
area = [];
for K = 1 : length(dinfo)
    tempCount = 0;
    tempArea = 0;
    thisfilename = dinfo(K).name;  %just the name
    thisdata = load(thisfilename); %load just this file
    tot = length(thisdata(:,1));
    for i = 1:tot
%       if(thisdata(i,1) == 20)
      if(thisdata(i,1) == 21)
          tempCount = tempCount+1;
          tempArea = tempArea + thisdata(i,4)*thisdata(i,5);
      end
      
    end
    count = [count; tempCount];
    area = [area; tempArea];
end

pos = find(count(:) >= 1);

restCount = count(pos(:));
restArea = area(pos(:));


countScale = rescale(restCount,0,100);
areaScale = rescale(restArea,0,100);
totScore = countScale + areaScale;

[out,idx] = sort(totScore);
disp('result');
top5 = idx(1:10);
for i = 1: length(top5)
    top5Name = dinfo(top5(i)).name;
    disp(top5Name);
end

%% Method 7: filtered area only consider count
% cd frog
cd rust
dinfo = dir('*.txt');

count = [];
area = [];
smallArea = [];
for K = 1 : length(dinfo)
    tempCount = 0;
    tempArea = 0;
    thisfilename = dinfo(K).name;  %just the name
    thisdata = load(thisfilename); %load just this file
    tot = length(thisdata(:,1));
    for i = 1:tot
%       if(thisdata(i,1) == 20)
      if(thisdata(i,1) == 21)
          tempCount = tempCount+1;
          tempArea = tempArea + thisdata(i,4)*thisdata(i,5);
          smallArea = [smallArea; thisdata(i,4)*thisdata(i,5)];
      end
      
    end
    count = [count; tempCount];
    area = [area; tempArea];
end

pos = find(count(:) >= 1);

restCount = count(pos(:));
restArea = area(pos(:));

%%
figure;
histogram(smallArea);
title('Label Area Histogram of Rust');
xlabel('Label Area');
xlim([0,0.02]);
grid;

%% 
clc;
clear;
%%
cd frog
% cd rust
dinfo = dir('*.txt');

%%
count = [];
smallArea = [];
bigBool = [];
for K = 1 : length(dinfo)
    tempBool = 0;
    tempCount = 0;
    tempArea = 0;
    thisfilename = dinfo(K).name;  %just the name
    thisdata = load(thisfilename); %load just this file
    tot = length(thisdata(:,1));
    for i = 1:tot
      if(thisdata(i,1) == 20)
%       if(thisdata(i,1) == 21)
          tempCount = tempCount+1;
          smallArea = [smallArea; thisdata(i,4)*thisdata(i,5)];
      end
      
    end
    for m = 1:length(smallArea)
        if smallArea(m) >= 0.15
%         if smallArea(m) >= 0.3
            tempBool = 1;
        end
    end
    count = [count; tempCount];
    bigBool = [bigBool; tempBool];
end

pos = find((count(:) >= 1)&(bigBool(:) == 0));

restCount = count(pos(:));
newD = dinfo(pos(:));
%%
% countScale = rescale(restCount,0,100);
% totScore = countScale;

[out,idx] = sort(restCount,'descend');
disp('result');
top5 = idx(1:11);
for i = 1: length(top5)
    top5Name = newD(top5(i)).name;
    disp(top5Name);
end

%% Method 8: count + effective label areas
%%
clc;
clear;
%%
% cd frog
cd rust
%%
dinfo = dir('*.txt');
%%
count = [];
area = [];
bigArea = [];
for K = 1 : length(dinfo)
    tempCount = 0;
    tempArea = 0;
    tempBig = 0;
    thisfilename = dinfo(K).name;  %just the name
    thisdata = load(thisfilename); %load just this file
    tot = length(thisdata(:,1));
    for i = 1:tot
%       if(thisdata(i,1) == 20)
      if(thisdata(i,1) == 21)
          tempCount = tempCount+1;
%           if (thisdata(i,4)*thisdata(i,5) <= 0.15)
          if (thisdata(i,4)*thisdata(i,5) <= 0.3)
                tempArea = tempArea + thisdata(i,4)*thisdata(i,5);
          else
              tempBig = tempBig + thisdata(i,4)*thisdata(i,5);
          end
      end
      
    end
    count = [count; tempCount];
    area = [area; tempArea];
    bigArea = [bigArea; tempBig];
end

pos = find(count(:) >= 1);

restCount = count(pos(:));
restArea = area(pos(:));
restBig = bigArea(pos(:));
newD = dinfo(pos(:));
%% Method 8
countScale = rescale(restCount,0,100);
areaScale = rescale(restArea,0,100);
totScore = countScale+areaScale;
[out,idx] = sort(totScore,'descend');
disp('result');
top5 = idx(1:10);
for i = 1: length(top5)
    top5Name = newD(top5(i)).name;
    disp(top5Name);
end
%% Method 9
countScale = rescale(restCount,0,100);
areaScale = rescale(restArea,0,50);
bigScore = rescale(restBig,0,50);
totScore = countScale+areaScale;
[out,idx] = sort(totScore,'descend');
disp('result');
top5 = idx(1:10);
for i = 1: length(top5)
    top5Name = newD(top5(i)).name;
    disp(top5Name);
end
%% Method 10
countScale = rescale(restCount,0,50);
areaScale = rescale(restArea,0,100);
totScore = countScale+areaScale;
[out,idx] = sort(totScore,'descend');
disp('result');
top5 = idx(1:10);
for i = 1: length(top5)
    top5Name = newD(top5(i)).name;
    disp(top5Name);
end
%% Method 11
countScale = rescale(restCount,0,100);
areaScale = rescale(restArea,0,25);
totScore = countScale+areaScale;
[out,idx] = sort(totScore,'descend');
disp('result');
top5 = idx(31:50);
for i = 1: length(top5)
    top5Name = newD(top5(i)).name;
    disp(top5Name);
end