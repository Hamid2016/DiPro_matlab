function [] = parking()
image1=imread('C:\Users\Hamid\Desktop\Aqua\hackwsu\parking.jpg');
back1=image1(603:605,3759:3761,:);
back2=image1(575:577,1935:1937,:);
back3=image1(611:613,1283:1285,:);
back4=image1(111:113,863:865,:);
back5=image1(1631:1633,1983:1985,:);

% % % % % % % % red
back_red1=back1(:,:,1);
mean_back_red1=mean(mean(back_red1));

back_red2=back2(:,:,1);
mean_back_red2=mean(mean(back_red2));

back_red3=back3(:,:,1);
mean_back_red3=mean(mean(back_red3));

back_red4=back4(:,:,1);
mean_back_red4=mean(mean(back_red4));

back_red5=back5(:,:,1);
mean_back_red5=mean(mean(back_red5));

back_red=(mean_back_red1+mean_back_red2+mean_back_red3+mean_back_red4+mean_back_red5)/5;

% % % % % % % green
back_green1=back1(:,:,2);
mean_back_green1=mean(mean(back_green1));

back_green2=back2(:,:,2);
mean_back_green2=mean(mean(back_green2));

back_green3=back3(:,:,2);
mean_back_green3=mean(mean(back_green2));

back_green4=back4(:,:,1);
mean_back_green4=mean(mean(back_green4));

back_green5=back5(:,:,1);
mean_back_green5=mean(mean(back_green5));


back_green=(mean_back_green1+mean_back_green2+mean_back_green3+mean_back_green4+mean_back_green5)/5;

% % % % % % % % blue
back_blue1=back1(:,:,3);
mean_back_blue1=mean(mean(back_blue1));

back_blue2=back2(:,:,3);
mean_back_blue2=mean(mean(back_blue2));

back_blue3=back3(:,:,3);
mean_back_blue3=mean(mean(back_blue3));

back_blue4=back4(:,:,3);
mean_back_blue4=mean(mean(back_blue4));

back_blue5=back5(:,:,3);
mean_back_blue5=mean(mean(back_blue5));

back_blue=(mean_back_blue1+mean_back_blue2+mean_back_blue3+mean_back_blue4+mean_back_blue5)/5;

background=[back_red,back_green,back_blue];

% % % % % % edge detection
gray_image = rgb2gray(image1);
BW = edge(gray_image);

imshow(gray_image);
result_image=zeros(2242,3992,3);
image_size=size(gray_image);
for i=1:1:image_size(1)
    for j=1:1:image_size(2)
        if image1(i,j,1)<=background(1)+50 & image1(i,j,1)>=background(1)-50 
            if image1(i,j,2)<=background(2)+50 & image1(i,j,2)>=background(2)-50 
                if image1(i,j,3)<=background(3)+50 & image1(i,j,1)>=background(3)-50 
                    result_image(i,j,:)=[0,100,0];
                end
            end
        end
    end
end
% imshow(result_image)
improved_image=zeros(2242,3992,3);

unavailable=[1:332,1:3992];
% for i=1:1:image_size(1)
%     for j=1:1:image_size(2)
%         for k=1:3
%             improved_image(i,j,k)=result_image(i,j,k)+image1(i,j,k);
%         end
%     end
% end
result_image(1:332,1:3992,:)=0;
result_image(332:507,3706:3992,:)=0;
result_image(332:507,1:402,:)=0;
result_image(506:675,1:3992,:)=0;
result_image(506:1753,1:275,:)=0;
result_image(336:1753,1:275,:)=0;
result_image(677:1725,3657:3993,:)=0;
result_image(1017:1193,275:3657,:)=0;
result_image(1533:1742,275:3657,:)=0;
result_image(1937:2243,1:3993,:)=0;
result_image(1725:1937,3769:3993,:)=0;
result_image(1742:1937,3101:3353,:)=0;

% improved_image
% % % for i=1:1:image_size(1)
% % %     for j=1:1:image_size(2)
% % %         for k=1:3
% % %             improved_image(i,j,k)=result_image(i,j,k)+image1(i,j,k);
% % %         end
% % %     end
% % % end

% H = fspecial('average', [5 5]);
% I = imfilter(result_image, H);
% I = imfilter(I, H);
% I = imfilter(I, H);
BW = edge(rgb2gray(result_image),'Sobel');


figure(1)
imshow(image1);
figure(2)
imshow(result_image);
counter=0;
CCC=[158,61] ;
for i=1:40
    for j=1:20
        if mean(mean(result_image(1+(i-1)*53:158+(i-1)*53,1+(j-1)*20:61+(j-1)*20,2)))<=100 &  mean(mean(result_image(1+(i-1)*53:158+(i-1)*53,1+(j-1)*20:61+(j-1)*20,2)))>40
            counter=counter+1;
        end
    end
end
% disp ('The number of available parking spot=')
% disp(counter)
% print ('The number of available parking spot=',counter)
fprintf('The number of available parking spot= %i\n', counter)
% % find_shape=False
% for i=1:1:(image_size(1)-rectangle(1))
%     for j=1:1:(image_size(2)-rectangle(2))
%         if mean(mean(result_image(i:i+rectangle(1),j:j+rectangle(2),2)))<=100 & mean(mean(result_image(i:i+rectangle(1),j:j+rectangle(2),2)))>80
%             disp('oh')
%         end
%     end
% end
% bw = im2bw(result_image);
% % find both black and white regions
% stats = [regionprops(bw); regionprops(not(bw))]
% % show the image and draw the detected rectangles on it
% imshow(bw); 
% hold on;
% for i = 1:numel(stats)
%     rectangle('Position', stats(i).BoundingBox, ...
%     'Linewidth', 10, 'EdgeColor', 'r', 'LineStyle', '--');
% end



% imshow(image1)