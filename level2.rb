# Step 1. Use your code to compute the smallest prime fibonacci number
#         greater than 227,000.  Call this number X.
# 
# Step 2. The password for level 3 is the sum of prime divisors of X + 1.
# 
# Note: If you call the number instead, it will check your answer for step 1. (415) 799-9454.

def sum_prime_divisors_and_1(next_prime_fib)
  prime_divisors = find_divisors(next_prime_fib)
  divisors_sum = prime_divisors.inject(:+)
  divisors_sum
end

def find_divisors(number)
  divisors = []
  half = number / 2
  (2.upto(half)).each do |d|
    if number % d == 0
      if is_prime(d)
        if !(divisors.include?(d))
          divisors << d
        end
        a = number / d
        if is_prime(a)
          if !(divisors.include?(a))
            divisors << a
          end
        end
      end
    end
  end
  divisors
end

def next_fib_number(number)
  fib1 = 0
  fib2 = 0
  next_fib = fib1 + fib2
  until next_fib > number
    fib1 = fib2
    fib2 = next_fib
    next_fib = find_next_fib_number(fib1, fib2)
  end
  
  if is_prime(next_fib)
    next_fib
  else
    next_prime = next_prime_num(next_fib)
    next_fib_number(next_prime)
  end
end

def find_next_fib_number(fib1, fib2)
  next_fib = fib1 + fib2
  if next_fib == 0
    return 1
  else
    return fib1 + fib2
  end
end

def next_prime_num(number)
  is_fib = false
  next_number = number + 1
  until is_fib == true
    if is_prime(next_number)
      return next_number
    else
      next_number += 1
    end
  end
end

def is_prime(number)
  if number > 3
    (2..(number/2).to_i).each do |denominator|
      if number % denominator == 0
        return false
      end
    end
  end
  return true
end




next_prime_fib = next_fib_number(217000)
puts next_prime_fib
password = sum_prime_divisors_and_1(next_prime_fib + 1)
puts password

# 1, 1, 2, 3, 5, 8, 13

