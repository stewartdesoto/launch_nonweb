puts "Please enter the amount of the loan (in US dollars):"
loan = gets.chomp.to_f
puts "What is the annual percentage rate (APR)? "
apr = gets.chomp.to_f
puts "Loan duration in months? "
duration = gets.chomp.to_i

rate = apr / 100 / 12
payment = loan * (rate * (1 + rate)**duration) / ((1.0 + rate)**duration - 1.0)

puts "The monthly payment is $#{payment.round(2)}"
