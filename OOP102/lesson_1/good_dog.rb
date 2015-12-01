# good_dog_class.rb

class Animal
  attr_accessor :name

  def initialize(name="none")
    @name = name
  end

  def speak
    "Hello!"
  end
end

class GoodDog < Animal
  attr_accessor :color
  def initialize(name, color="white")
    super(name)
    @color = color
  end


  def speak
    "#{@name} says arf!"
  end
end

class Cat < Animal
end

sparky = GoodDog.new("Sparky")
paws = Cat.new

puts sparky.speak           # => Sparky says arf!
puts paws.speak             # => Hello!

bruno = GoodDog.new("bruno","brown")
puts bruno.name
puts bruno.color