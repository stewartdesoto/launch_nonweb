require 'pry'

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    @done = true
  end

  def done?
    @done
  end

  def undone!
    @done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end


class TodoList

  attr_accessor :title

  def initialize title
    @title = title
    @todos = []
  end

  def each
    @todos.each do |todo|
      yield todo
    end
    self
  end

  def select
    select_list = TodoList.new(title + "_select")
    @todos.each do |todo|
      select_list << todo if yield(todo)
    end
    select_list
  end

  def find_by_title(tit)
    matches = select do |todo|
      todo.title == tit
    end
    matches.first
  end

  def all_done
    matches = select do |todo|
      todo.done?
    end
    matches
  end

  def all_not_done
    matches = select do |todo|
      todo.done? == false
    end
    matches
  end

  def mark_all_done
    each do |todo|
      todo.done!
    end
  end

  def mark_all_undone
    each do |todo|
      todo.undone!
    end
  end
  def add(item)
    raise TypeError, 'can only add todo objects' if item.class != Todo
    @todos << item
  end

  def <<(item)
    add(item)
  end

  def size
    @todos.size
  end

  def first
    @todos[0]
  end

  def last
    @todos[@todos.size - 1]
  end

  def item_at(index)
    @todos[index]
  end

  def mark_done_at(index)
    @todos[index].done! 
  end

  def mark_undone_at(index)
    @todos[index].undone!
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete_at(index)
  end

  def to_s
    str=""
    each do |todo|
      str += todo.to_s + "\n"
      #binding.pry
    end
    str
  end



end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
todo4 = Todo.new("Go to work")
todo5 = Todo.new("Brush teeth")
todo6 = Todo.new("Brush hair")
todo7 = Todo.new("Brush eyebrows")
todo3.done!
todo5.done!
todo7.done!
list = TodoList.new("Today's Todos")

list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
list.add(todo4)                 # adds todo3 to end of list, returns list
list.add(todo5)                 # adds todo3 to end of list, returns list
list.add(todo6)                 # adds todo3 to end of list, returns list
list.add(todo7)                 # adds todo3 to end of list, returns list

puts ""

list.each do |item|
  puts item
end

puts ""

puts list.item_at(1)

puts ""

# list.remove_at(1)
# puts list.item_at(1)

puts ""
items = list.select do |item|
  item.done?
end
puts items

puts "\nfind_by_title"
todo = list.find_by_title("Buy milk")
puts todo

puts "\nall done"
items = list.all_done
puts items

puts "\nall not done"
items = list.all_not_done
puts items

puts "\nmark all done"
list.mark_all_done
puts list

puts "\nmark all undone"
list.mark_all_undone
puts list