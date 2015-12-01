require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'car/car'

class CarTest < MiniTest::Test

  def setup
    @car = Car.new
  end

  def test_wheels
    assert_equal @car.wheels, 4
  end

  def test_car_exists
    assert @car
  end

  def test_raise_initialize_with_arg
    assert_raises ArgumentError do
      car = Car.new(name: "Joe")
    end
  end

  def test_car_class
    assert_instance_of Car, @car
  end

  def test_wrong_number_of_wheels
    refute_equal @car.wheels, 3
  end


end
