require 'pry'

class Sieve

  attr_accessor :primes

  def initialize(max)
    @primes = []
    @prime = {}
    @max = max
    (@max - 1).times do |n|
      @prime[n+2] = true
    end
    find_primes
  end

  def find_primes
    index = 2
    loop do
      while @prime[index] == false && index < @max
        index += 1
      end
      not_prime = index * 2
      while not_prime <= @max
        @prime[not_prime] = false
        not_prime += index
      end
      index += 1
      break if index >= @max
    end
  end

  def primes
    @primes = []
    @prime.each do |number, state|
      @primes << number if state == true
    end
    @primes
  end
end

s = Sieve.new(10)
puts s.primes.inspect

s = Sieve.new(1000)
puts s.primes.inspect