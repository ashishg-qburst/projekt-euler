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

puts sum
