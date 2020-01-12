%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% File       : The main program of the ANL-SAR method for PolInSAR complex coherence estimation
% Authors    : Shen Peng;
% Creation   : 2020/01/12
% Update     : 2020/01/12
% Description: An Adaptive Nonlocal Method for PolInSAR Complex Coherence Estimatin - ANL-SAR.
% Reference  : Shen, P.; Wang, C.; Luo X..; Fu H.; Zhu, J.	PolInSAR Complex Coherence Estimation Using Shape-adaptive Patches Matching and Trace-Moment-Based NLRB Estimator. IEEE TGRS. 2020. Undergoing Review.
% If the code of the ANL-SAR method is used, please cite the above references.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;clc;close all;
load('T6Simulated.mat');% Simulated PolInSAR data
load('T6HomoArea.mat');% (Noisy) Homoegeneous Area

%% Multiple estimation parameters
RegPatchSet_radius=[1 2 3];% Sets of RS patch sizes
AdpPatch_radius=2;% Maximum radius of the SA patch
SearchSet_radius=[1 2 3 4 5 6 7];% Sets of serach window size
NHP=[5 9 13];% Sets of the homogeneous pixel number in SA patch 
hr=[0.01 0.99];thrN=4;% Sets of the SimiTest threshold

%% ANL-SAR program for PolInSAR coherency matrices estimation
[T6ANLSAR,ENHPNLM,ENHPANLSAR,oriENL]=Batch_T6_filter_ANLSAR(T6Simulated,T6HomoArea,RegPatchSet_radius,AdpPatch_radius,SearchSet_radius,NHP,hr,thrN);

%%  Show the estimated figure
figure;
% Show PauliCMRGB
subplot(1,3,1);imagesc_PauliCMRGB(T6ANLSAR(:,:,8:end-7,8:end-7));title('PauliCMRGB');set(gca,'xtick',[]);set(gca,'ytick',[]);axis image;
% Show HH+VV interferogram
subplot(1,3,2);imagesc(angle(squeeze(T6ANLSAR(1,4,8:end-7,8:end-7))));colormap('jet');title('HH+VV');set(gca,'xtick',[]);set(gca,'ytick',[]);axis image;caxis([-pi pi])
% Show ENHP
subplot(1,3,3);imagesc(ENHPANLSAR(8:end-7,8:end-7)/oriENL);caxis([0 225]);colormap('jet');title('ENHP');set(gca,'xtick',[]);set(gca,'ytick',[]);axis image;
linkaxes;
