clc; close all

file = "subject_10.mat";
data = load(file);

%splitting the file name
split_file = split(file,"_");
split_split_file = split(split_file(2),".");
subject_no = split_split_file(1);

%getting the signal itself
signal = data.SIGNAL;

col=2;
% PlotSignal(signal, 2, str2double(subject_no))


cond1 = find(signal(:,18) == 1); %eyes closed
cond2 = find(signal(:,19) == 1); %eyes open

indices = sort(vertcat(cond1,cond2));

plot(signal(:,1),signal(:,col),"k")
hold on

if cond1(1) < cond2(1) %if the eyes are first open
    colors = ["r","g"];
else
    colors = ["g","r"];
end

for i = 1:length(indices)
    t_closed = signal(indices(i):indices(i) + 5120,1);
    s_closed = signal(indices(i):indices(i) + 5120,col);
    plot(t_closed,s_closed,colors(rem(i,2)+1))
end

xlabel("Time (s)")
ylabel("Signal")
legend("whole test","eyes closed","eyes open","Location","best")
title("Subject " + subject_no + " Signal " + col)