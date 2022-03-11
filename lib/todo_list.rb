class TodoList
  def initialize
    @todo_list = []
  end

  def add(todo) # todo is an instance of Todo
    @todo_list << todo
  end

  def incomplete
    return @todo_list.select do |todo|
      todo.task
    end
  end

  def complete
    # Returns all complete todos
    return @todo_list.select { |todo| todo.done? }
  end

  def give_up!
    # Marks all todos as complete
    for todo in @todo_list do
      todo.mark_done!
    end
  end
end