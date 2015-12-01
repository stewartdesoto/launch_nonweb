require_relative 'electrical.rb'

class Computer
  include Electrical
  attr_accessor :type

  def initialize(name)
    @type = name
  end

  def type
    @type
  end

  def type=(t)
    @type = t
  end
end

c = Computer.new("Commodore")
c.turn_on
puts c.type
c.type = "apple"
puts c.type