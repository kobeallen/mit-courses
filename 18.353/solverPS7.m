% This is the first code that you will need to complete Problem 4 for P-Set
% 3.  This code and the code systemPS3.m will be used to simulate the
% system presented in the problem statement.  In its original state it will
% solve the ode x_dot = r-x.  You will need to tweak various portions of
% the code to complete the problem.

% This code is the "solver"  it takes in the initial condition and uses the
% function ode45 to numerically solve the system of equations which are in
% the "system" file which in this case is systemPS3.m.

% After you input modify the parameter and the system, select the initial
% condition and run the code.  Within the work environment you will have a
% couple new variables T and Y which are the time and system values as a
% function of time.  You will be responsible for creating a couple of
% plots.  You can either write the codes in the Command Window or you can
% add your lines of code to the bottom of this code.
s = 5;

sguide = [-s:s/8:s];
grid = [];
for i = 1:length(sguide)
    for j = 1:length(sguide)
        grid = [grid, [sguide(i); sguide(j)]];
    end
end

for i = 1:length(grid)
       
        [T,Y] = ode45(@systemPS7,[0:.1:10],grid(:,i)); % This is the solving command line.  
                    % It has a couple inputs that you should understand.  These
                    % are discussed in the MATLAB Primer.

        %  If you want the code to create the plot after it solves the system you
        %  should input your lines of code here.

        subplot(2,1,1);
        plot(Y(:,1),Y(:,2),'k','LineWidth',2)
        axis([-4 4 -4 4])
        hold on
        
        subplot(2,1,2);  
        if (i >= length(grid) - 5)
            [T,Y] = ode45(@systemPS7,[0:.1:100],grid(:,i)); % This is the solving command line.  
            plot(T,Y(:,1),'k', 'LineWidth',2) 
            hold on
        end
 
end

subplot(2,1,1);
xlabel('$$u$$','FontSize',16,'interpreter','latex')
ylabel('$$\dot{u}$$','FontSize',16,'interpreter','latex')
title('Phase Portrait with $$\epsilon = 0.1 $$','FontSize',16,'interpreter','latex')
set(gca,'FontSize',14)

subplot(2,1,2);
xlabel('$$t$$', 'FontSize',16,'interpreter','latex')
ylabel('$$u$$','FontSize',16,'interpreter','latex')
title('Displacement with $$\epsilon = 0.1 $$','FontSize',16,'interpreter','latex')
set(gca,'FontSize',14)