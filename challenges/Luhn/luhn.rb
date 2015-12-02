require 'pry'

class Luhn

  attr_accessor :code
  attr_accessor :numbers

  def initialize(str)
    @code = str
    addends
  end 

  def addends
    @numbers = code.to_s.gsub(/\D/, '').split('').map(&:to_i).reverse
    count = 0
    while count < @numbers.size
      if count % 2 == 1
        @numbers[count] *= 2
        if @numbers[count] > 9
          @numbers[count] -= 9
        end
      end
      count += 1
    end
    @numbers.reverse
  end

  def checksum
    numbers.inject(&:+) if numbers
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(num)
    l = Luhn.new(num*10)
    if ch = l.checksum % 10 == 0
      num * 10 + l.checksum % 10
    else
      num * 10 + 10 - l.checksum % 10
    end
    
  end

end


# l = Luhn.new(12_121)
# puts l.addends.inspect
# puts l.checksum

# l = Luhn.new(8631)
# puts l.addends.inspect
# puts l.checksum

# l = Luhn.new(2323_2005_7766_355)
# puts l.addends.inspect
# puts l.checksum

# l = Luhn.new(4913)
# puts l.addends.inspect
# puts l.checksum

# l = Luhn.new(201_773)
# puts l.addends.inspect
# puts l.checksum

# l = Luhn.new(738)
# puts l.addends.inspect
# puts l.checksum
# puts l.valid?

# l = Luhn.new(8_739_567)
# puts l.addends.inspect
# puts l.checksum
# puts l.valid?

# l = Luhn.new(8_739_567)
# puts l.addends.inspect
# puts l.checksum
# puts l.valid?

# l2 = Luhn.create(873_956)
# puts l2

# l = Luhn.new(123)
# puts l.addends.inspect
# puts l.checksum
# puts l.valid?

# l = Luhn.new(873_956)
# puts l.addends.inspect
# puts l.checksum
# puts l.valid?

# l = Luhn.new(873_956_0)
# puts l.addends.inspect
# puts l.checksum
# puts l.valid?