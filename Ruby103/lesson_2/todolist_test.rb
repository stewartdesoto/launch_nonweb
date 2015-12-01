require 'minitest/autorun'
require 'minitest/reporters'
require 'simplecov'

SimpleCov.start
Minitest::Reporters.use!

require_relative 'todo.rb'

class TodolistTest < Minitest::Test

  def setup 
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_todo_exists
    assert @todo1
    assert @todo2
    assert @todo3
  end

  def test_todos_list_exists
    assert @list
  end

  def test_to_a
    assert_equal @todos, @list.to_a
  end

  def test_size_of_list
    assert_equal @list.size, 3
  end

  def test_first_todo
    assert_equal @list.first, @todo1
  end

  def test_last_todo
    assert_equal @list.last, @todo3
  end

  def test_list_shift
    item = @list.shift
    assert_equal @list.size, 2
    assert_equal item, @todo1
  end

  def test_list_pop
    item = @list.pop
    assert_equal @list.size, 2
    assert_equal item, @todo3
  end

  def test_raise_type_error
    assert_raises(TypeError) {@list << 5}
  end

  def test_raise_index_error
    assert_raises(IndexError) {@list.item_at(100)}
  end

  def test_to_s
    output = <<-OUTPUT
[ ] Buy milk
[ ] Clean room
[ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_select_on_todo_list
    select_list = @list.select {|todo| todo.title == 'Buy milk'}
    new_list = TodoList.new("Today's Todos")
    new_list.add(@todo1)
    assert_equal select_list.to_s, new_list.to_s
  end

end
