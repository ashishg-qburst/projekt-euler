require 'benchmark'

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

#                       user     system      total        real
# mine              1.580000   0.000000   1.580000 (  1.585665)
# 2333333316666668
# conventional      5.910000   0.020000   5.930000 (  5.947925)
# 2333333316666668

