# 4. Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).

alphabet = ('a'..'z').to_a
vowels = %w[a e i o u]
hash = {}

alphabet.each_with_index do |letter, i|
  vowels.each do |vowel_letter|
    if letter == vowel_letter
      hash[letter] = i + 1
    end
  end
end

puts hash