statement = "The flintstones, deep in a bedrock time, totally make rocks"

letters=('a'..'z').to_a + ('A'..'Z').to_a
frequency={}
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  frequncy[letter]=letter_frequency if letter_frequency > 0
end
puts frequency.inspect  