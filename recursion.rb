def sum_to(n)
  return nil if n < 1
  return 1 if n == 1
  n + sum_to(n-1)
end

def add_numbers(nums_array = nil)
  return nums_array.first if nums_array.length <= 1
  nums_array.first + add_numbers(nums_array[1..-1])
end

def gamma_fnc(n)
  return nil if n < 1
  return 1 if num == 1
  (n-1) * gamma_fnc(n-1)
end
