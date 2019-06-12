clc, clear

vector = [];

ch = 1;
    
while ch==1
    ip = input("\n1.Add to queue\n2.Remove from queue\n3.Check if queue is empty");
    switch ip
       case 1
           disp('Adding to queue...')
           vector = addToQueue(vector);
       case 2
           disp('Removing from queue...')
           vector = removeFromQueue(vector);
       case 3
           isEmpty(vector)
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

function [ vect ] = addToQueue(vector)
    key = input('Enter the element to add to queue: ');
    vect = [vector(1:end), key];
    disp(vect)
end

function [ vect ] = removeFromQueue(vector)
    vect = vector(1,2:end);
end

function [ ] = isEmpty(vector)
    if isempty(vector)
        disp('The queue is empty')
    else
        disp('The queue is not empty')
    end
end
