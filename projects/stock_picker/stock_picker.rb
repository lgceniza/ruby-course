def stock_picker(prices)
  min_day = 0
  max_day = -1
  max_profit = 0

  for i in 0...prices.length
    (prices.length-1).downto(i) do |j|
      profit = prices[j] - prices[i]
      if profit > max_profit
        min_day = i
        max_day = j
        max_profit = profit
      end
    end
  end
  return [min_day, max_day]
end
