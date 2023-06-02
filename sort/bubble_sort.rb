
# Time complexity: O(n^2) 
# Space complexity: O(1)

def bubble_sort(array)
  n = array.length
  loop do
    swapped = false

    (n-1).times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end

    break if not swapped
  end

  array
end

def bubble_sort_compact(array)
  array.length.times do
    array.each_with_index do |_, i|
      if array[i + 1] && array[i] > array[i + 1]
        array[i], array[i + 1] = array[i + 1], array[i]
      end
    end
  end
  array
end



# Sample:
p bubble_sort([5,7,3,1,4,9,2])  # Outputs: [1, 2, 3, 4, 5, 7, 9]
p bubble_sort([50,7,3,1,-1,4,9,2])  # Outputs: [-1, 1, 2, 3, 4, 7, 9, 50]