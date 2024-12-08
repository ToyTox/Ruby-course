# 3. Заполнить массив числами фибоначчи до 100

array = [0, 1]

while array[-1] <= 100
  next_number = array[-1] + array[-2]
  array << next_number
end

puts array
