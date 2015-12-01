require 'minitest/autorun'
require 'minitest/reporters'

MiniTest::Reporters.use!
class EqualityTest < Minitest::Test

  def test_value_equality
    str1 = "Hello, world"
    str2 = "Hello, world"

    assert_equal str1, str2
    assert_same str1, str2
  end
end