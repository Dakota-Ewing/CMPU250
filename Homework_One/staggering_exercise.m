% 3.a & c
%clears all valriables to ensure accuracy between runs.
clearvars
% W is the number of random walkers.
W = 20;
% B is the boundary for the walkers + or - B from the origin.
B = 5;
% numSteps is the number of steps each walker takes.
numSteps = 5;
% Walkers is an array that holds all the positions of all of the walkers,
% where the ith dimention differentiates each walker, and the jth dimention 
% is each step for each walker. 
% All values are intitalized to zero, and this is also allows us to 
% implement the first step in the declaration. 
Walkers(1:W,1:numSteps) = 0;
%col is the number of walkers that collide with the boundary.
colide(1:W,1:numSteps) = 0;
%col.step is the sum total of steps that all frozen walkers have taken
%before hitting the wall.
colidestep(1:W) = 0;
% remaining is the number of walkers that have not hit the boundary at
% a given time.
remaining(1:numSteps) = W;
%for all walkers:
for i = 1:W
    %for step 2 onwards:
    for j = 2:numSteps
        % If the walker is within the boundary:
        if Walkers(i,j - 1) < B && Walkers(i,j - 1) > -B
           % The walker i at step j is set to the walkers previous value,
           % plus randn.
           Walkers(i,j) = Walkers(i,j - 1) + randn;
        % Else, the walker is out of the boundary:
        else
            % and continues in the same position as the last step.
            Walkers(i,j) = Walkers(i,j - 1);
            % set the walker to have collided with the wall.
              colide(i,j) = 1; 
            % if the walker has not already hit the boundary
            if colidestep(i) == 0
               % set the colidestep of the walker to the last step
              colidestep(i) = j -1;
              % decrements the reaming number of walkers that have not hit
              % the boundary.
              %remaining(i) = remaining(i -1) - 1;
            end
        end
    end
end
for i = 1:numSteps 
    remaining(i) = W - sum(colide(1:W,i));
end
% returns the average number of steps walkers that have hit the wall have
% taken when they hit the wall.
answer = sum(colidestep) / sum(colide(1:W,numSteps));
disp(answer);
dead = sum(colide(1:W,numSteps));
disp(dead);

%b
figure();
%for each walker:
for k = 1:W
    %plot the walkers position on the x axis, and the step number on the y
    %axis:
    plot(Walkers(k, 1:numSteps), 1:numSteps);
    hold on;
    drawnow;  
end
%d
figure();
%plot the step number on the x axis, and the number of remaining walkers 
% on the y axis:
plot(1:numSteps,remaining(1:numSteps)); 





