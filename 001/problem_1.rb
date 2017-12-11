require 'benchmark'

# Project Euler - Problem 1

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

#                       user     system      total        real
# mine              1.550000   0.010000   1.560000 (  1.565227)
# 2333333316666668
# conventional      5.930000   0.010000   5.940000 (  5.946881)
# 2333333316666668
# progressions      0.000000   0.000000   0.000000 (  0.000010)
# 2333333316666668



Benchmark.bm(15) do |x|
  count = 0
  max = 100000000

  x.report('mine') do
    i = 3
    count = 0

    while i < max
      count += i
      i += 3
    end

    i = 5

    while i < max
      count += i
      i += 5
    end

    i = 15

    while i < max
      count -= i
      i += 15
    end
  end
  puts count

  x.report('conventional') do
    i = 3
    count = 0

    while(i < max) do
      if ((i % 3) == 0) || ((i % 5) == 0)
        count += i
      end
      i += 1
    end
  end
  puts count

  x.report('progressions') do
    def progression_sum(max, diff)
      x = max.div(diff)
      diff * (x * (x + 1)).div(2)
    end
    max -= 1
    count = progression_sum(max, 3) + progression_sum(max, 5) - progression_sum(max, 15)
  end
  puts count
end
