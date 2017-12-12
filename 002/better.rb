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

puts sum
