close all;
clear;

addpath('utils');

%% pre-calculated trajectories
%trajhandle = @traj_line;
%trajhandle = @traj_helix;

%% Trajectory generation with waypoints
%% You need to implement this
trajhandle = @traj_generator;
%trajhandle = @traj_generator_avg_speed;
waypoints = [0    0   0;
             1    1   1;
             2    0   2;
             3    -1  1;
             4    0   0]';
%          waypoints = [0    0   0;
%              10    10   10]';
% waypoints = [0    0   0;
%              1    2   1;
%              2    0   2;
%              3    -1  1;
%              4    0   0;
%              5  1  1;
%              6 2 2;
%              6.5 3 2]';
% waypoints = [0    2   0;
%              1    2   1;
%              2    0   2;
%              3    -1  1;
%              4    2   3;
%              5  4  5;
%              5 5 5;
%              5 5 3;
%              5 5 0]';
trajhandle([],[],waypoints);


%% controller
controlhandle = @controller;


% Run simulation with given trajectory generator and controller
% state - n x 13, with each row having format [x, y, z, xdot, ydot, zdot, qw, qx, qy, qz, p, q, r]
%[t, state] = simulation_3d(trajhandle, controlhandle);
[t, state, QP] = simulation_3d_new(trajhandle, controlhandle);

