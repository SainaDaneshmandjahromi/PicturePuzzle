tic;
clear
clc
%get the image
i=imread('');
%create random matrix
a=zeros(1,9);
j=0;
while j<=8;
    j=j+1;
    x=0;
    a(j)=1+round((8*rand(1)));
    k=0;
   while  k+1<j; 
       k=k+1;
        if a(j)==a(k);  
            x=1;
        end
   end
        if x==1;
            j=j-1;
        end
end
%show the first image
figure(1)
image(i)
axis off
[b,c,dim]=size(i);
%show the image which it's pieces are in random_matrix order
figure(2)
subplot(3,3,a(1));
imagesc(i);
axis([1,(c/3),1,(b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(2));
imagesc(i);
axis([(c/3),(2*c/3),1,(b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(3));
imagesc(i);
axis([(2*c/3),(c),1,(b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(4));
imagesc(i);
axis([1,(c/3),(b/3),(2*b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(5));
imagesc(i);
axis([(c/3),(2*c/3),(b/3),(2*b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(6));
imagesc(i);
axis([(2*c/3),(c),(b/3),(2*b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(7));
imagesc(i);
axis([1,(c/3),(2*b/3),b]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(8));
imagesc(i);
axis([(c/3),(2*c/3),(2*b/3),b]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(9));
imagesc(i);
axis([(2*c/3),(3*c/3),(2*b/3),b]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
%calculate total moves and incorrect moves
moves=0;
correct_moves=0;
while moves>=0;
    moves=moves+1;
   
[x,y]=ginput(2);
%find the place of first piece
if x(1)<=(c/3) && y(1)<=(b/3);
    e=a(1);
elseif x(1)<=(2*c/3) && y(1)<=(b/3);
    e=a(2);
elseif x(1)<=(c) && y(1)<=(b/3);
    e=a(3);
elseif x(1)<=(c/3) && y(1)<=(2*b/3);
    e=a(4) ;
elseif x(1)<=(2*c/3) && y(1)<=(2*b/3);
    e=a(5);
elseif x(1)<=(c) && y(1)<=(2*b/3);
    e=a(6);
elseif x(1)<=(c/3) && y(1)<=b;
    e=a(7);
elseif x(1)<=(2*c/3) && y(1)<=b;
    e=a(8);
elseif x(1)<=(c) && y(1)<=b;
    e=a(9);
end
%find the place of second piece
if x(2)<=(c/3) && y(2)<=(b/3);
    d=a(1);
elseif x(2)<=(2*c/3) && y(2)<=(b/3);
    d=a(2);
elseif x(2)<=(c) && y(2)<=(b/3);
    d=a(3);
elseif x(2)<=(c/3) && y(2)<=(2*b/3);
    d=a(4);
elseif x(2)<=(2*c/3) && y(2)<=(2*b/3);
    d=a(5);
elseif x(2)<=(c) && y(2)<=(2*b/3);
    d=a(6);
elseif x(2)<=(c/3) && y(2)<=b;
    d=a(7);
elseif x(2)<=(2*c/3) && y(2)<=b;
    d=a(8);       
elseif x(2)<=(c) && y(2)<=b;
    d=a(9);
end
%find the number of first piece and second piece
f=find(a==e);
g=find(a==d);
%swap those pieces if the number of the first one and place of second one
%is same
if  d==f; 
     d=d+e;
     e=d-e;
     d=d-e;
     %calculate number of correct moves
    correct_moves=correct_moves+1;
    a(f)=e;
a(g)=d;
subplot(3,3,a(1));
imagesc(i);
axis([1,(c/3),1,(b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(2));
imagesc(i);
axis([(c/3),(2*c/3),1,(b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(3));
imagesc(i);
axis([(2*c/3),(3*c/3),1,(b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(4));
imagesc(i);
axis([1,(c/3),(b/3),(2*b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(5));
imagesc(i);
axis([(c/3),(2*c/3),(b/3),(2*b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(6));
imagesc(i);
axis([(2*c/3),(3*c/3),(b/3),(2*b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(7));
imagesc(i);
axis([1,(c/3),(2*b/3),b]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(8));
imagesc(i);
axis([(c/3),(2*c/3),(2*b/3),b]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(9));
imagesc(i);
axis([(2*c/3),(3*c/3),(2*b/3),b]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
else
    beep;
subplot(3,3,a(1));
imagesc(i);
title('wrong swap')
axis([1,(c/3),1,(b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(2));
imagesc(i);
axis([(c/3),(2*c/3),1,(b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(3));
imagesc(i);
axis([(2*c/3),(3*c/3),1,(b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(4));
imagesc(i);
axis([1,(c/3),(b/3),(2*b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(5));
imagesc(i);
axis([(c/3),(2*c/3),(b/3),(2*b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(6));
imagesc(i);
axis([(2*c/3),(3*c/3),(b/3),(2*b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(7));
imagesc(i);
axis([1,(c/3),(2*b/3),b]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(8));
imagesc(i);
axis([(c/3),(2*c/3),(2*b/3),b]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(9));
imagesc(i);
axis([(2*c/3),(3*c/3),(2*b/3),b]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
end
if a==[1,2,3,4,5,6,7,8,9];
    break
end
end
%calculate time
time=toc;
%calculate number of incorrect moves
incorrect_moves=moves-correct_moves;
subplot(3,3,a(1));
imagesc(i);
title(strcat('moves:',num2str(moves)))
axis([1,(c/3),1,(b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(2));
imagesc(i)
title(strcat('correct-moves:',num2str(correct_moves)));
axis([(c/3),(2*c/3),1,(b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(3));
imagesc(i);
title(strcat('incorrect-moves:',num2str(incorrect_moves)));
axis([(2*c/3),(3*c/3),1,(b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(4));
imagesc(i);
title(strcat('time:',num2str(time)));
axis([1,(c/3),(b/3),(2*b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(5));
imagesc(i);
axis([(c/3),(2*c/3),(b/3),(2*b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(6));
imagesc(i);
axis([(2*c/3),(3*c/3),(b/3),(2*b/3)]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(7));
imagesc(i);
axis([1,(c/3),(2*b/3),b]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(8));
imagesc(i);
axis([(c/3),(2*c/3),(2*b/3),b]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);
subplot(3,3,a(9));
imagesc(i);
axis([(2*c/3),(3*c/3),(2*b/3),b]);
set(gca,'XTick',[]);
set(gca,'YTick',[]);