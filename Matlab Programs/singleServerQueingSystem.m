% interArrivalTimes = rand(1, 20)
interArrivalTimes = [0.4, 1.2, 0.5, 1.7, 0.2, 1.6, 0.2, 1.4, 1.9];

%Compute Arrival Series
lengthIAT = length(interArrivalTimes);
arrivalTimes = [];
initial = 0;
for i = 1:lengthIAT
   arrivalTimes(i) = initial + interArrivalTimes(i);
   initial = arrivalTimes(i);
end

% Service Times
serviceTimes = [2.0, 0.7, 0.2, 1.1, 3.7, 0.6];

% Compute corresponding values
startTimes = [];
delayTimes = [];
completeTimes = [];
customerAtService = 0;
customersInQueue = 0;
isServerBusy = 0;

for i = 1:length(serviceTimes)
    if i == 1        
        startTimes(i) = arrivalTimes(i);
        delayTimes(i) = 0;
        completeTimes(i) = startTimes(i) + serviceTimes(i);
    else
        if completeTimes(i-1) > arrivalTimes(i)
            startTimes(i) = completeTimes(i-1);
            delayTimes(i) = startTimes(i) - arrivalTimes(i);
            completeTimes(i) = startTimes(i) + serviceTimes(i);
        elseif completeTimes(i-1) <= arrivalTimes(i)
            startTimes(i) = arrivalTimes(i);
            delayTimes(i) = 0;
            completeTimes(i) = startTimes(i) + serviceTimes(i);
        end
    end
end

% Compute Event List
eventList = [];