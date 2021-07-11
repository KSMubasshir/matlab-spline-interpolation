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


for i=1:6
    points=linspace(1,7,i+1);
    selected_x=training_x(1,ceil(points(1,1:i+1)));
    selected_y=training_y(1,ceil(points(1,1:i+1)));
    [A,B,C]=quad_spline_int_1505041(selected_x,selected_y);
    for idx=1:i
        xspline=linspace(X(ceil(points(1,idx))),X(ceil(points(1,idx+1))),10);
        yspline=A(idx)*xspline.^2+B(idx)*xspline+C(idx);
        plot(xspline,yspline,'r-','LineWidth',2);
        hold on
        %scatter(training_x,training_y)
        %hold on
        scatter(test_x,test_y)
        hold on
    end
    pause(1.5);
    hold off
end
