
# Time complexity: O(n) 
# Space complexity: O(1)
def linear_search(array, target)
  array.each_with_index do |item, index|
    return index if item == target
  end
  return nil
end

# Without each_with_index
def linear_search(array, target)
  for index in 0...array.length
    return index if array[index] == target
  end
  return nil
end

# Functional approach
def linear_search_functional(array, target)
  index = array.index(target)
  index.nil? ? nil : index
end

# More compact, ruby .index already implement linear search
array = [1, 2, 3, 4, 5]
index = array.index(3)

# Sample:
# array = [5, 3, 2, 1, 7]
# target = 2
# puts linear_search(array, target)  # prints 2