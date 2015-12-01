class MyCar

  attr_reader :year
  #attr_accessor :color

  def self.gas_mileage(gallons, miles)
    puts "#{miles/gallons} mpg"
  end

  def initialize(yr, col, mod)
    @year, @color, @model = yr, col, mod
    @current_speed = 0
  end

  def speed_up
    @current_speed += 10
  end

  def brake
    self.current_speed -= 10
    if self.current_speed < 0
      self.current_speed = 0
    end
  end

  def stop
    self.current_speed = 0
  end

  def current_speed
    @current_speed
  end

  def to_s
    puts "Model: #{@model}, Color: #{@color}, Year: #{@year}"
  end

  def spray_paint(color)
    self.color = color
  end

  def self.nature
    puts "self.nature color is #{@color}"
  end

  def color=(col)
    @color = col
  end

  def color
    puts "instance color is #{@color}"
  end

end

car = MyCar.new(1990, 'red', 'Toyota Celica')
puts car.current_speed
car.speed_up
car.speed_up
puts car.current_speed

# car.nature
MyCar.nature
car.color

MyCar.gas_mileage(10,120)

puts car