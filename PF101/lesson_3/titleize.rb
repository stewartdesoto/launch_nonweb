statement = "The flintstones, deep in a bedrock time, totally make rocks"

words = statement.split(' ')
title = ""
words.each do |word|
  title << word.downcase.capitalize + ' '
end
puts title