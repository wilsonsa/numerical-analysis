clc
clear all
close all

load Tesla_2017.mat

Stock_2017 = Stock_2017(1:100);
n = length(Stock_2017);
Time = linspace(1,n,n);
n = length(Time);

Cost = @(x,y) sum((Stock_2017 - (Time.*x + y)).^2)/n;
dCost = @(x,y) sum(2*((Stock_2017 - (Time.*x + y))).*[-Time;-ones(1,n)],2); 
% sum function evaluates row-wise sum by default. We need to evaluate column-wise sum
guess = [0.4;160];
step_size = 1e-6;
tol = 1e-8;

[guess] = gradient_descent(dCost,guess,step_size,tol)


[a,b] = meshgrid(0.5:0.01:1.2, 210:0.1:240);
Z = zeros(size(a,1),size(a,2));
for i = 1:size(a,1)
    for j = 1:size(a,2)
        Z(i,j) =  Cost(a(i,j),b(i,j));
    end
end


figure
surf(a,b,Z);
xlabel('Parameter a','FontSize',16);
ylabel('Parameter b','FontSize',16);
zlabel('Error','FontSize',16)
title('Surf Plot','FontSize',16);

figure
contourf(a,b,Z,20,'ShowText','on');
xlabel('Parameter a','FontSize',16);
ylabel('Parameter b','FontSize',16);
title('Contour Plot','FontSize',16);

figure
plot(Time,Stock_2017,'k*','LineStyle','none','MarkerSize',9,'MarkerFaceColor','k');
hold on
% grid on
plot(Time,guess(1)*Time + guess(2)*ones(1,n),'LineWidth',1.5);
hold off
set(gca,'FontName','Arial','FontSize',16,'Fontweight','bold','LineWidth',2)
xlabel('Trading Day','FontSize',16);
ylabel('Stock Price in Dollars','FontSize',16);
xlim([0 n]);
ylim([150 500]);
legend('Data','Best Fit','Location','best');
legend boxoff
box on;
set(gca,'XTick',0:20:100);
set(gcf,'Color','w');
ylim([200 350])
%% Using fminunc
%Cost = @(x) sum((Stock_2017 - (Time.*x(1) + x(2))).^2)/n;
%guess = [0.5;200];
%options = optimset('Display','iter','Algorithm','quasi-newton','HessUpdate','steepdesc','FinDiffRelStep',1e-10,'MaxFunEvals',500);
%guess_matlab = fminunc(Cost,guess,options)