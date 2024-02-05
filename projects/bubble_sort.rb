def bubble_sort(arr)
    arr_size = arr.size - 1
    return arr if arr_size <= 0
  
    loop do 
      swapped = false
  
      (arr_size).times do |x|
        if arr[x] > arr[x + 1]
          arr[x], arr[x + 1] = arr[x + 1], arr[x]
          swapped = true
        end
      end
      
      unless swapped
        break
      end
      arr_size -= 1
    end
    arr
  end
  
  
  p bubble_sort([10,5,2,])
  p bubble_sort([39,230,20,129,203,92,1,2039,3,2,402,492])
  
  