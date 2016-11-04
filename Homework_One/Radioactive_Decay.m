%2.a
%clears all valriables to ensure accuracy between runs.
clearvars
% To is the starting year. 
To = 1;
% Tf is the end or target year.
Tf = 500;
% dt is the time step.
dt = .0001;
% T is the array in which we hold all the time values. It starts at To,
% increments by the time step, and ends at the target year, Tf.
T = To:dt:Tf;
% Qo is the amount of Radium-226 at the start time (100%).
Qo = 1;
% Q is the array in which we hold all of the Quantity values. we initialize
% it to all zeros,
Q(To:(Tf - To)/dt) = 0;

Q(1) = Qo;
decay.rate = 0.000427869;
t = To;
while t <= (Tf - To)/dt
    dq = decay.rate * Q(t);
    Q(t + 1) = Q(t) - dq * dt;
    t = t + 1;   
end
disp(Q((Tf - To)/dt));
plot(T,Q);