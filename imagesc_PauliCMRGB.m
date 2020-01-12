function []=imagesc_PauliCMRGB(T6)
% File       : Create the PauliCMRGB image of PolInSAR images
% Authors    : Shen Peng;
% Creation   : 2020/01/11
% Update     : 2020/01/11

[~,~,Nrow,Ncol]=size(T6);

pol1=reshape(T6(2,2,:,:),Nrow,Ncol);
pol2=reshape(T6(5,5,:,:),Nrow,Ncol);
pol1pol2=reshape(T6(2,5,:,:),Nrow,Ncol);
R=abs(pol1pol2./sqrt(pol1.*pol2));
R=255*R;
R=uint8(R);

pol1=reshape(T6(3,3,:,:),Nrow,Ncol);
pol2=reshape(T6(6,6,:,:),Nrow,Ncol);
pol1pol2=reshape(T6(3,6,:,:),Nrow,Ncol);
G=abs(pol1pol2./sqrt(pol1.*pol2));
G=255*G;
G=uint8(G);

pol1=reshape(T6(1,1,:,:),Nrow,Ncol);
pol2=reshape(T6(4,4,:,:),Nrow,Ncol);
pol1pol2=reshape(T6(1,4,:,:),Nrow,Ncol);
B=abs(pol1pol2./sqrt(pol1.*pol2));
B=255*B;
B=uint8(B);

PauliRGB=cat(3,R,G,B);

imagesc(PauliRGB);