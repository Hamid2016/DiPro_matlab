function [output] = algae()
image1= imread('C:\Users\Hamid\Desktop\Aqua\hackwsu\HACKWSU\test\0.238_11.jpg');
image2= imread('C:\Users\Hamid\Desktop\Aqua\hackwsu\HACKWSU\test\0.403_11.jpg');
image3= imread('C:\Users\Hamid\Desktop\Aqua\hackwsu\HACKWSU\test\0.257_11.jpg');
image4= imread('C:\Users\Hamid\Desktop\Aqua\hackwsu\HACKWSU\test\2.1_11.jpg');
image5= imread('C:\Users\Hamid\Desktop\Aqua\hackwsu\HACKWSU\test\0.001_11.jpg');
image6= imread('C:\Users\Hamid\Desktop\Aqua\hackwsu\HACKWSU\test\0.004_11.jpg');
image7= imread('C:\Users\Hamid\Desktop\Aqua\hackwsu\HACKWSU\test\0.015_11.jpg');
% image8= imread('C:\Users\Hamid\Desktop\Aqua\hackwsu\HACKWSU\test\0.244_11.jpg');

test=imread('C:\Users\Hamid\Desktop\Aqua\hackwsu\HACKWSU\test\0.244_11.jpg');



green1=image1(:,:,2);
green2=image2(:,:,2);
green3=image3(:,:,2);
green4=image4(:,:,2);
green5=image5(:,:,2);
green6=image6(:,:,2);
green7=image7(:,:,2);
% green8=image8(:,:,2);

green_test=test(:,:,2);


min1=min(min(green1));
min2=min(min(green2));
min3=min(min(green3));
min4=min(min(green4));
min5=min(min(green5));
min6=min(min(green6));



max1=max(max(green1));
max2=max(max(green2));
max3=max(max(green3));
max4=max(max(green4));
max5=max(max(green5));
max6=max(max(green6));



mean1=mean(mean(green1));
mean2=mean(mean(green2));
mean3=mean(mean(green3));
mean4=mean(mean(green4));
mean5=mean(mean(green5));
mean6=mean(mean(green6));
mean7=mean(mean(green7));
% mean8=mean(mean(green8));

mean_test=mean(mean(green_test));


size1=size(green1);
size2=size(green2);
size3=size(green3);
size4=size(green4);
size5=size(green5);
size6=size(green6);


% 
% x = linspace(0,4*pi,10);
% y = sin(x);
% p = polyfit(x,y,points-1);
x=[mean1,mean2,mean3,mean4,mean5,mean6,mean7];
y=[.238,.403,.257,2.1,0.001,0.004,0.015];
num_points=size(x);
curve=polyfit(x,y,num_points(2)-1)
figure(5)
plot(x,y,'o')
output = polyval(curve,mean_test);
grid on
hold on
plot(mean_test,output,'*')
% 
% x1 = linspace(0,4*pi);
% y1 = polyval(p,x1);


% 
% hold on
% figure(1);
% imshow(green1)
% figure(2)
% imshow(green2)
% figure(3)
% imshow(green3)


% imshow(A(:,:,1))
% figure(2)
% imshow(A(:,:,2))
% figure(3)
% imshow(A(:,:,3))