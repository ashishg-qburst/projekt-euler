counter = 1
i, j = 1, 1
max = 4_000_000
sum = 0

loop do
  k = j
  counter += 1
  j = i + j
  break if j > max
  i = k
  if counter == 3
    sum += i
    counter = 0
  end
end

puts sum
