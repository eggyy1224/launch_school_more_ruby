# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

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
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def <<(obj)
   
   raise TypeError, 'can only add Todo objects' unless obj.class == Todo
   todos << obj
   
  end
 
  alias_method :add, :<<
 
  def size
   todos.size
  end
 
  def first
   todos[0]
  end
 
  def last
   todos[-1]
  end
 
  def item_at(index)
   raise IndexError if todos[index].nil?
   todos[index]
  end
 
  def mark_done_at(index)
   raise IndexError if todos[index].nil?
   todos[index].done!
  end

  def mark_undone_at(index)
   raise IndexError if todos[index].nil?
   todos[index].undone!
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    raise IndexError if todos[index].nil?
    todos.delete_at(index)
  end

  def to_s
    result = "----#{title}----\n"
    todos.each do |obj|
      result << "#{obj.to_s}\n"
    end
    result
  end

  def each
    counter = 0
    while counter < todos.size
      yield(todos[counter])
      counter += 1
    end
    self
  end

  def select
    new_list = TodoList.new(title)

    each do |todo|
      new_list.add(todo) if yield(todo)
    end
    new_list
  end

  def find_by_title(str)
    select do |todo|
      todo.title == str
    end.first
  end

  def all_done
    select do |todo|
      todo.done?
    end
  end

  def all_not_done
    select do |todo|
      !todo.done?
    end
  end

  def mark_done(str)
    find_by_title(str).done!
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

  private

  attr_accessor :todos

end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.mark_all_done
list.mark_all_undone

p list.all_done

