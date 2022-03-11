require 'todo'

RSpec.describe Todo do
  it "constructs" do
    task_1 = Todo.new("Buy a cake")
    expect(task_1.task).to eq "Buy a cake"
  end

  it "marks a task as done" do
    task_1 = Todo.new("Buy a cake")
    expect(task_1.done?).to eq true
  end

end
