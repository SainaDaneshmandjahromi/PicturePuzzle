tic
clear
clc
%get the image
im_first=imread('');
%resize the image that it can be devided into pieces
[initial_x,initial_y,dim]=size(im_first);
final_x=initial_x-rem(initial_x,3);
final_y=initial_y-rem(initial_y,3);
new_im=imresize(im_first,[final_x final_y]);
[r,c,dim]=size(new_im);
dim_1=(r/3).*ones(3,1);
dim_2=(c/3).*ones(3,1);
%change matrix to cell
blocks=mat2cell(new_im,dim_1,dim_2,dim);
%create random matrix
random_matrix=zeros(1,9);
i=0;
while i<=8;
    i=i+1;
    a=0;
    random_matrix(i)=1+round((8*rand(1)));
    k=0;
   while  k+1<i; 
       k=k+1;
        if random_matrix(i)==random_matrix(k);  
            a=1;
        end
   end
        if a==1;
            i=i-1;
        end
end
%put the pieces in random matrix order
blocks(1:9)=blocks(random_matrix);
%change cell to matrix
puzzle=cell2mat(blocks);
%show the first image
figure(1);
image(new_im);
axis off;
%show the image which it's pieces are in random_matrix order
figure(2);
image(puzzle);
axis off
%calculate total moves and incorrect moves
moves=0;
incorrect_moves=0;
while moves>=0;
 moves=moves+1 ;
%get the x & y of the point that has been clicked on
[x,y]=ginput(2);
%create a matrix that change the image into it's first order
 change_to_first=zeros(1,9);
for i=1:9;
    place_rand_piece=find(i==random_matrix);
    change_to_first(i)=place_rand_piece;
end
%find the number of first piece and it's place
if x(1)<=(1*c)/3 && y(1)<=(1*r)/3;
    number_of_first_piece=random_matrix(1);
elseif x(1)<=(1*c)/3 && y(1)<=(2*r)/3;
    number_of_first_piece=random_matrix(2);
elseif x(1)<=(1*c)/3 && y(1)<=r;
    number_of_first_piece=random_matrix(3);
elseif x(1)<=(2*c)/3 && y(1)<=r/3;
    number_of_first_piece=random_matrix(4);
elseif x(1)<=(2*c)/3 && y(1)<=(2*r)/3;
    number_of_first_piece=random_matrix(5);
elseif x(1)<=(2*c)/3 && y(1)<=r;
    number_of_first_piece=random_matrix(6);
elseif x(1)<=c && y(1)<=r/3;
    number_of_first_piece=random_matrix(7);
elseif x(1)<=c && y(1)<=(2*r)/3;
    number_of_first_piece=random_matrix(8);
elseif x(1)<=c && y(1)<=r;
    number_of_first_piece=random_matrix(9);
end
%find the number of second piece and it's place
if x(2)<=c/3 && y(2)<=r/3;
    number_of_second_piece=random_matrix(1);
elseif x(2)<=c/3 && y(2)<=2*r/3;
    number_of_second_piece=random_matrix(2);
elseif x(2)<=c/3 && y(2)<=r;
   number_of_second_piece=random_matrix(3);
elseif x(2)<=2*c/3 && y(2)<=r/3;
    number_of_second_piece=random_matrix(4);
elseif x(2)<=2*c/3 && y(2)<=2*r/3;
   number_of_second_piece=random_matrix(5);
elseif x(2)<=2*c/3 && y(2)<=r;
   number_of_second_piece=random_matrix(6);
elseif x(2)<=c && y(2)<=r/3;
    number_of_second_piece=random_matrix(7);
elseif x(2)<=c && y(2)<=2*r/3;
    number_of_second_piece=random_matrix(8);
elseif x(2)<=c && y(2)<=r;
   number_of_second_piece=random_matrix(9);
end
place_of_first_piece=find(random_matrix==number_of_first_piece);
place_of_second_piece=find(random_matrix==number_of_second_piece);
%swap those pieces if the number of the first one and place of second one
%is same
if  number_of_first_piece==place_of_second_piece;
     number_of_second_piece=number_of_second_piece+number_of_first_piece;
    number_of_first_piece=number_of_second_piece-number_of_first_piece;
     number_of_second_piece=number_of_second_piece-number_of_first_piece ;
     %create a text to be written on the picture
    text_str=cell(1);
    text_str=[''];
    position=[1 50]; 
    else
    beep;
    text_str=cell(1)
    text_str=['you can not swap these two'];
    position=[1 50];
    %calculate number of incorrect moves
    incorrect_moves=incorrect_moves+1;
end
box_color={'red'};
random_matrix(place_of_first_piece)=number_of_first_piece;
random_matrix(place_of_second_piece)=number_of_second_piece;
blocks(1:9)=blocks(change_to_first);
blocks(1:9)=blocks(random_matrix);
puzzle=cell2mat(blocks);
RGB=insertText(puzzle,position,text_str,'FontSize',26,'TextColor','white','BoxColor', box_color);
figure(2);
image(RGB);
axis off;
if random_matrix==[1,2,3,4,5,6,7,8,9];
    break
end
end
correct_moves=moves-incorrect_moves;
text_str=cell(1)
time=toc;
b=[moves,incorrect_moves,correct_moves,time];
text_str{1}=['moves:' num2str(b(1),'%0.0f')];
text_str{2}=['incorrect_moves:' num2str(b(2),'%0.0f')];
text_str{3}=['correct_moves:' num2str(b(3),'%0.0f')];
text_str{4}=['time:' num2str(b(4),'%0.4f')];
position=[50 50;50 100;50 150;50 200];
box_color={'red','red','red','red'};
RGB = insertText(puzzle, position, text_str, 'FontSize', 26, 'BoxColor', box_color,'TextColor','white');
figure(2);
image(RGB);
axis off;