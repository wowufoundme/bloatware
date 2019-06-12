s = [20, 20, 20, 20, 40, 40, 60, 100, 120, 120];
S = [40, 60, 80, 100, 40, 60, 80, 120, 120, 140];
n = 50;
productArrival = rand(1, n);
productDemand = rand(1, n);
for i = 1:n
    productArrival(i) = productArrival(i) * 30;
    productArrival(i) = int16(productArrival(i));
    productDemand(i) = productDemand(i) * 30;
    productDemand(i) = int16(productDemand(i));
end

for j = 1:size(s,2)
    currentLevel = S(j);
    currentTime = 0;
    orderingCost = 0;
    K = 30;
    z = 2;
    shortageCost = 0;
    holding_cost = 0;
    holding = 5;
    shortage = 4;
    for i = 1:n
       if currentLevel > 0
           holding_cost = holding_cost + holding * currentLevel; 
       elseif currentLevel < 0
           shortageCost = shortageCost - shortage * currentLevel;
       end

       currentLevel = currentLevel - productDemand(i);
       currentLevel = currentLevel + productArrival(i);

       if currentTime > 30
           if(currentLevel < s(j))
              orderingCost = orderingCost + (S(j) - currentLevel) * z + K;
              currentLevel = S(j);
           end
           currenttTime = currentTime - 30;
       end
    end

    cost = holding_cost + orderingCost + shortageCost;
    fprintf('Value for %i product:\ns = %i\nS = %i\nTotal Cost: %i\n--------------------------------------------\n', j, s(j), S(j), cost)
end