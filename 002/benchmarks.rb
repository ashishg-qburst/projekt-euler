require 'benchmark'

#                       user     system      total        real
# mine              0.000000   0.000000   0.000000 (  0.000031)
# 4613732
# conventional      0.000000   0.000000   0.000000 (  0.000012)
# 4613732
# better            0.000000   0.000000   0.000000 (  0.000004)
# 4613732

sum = 0

Benchmark.bm(15) do |x|
  x.report('mine') do
    counter = 1
    i, j = 1, 1
    sum = 0
    max = 4_000_000

    loop do
      k = j
      counter += 1
      j = i + j
      i = k
      if counter == 3
        sum += i
        counter = 0
      end
      break if j > max
    end
  end
  puts sum

  x.report('conventional') do
    sum = 0
    i, j = 1, 1
    max = 4_000_000

    loop do
      k = j
      j = i + j
      i = k
      sum += i if i % 2 == 0
      break if j > max
    end
  end
  puts sum

  x.report('better') do
    counter = 1
    a, b = 1, 1
    sum = 0
    max = 4_000_000
    c = a + b

    while c < max do
      sum += c
      a = b + c
      b = c + a
      c = a + b
    end
  end
  puts sum
end
