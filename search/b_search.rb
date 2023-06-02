
# Requires a sorted array
# Time complexity: O(log n)
# Space complexity: O(1)

# Find the min node
def b_search_min_node(arr, target)
  arr.bsearch {|x| x >= target } # => 4
end

# Find any node
def b_search_any_node(arr, target)
  arr.bsearch {|element| target <=> element } # => 7
end

# Without bsearch built-in function
def binary_search(array, value)
  array, low, high = array.sort, 0, array.length - 1

  while low <= high
    mid = (low + high) / 2
    if array[mid] < value
      low = mid + 1
    elsif array[mid] > value
      high = mid - 1
    else
      return mid  # Found
    end
  end

  return nil  # Not found
end


p b_search_any_node([1,2,3,4,5,6], 9) # Nil => Not found
p b_search_min_node([1,2,3,4,5,6,7], 7) 
p binary_search([1,2,3,4,5,6,7], 3) 