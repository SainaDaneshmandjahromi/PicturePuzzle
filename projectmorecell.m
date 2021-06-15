tic;
clear
clc
%get the image
im_first=imread('');
v_block=input('enter the number of blocks in a vertical position');
h_block=input('enter the number of blocks in a horizontal position ');
%resize the image that it can be devided into pieces 
[initial_x,initial_y,dim]=size(im_first);
final_x=initial_x-rem(initial_x,v_block);
final_y=initial_y-rem(initial_y,h_block);
new_im=imresize(im_first,[final_x final_y]);
[r,c,dim]=size(new_im);
%change matrix to cell
dim_1=(r/v_block).*ones(v_block,1);
dim_2=(c/h_block).*ones(h_block,1);
blocks=mat2cell(new_im,dim_1,dim_2,dim);
%create a random matrix
rand_matrix=zeros(1,(h_block*v_block));
i=0;
while i<=(v_block*h_block)-1;
    i=i+1;
    a=0;
    rand_matrix(i)=1+round((((v_block*h_block)-1)*rand(1)));
    k=0;
   while  k+1<i; 
       k=k+1;
        if rand_matrix(i)==rand_matrix(k);  
            a=1;
        end
   end
        if a==1;
            i=i-1;
        end
end
%put the pieces in random_matrix order
blocks(1:(h_block*v_block))=blocks(rand_matrix);
%change cell to matrix
puzzle=cell2mat(blocks);
%show the first image
figure(1);
image(new_im);
axis off;
%show the image which it's pieces are in random_matrix order
figure(2);
image(puzzle);
axis off;
%calculate total moves and incorrect moves
moves=0;
incorrect_moves=0;
while moves>=0;
    moves=moves+1;
     %create a matrix that change the image into it's first order
  change_to_first=zeros(1,h_block*v_block);
for i=1:(h_block*v_block);
    place_rand_piece=find(i==rand_matrix);
    change_to_first(i)=place_rand_piece;
end  
%get the x & y of the point that has been clicked on
[x,y]=ginput(2);
%find the number of first piece and it's place
place_of_first_piece=0;
for i=1:h_block;
  for k=1:v_block;
      quit=0;
      place_of_first_piece=place_of_first_piece+1;
        if x(1)<=((i*c)/(h_block)) && y(1)<=(k*r/v_block);
           quit=1;
      break
        end
  end
       if quit;
           break
       end
end
number_of_first_piece=rand_matrix(place_of_first_piece);
%find the number of second piece and the it's place
place_of_second_piece=0;
for i=1:h_block;
  for k=1:v_block;
      quit=0;
      place_of_second_piece=place_of_second_piece+1;
        if x(2)<=((i*c)/(h_block)) && y(2)<=(k*r/v_block);
           quit=1;
      break
        end
  end
       if quit;
           break
       end
end
number_of_second_piece=rand_matrix(place_of_second_piece);
%swap those pieces if the number of the first one and place of second one was
%the same
if  number_of_first_piece==place_of_second_piece; 
     number_of_second_piece=number_of_second_piece+number_of_first_piece;
     number_of_first_piece=number_of_second_piece-number_of_first_piece;
     number_of_second_piece=number_of_second_piece-number_of_first_piece;
     %create a text to be written on the picture
       text_str=cell(1);
    text_str=[''];
    position=[1 50]; 
    else
    beep;
    text_str=cell(1)
    text_str=['you can not swap these two'];
    position=[1 50];
    %calculate number of incorrect_moves
    incorrect_moves=incorrect_moves+1;
end
box_color={'red'};
rand_matrix(place_of_first_piece)=number_of_first_piece;
rand_matrix(place_of_second_piece)=number_of_second_piece;
blocks(1:h_block*v_block)=blocks(change_to_first);
blocks(1:h_block*v_block)=blocks(rand_matrix);
puzzle=cell2mat(blocks);
RGB=insertText(puzzle,position,text_str,'FontSize',26,'TextColor','white','BoxColor', box_color);
figure(2);
image(RGB);
axis off;
%create a matrix that put the picture in it's correct way
correct_matrix=zeros(1,h_block*v_block);
for i=1:h_block*v_block;
    correct_matrix(i)=i;
end
if rand_matrix==correct_matrix;
break
end
end
%calculate number of correct moves
correct_moves=moves-incorrect_moves;
time=toc;
text_str=cell(1)
b=[moves,incorrect_moves,correct_moves,time];
text_str{1}=['moves:' num2str(b(1),'%0.0f')];
text_str{2}=['incorrect_moves:' num2str(b(2),'%0.0f')];
text_str{3}=['correct_moves:' num2str(b(3),'%0.0f')];
text_str{4}=['time:' num2str(b(4),'%0.4f')];
position=[50 50;50 100;50 150;50 200];
box_color={'red','red','red','red'};
RGB = insertText(puzzle, position, text_str, 'FontSize', 26, 'BoxColor', box_color,'TextColor','white');
figure(2)
image(RGB);
axis off;