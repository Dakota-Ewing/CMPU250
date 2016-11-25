% gravitational constant.
g = -9.81;

% spring constant.
k = 10;

%mass of object attached to end of spring.
m = 0.2;

% unweighted equilibrium length of spring.
unweighted_length = 1;

% initial weighted length of spring.
init_weight_length = 0.3;

% weighted displacement of spring.
weighted_disp = (m * g) / k;

% initial total length of spring.
init_spring_length = init_weight_length + unweighted_length + weighted_disp;



% To is the start time.
To = 1;
% Tf is the end time.
Tf = 12;
% dt is the time step.
dt = .02;

% steps is the total number of timesteps.
Steps = (Tf - To + 1)/dt;

% T is the array in which we hold all the time values.
T = To:dt:Tf;

% L is the array that holds all values of the length of the spring at a
% given time.
L(To:Steps) = 0;
L(To) = init_spring_length;

% V is the array that holds all values of the velocity of the weight at a
% given time.
V(To:Steps) = 0;
V(To) = 0;

%                              Functions                                 %
%------------------------------------------------------------------------%

a = @(lt) (g * m) - (k * (lt - unweighted_length));
dVdt = @(lt,vt,dt) vt + a(lt) * dt;
dPdt = @(lt,vt,dt) lt + dVdt(lt,vt,dt) * dt;
%                             Simulation                                 %
%------------------------------------------------------------------------%

%RK4
t = 1;
%while the iterator is less than or equal to the total number of steps:
while t <= Steps
    velOne = dVdt(L(t), V(t), dt);
    delOne = dPdt(L(t), V(t), dt);
    velTwo = dVdt((L(t) + delOne)/2, (V(t) + velOne)/2, dt/2);
    delTwo = dPdt((L(t) + delOne)/2, (V(t) + velOne)/2, dt/2);
    velThree = dVdt((L(t) + delTwo)/2, (V(t) + velTwo)/2, dt/2);
    delThree = dPdt((L(t) + delTwo)/2, (V(t) + velTwo)/2, dt/2);
    velFour = dVdt((L(t) + delThree)/2, (V(t) + velThree)/2, dt/2);
    delFour = dPdt((L(t) + delThree)/2, (V(t) + velThree)/2, dt/2);
    V(t + 1) = (velOne + 2 * velTwo + 2 * velThree + velFour)/6;
    L(t + 1) = (delOne + 2 * delTwo + 2 * delThree + delFour)/6;
    % increment t.
    t = t + 1;   
end

plot(1:Steps, L(1:Steps));
