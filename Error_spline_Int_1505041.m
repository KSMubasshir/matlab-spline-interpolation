% Range of x : [-5,5]
% Training Points:
% (-5.0000,0.0000000 )
% (-3.3333,3.7267800 )
% (-1.6667,4.7140452 )
% (0.0000,5.0000000 )
% (1.6667,4.7140452 )
% (3.3333,3.7267800 )
% (5.0000,0.0000000 )
% Test Points:
% (-4.1667 , 2.7638540)
% (0.8333 , 4.9300665)
% (4.1667 , 2.7638540)

training_x=[-5.0000 -3.3333 -1.6667 0.0000 1.6667 3.3333 5.0000];
training_y=[0.0000000 3.7267800 4.7140452 5.0000000...
    4.7140452 3.7267800 0.0000000];

test_x=[-4.1667 0.8333 4.1667];
test_y=[2.7638540 4.9300665 2.7638540];

X=training_x;
n=length(X);

Error=zeros(1,6);
for i=1:6
    points=linspace(1,7,i+1);
    selected_x=training_x(1,ceil(points(1,1:i+1)));
    selected_y=training_y(1,ceil(points(1,1:i+1)));
    [A,B,C]=quad_spline_int_1505041(selected_x,selected_y);
    for idx=1:i
        X1=X(ceil(points(1,idx)));
        X2=X(ceil(points(1,idx+1)));
        xspline=linspace(X1,X2,10);
        yspline=A(idx)*xspline.^2+B(idx)*xspline+C(idx);
        if test_x(1,1)>=X1&&test_x(1,1)<=X2
            Error(1,i)=Error(1,i)+abs((test_y(1,1)-(A(idx)*test_x(1,1).^2+B(idx)*test_x(1,1)+C(idx)))/test_y(1,1))*100;
        end
        if test_x(1,2)>=X1&&test_x(1,2)<=X2
            Error(1,i)=Error(1,i)+abs((test_y(1,2)-(A(idx)*test_x(1,2).^2+B(idx)*test_x(1,2)+C(idx)))/test_y(1,2))*100;
        end
        if test_x(1,3)>=X1&&test_x(1,3)<=X2
            Error(1,i)=Error(1,i)+abs((test_y(1,3)-(A(idx)*test_x(1,3).^2+B(idx)*test_x(1,3)+C(idx)))/test_y(1,3))*100;
        end
        
    end
    Error(1,i)=Error(1,i)/3;
end
disp(Error)
% i=1:6;
% plot(i,Error(1,i))