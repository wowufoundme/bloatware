clc, clear

vector = [];

ch = 1;
    
while ch==1
    ip = input("\n1.Push\n2.Pop\n3.Peek\n");
    switch ip
       case 1
           disp('Performing push operation...')
           vector = push(vector);
       case 2
           disp('Performing pop operation...')
           vector = pop(vector);
       case 3
           disp('Performing peek operation...')
           peek(vector)
       otherwise
           disp('Wrong option...')
   end
   ch = input('Do you want to continue(1=YES/0=NO): ');
   if ch ~= 1
       break
   else
       continue
   end
end

function [ vect ] = push(vector)
    key = input('Enter the element to be pushed onto the stack: ');
    vect = [vector(1:end), key];
    disp(vect)
end

function [ vect ] = pop(vector)
    vect = vector(1,1:end-1);
end

function [ peekedElement ] = peek(vector)
    peekedElement = vector(end);
end