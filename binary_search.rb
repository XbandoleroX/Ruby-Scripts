def binary_search(search_in, to_find)
  sorted = search_in.sort
  low = 0
  high = search_in.length - 1

  while low <= high
    mid = (low + high) / 2 # Possible integer overflow with large numbers
    guess = sorted[mid]

    if guess.eql?(to_find) # Found
      return mid
    elsif guess < to_find #  Move Lower boundary
      low = mid + 1
    else  # Move upper boundary
      high = mid -1
    end
  end

  return false # Not found
end

def binary_search_compact(a, b)
  c = a.sort
  l, h = 0, c.length - 1

  while l <= h
    m = l + ((h - l) / 2) # Avoids integer overflow

    return m if c[m].eql?(b) # Found

    c[m] < b ? l = m + 1 : h = m - 1 # Move the boundaries for the next cycle
  end

  false # Not found
end

arr = [9, 7, 2, 5, 6, 1, 3, 4, 8]
puts binary_search(arr, 4)  # Output: 3
