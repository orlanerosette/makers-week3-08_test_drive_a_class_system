require 'todo_list'
require 'todo'

RSpec.describe "todo_list integration" do
  context "there are uncompleted tasks" do
    it "returns the uncompleted tasks an an array" do
      list = TodoList.new
      task_1 = Todo.new("Buy ingredients")
      list.add(task_1)
      expect(list.incomplete).to eq [task_1]
    end


    it "returns the uncompleted tasks an an array" do
      list = TodoList.new
      task_1 = Todo.new("Buy ingredients")
      task_2 = Todo.new("Bake a cake")
      task_3 = Todo.new("Eat the cake")
      list.add(task_1)
      list.add(task_2)
      list.add(task_3)
      expect(list.incomplete).to eq [task_1, task_2, task_3]
    end
  end
  

end