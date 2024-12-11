# 5. Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя).
# Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным.
# (Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?)
# Алгоритм опредления високосного года: docs.microsoft.com

months = {
  1 => 31,
  2 => 28,
  3 => 31,
  4 => 30,
  5 => 31,
  6 => 30,
  7 => 31,
  8 => 31,
  9 => 30,
  10 => 31,
  11 => 30,
  12 => 31,
}

puts "Укажите число:"
day = gets.chomp.to_i
puts "Укажите месяц:"
month = gets.chomp.to_i
puts "Укажите год:"
year = gets.chomp.to_i

isLeapYear = year % 4

def day_count(months, month)
  i = 1
  day_count = 0

  while i < month
    day_count += months[i]
    i += 1
  end

  day_count
end

if isLeapYear == 0
  puts "Порядковый номер даты #{month <= 2 ? (day_count(months, month) + day) : (day_count(months, month) + day + 1)}"
else
  puts "Порядковый номер даты #{day_count(months, month) + day}"
end

