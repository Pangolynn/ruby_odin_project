# Implement a method #stock_picker that takes in an array of stock prices,
# one for each hypothetical day. It should return a pair of days representing the 
# best day to buy and the best day to sell. Days start at 0.

def stock_picker(arr)
    highest = -arr[0] + arr[1]
    results = []
  
    arr.each_with_index do |x, i|
      arr.each_with_index do |y, j|
        if (i >= j)
         next
        end
        if highest < -x + y
         highest = -x + y
         results =[i,j]
        end
      end
    end
  
    p "profits $#{highest}"
    p results
    
  end
  
  stock_picker([17,3,6,9,15,8,6,1,10])
  #[1,4]  # for a profit of $15 - $3 == $12