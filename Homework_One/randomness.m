%a,b.
%clears all valriables to ensure accuracy.
clearvars
%num.min is the minimum value that the sum of random numbers
%needs to be to satify the condition.
num.min = 100;
%num.trials is the total number of trials.
num.trials = 100000;
%trial is an iterator that represents the current trial.
trial = 1;
%A is an array that holds the values of each trial. intitalizes all values
%to 0.
A(1:num.trials) = 0;
%while the current trial is less than the number of trials:
while trial <= num.trials    
%i holds the sum of the random numbers.
i = 0;
%n holds the number of random numbers summed.
n = 0;
    %while the sum of rand. numbers is less than the min. value required,
    while i < num.min
        %add a rand number to i.
        i = i + rand;
        %increment n.
        n = n + 1;
    end
%stores a value of n for the current trial.
A(trial) = n;
%increments the trial number.
trial = trial + 1;    
end
% Note, I could not get the sum function to work without causing the last 
% trial to always return a value of 0, so I built my own.
% Answer is the avereage number of random numbers generated to acheive a
% sum of random numbers that at least equalied the target value.
answer = 0;
% for each trial,
for i = 1:num.trials
    % add it to the total.
    answer = answer + A(i);
end
% And divide by the number of trials to get the average.
answer = answer / num.trials;
disp(answer);


%c
%clears all valriables to ensure accuracy.
clearvars
% low.bound is the lower bound for the range of output we are looking for.
low.bound = 0.475;
% up.bound is the upper bound for the range of output we are looking for.
up.bound = 0.525;
% num.trials is the total number of trials.
num.trials = 1000000;
% trial is an iterator that represents the current trial.
trial = 1;
% A is an array that holds the values of each trial. intitalizes all values
%to 0.
A(1:num.trials) = 0;
% while the trial is less than the total number of trials.
while trial <= num.trials    
% i holds the rand number generated.
i = 0;
% n holds the number of random numbers summed.
n = 0;
    % while the sum of rand. numbers is less than the min. value required,
    while i < low.bound || i > up.bound
        % set i to rand.
        i = rand;
        % increment n.
        n = n + 1;
    end
% stores a value of n for the current trial.
A(trial) = n;
% increments the trial number.
trial = trial + 1;    
end
% Note, I could not get the sum function to work without causing the last 
% trial to always return a value of 0, so I built my own.
% Answer is the avereage number of random numbers generated to generate a
% number within the bounds specified.
answer = 0;
% for each trial,
for i = 1:num.trials
    % add it to the total.
    answer = answer + A(i);
end
% And divide by the number of trials to get the average.
answer = answer / num.trials;
disp(answer);


%d & e
%clears all valriables to ensure accuracy.
clearvars
% mar.error is the margin of error of the target mean.
mar.error = 0.01;
% up.bound is the upper bound for the range of output we are looking for.
target.mean = 0.5;
% low.bound is the lower bound for the range of output we are looking for.
low.bound = target.mean - mar.error;
% up.bound is the upper bound for the range of output we are looking for.
up.bound = target.mean + mar.error;
% num.trials is the total number of trials.
num.trials = 1000000;
% trial is an iterator that represents the current trial.
trial = 1;
% A is an array that holds the number of randomly generated numbers in each
% trial.
A(1:num.trials) = 0;
% while the trial is less than the total number of trials.
while trial <= num.trials    
% i holds the rand number generated.
i = 0;
% n holds the number of random numbers generated.
n = 0;
%sum is the sum of all random generated numbers. 
sum = 0;
%mean.n is the mean of the randomly generated numbers
mean.n = 1;
    while mean.n > up.bound || mean.n < low.bound
        i = rand;
        sum = sum + i;
        n = n + 1;
        mean.n = sum / n;
    end
    A(trial) = n;
    trial = trial + 1;
end
% Note, I could not get the sum function to work without causing the last 
% trial to always return a value of 0, so I built my own.
% Answer is the avereage number of random numbers generated to acheive a
% mean plus or minus the margin of error.
answer = 0;
% for each trial,
for i = 1:num.trials
    % add it to the total.
    answer = answer + A(i);
end
% And divide by the number of trials to get the average.
answer = answer / num.trials;
disp(answer);

