
# Recusive aproach
# Time complexity: O(2^n)
# Space complexity: O(n)
def fibonacci_recursive(n)
  return n if n < 2

  fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2)
end

# Memoization aproach
def fibonacci_memo(n, memo={})
 # If its already calculated
 return memo[n] if memo[n]

 # Base cases
 return 0 if n.eql? 0
 return 1 if n.eql? 1

 # Recusrive calculation and saving in to the memo hash
 memo[n] = fibonacci_memo(n-1, memo) + fibonacci_memo(n-2, memo)

 memo[n]
end


def fibonacci_memo_compact(n, memo = {})
  return memo[n] if memo.key?(n)
    
  memo[n] = n < 2 ? n : fibonacci_memo_compact(n - 1, memo) + fibonacci_memo_compact(n - 2, memo)
end