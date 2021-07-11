function [A,B,C]=quad_spline_int_1505041(X,Y)
N=max(size(X));
n=N-1;

HO=zeros(2*n-2,3*n);
KO=zeros(2*n-2,1);

for idx=1:n-1
    col=idx;
    row=2*(idx-1)+1;
    HO(row,col)=X(idx+1)^2;
    HO(row+1,col+1)=X(idx+1)^2;
    HO(row,n+col)=X(idx+1);
    HO(row+1,n+col+1)=X(idx+1);
    HO(row,2*n+col)=1;
    HO(row+1,2*n+col+1)=1;
    KO(row)=Y(idx+1);
    KO(row+1)=Y(idx+1);
end

H1=zeros(n-1,3*n);
for idx=1:n-1
    H1(idx,idx)=2*X(idx+1);
    H1(idx,idx+1)=-2*X(idx+1);
    H1(idx,n+idx)=1;
    H1(idx,n+idx+1)=-1;
end

HE=zeros(2,3*n);
HE(1,1)=X(1)^2;
HE(1,n+1)=X(1);
HE(1,2*n+1)=1;
HE(2,n)=X(end)^2;
HE(2,2*n)=X(end);
HE(2,end)=1;

H=[HO;H1;HE];
[r,c]=size(H);

K=zeros(r,1);
K(1:(2*(n-1)))=KO;
K(end-1)=Y(1);
K(end)=Y(end);

H=H(:,2:end);
coeffs=H\K;

A=[0;coeffs(1:n-1)];
B=coeffs(n:2*n-1);
C=coeffs(2*n:end);

end

