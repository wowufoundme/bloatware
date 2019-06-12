servers = [1, 2, 3];

arrival = [4, 7, 8, 12, 14, 16];
departure = [8, 12, 13, 15, 18, 21];

event = [arrival, departure];
sort(event);

queueServers = [
    0, 0;
    0, 0;
    0, 0;
];

serverStatus = [0,0,0];

%Compute Arrival Series
lengthIAT = length(queueMain);
arrivalTimes = [];
initial = 0;
for i = 1:lengthIAT
   arrivalTimes(i) = initial + interArrivalTimes(i);
   initial = arrivalTimes(i);
end

%Pick a customer from the arrival time list

for i = 1:length(arrival)
    serverAssign = -1;
    for ser=1:length(servers)
        pos = checkFreeServer(ser, queueServers, serverStatus);
        if pos == -1
            fprintf("Server %d is busy\n", ser);
            continue
        elseif pos ~= -1
            serverAssign = pos;
            queueServers(ser, pos) = i;
            fprintf("Job %d assigned to server %d at %d\n", i, ser, pos)
            break
        end
    end
end

disp(queueServers)
disp(serverStatus)

%Check if any server is idle or not, if idle assign the customer that
%particular server and start his processing

%If the server is not free then find the minimum server queue and put the
%person in that queue

%Check if a server is free or not
function pos = checkFreeServer(serverNumber, queueServers, serverStatus)
    pos = -1;
    for i=1:2
        if serverStatus(serverNumber) == 0
            if queueServers(serverNumber, i) == 0
                pos = i;
                serverStatus(serverNumber) = 1; 
                break
            end
        else
            if serverStatus(serverNumber) == 1
                break
            end
        end
    end
end