#bundle exec rspec spec/models/task_spec.rb
require 'rails_helper'

RSpec.describe 'Task model function', type: :model do
  describe 'Validation test' do
    context 'If the task title is empty' do
      it 'It is hard to Validation' do
        task = Task.new(description: 'Failure test')
        expect(task).not_to be_valid
      end
    end
    context "if the task details are empty" do
      it 'validation is caught' do
        task =Task.new(task_name:'task')
        expect(task).not_to be_valid
      end
    end
  end
  context "if the task details are empty" do
    it 'validation is caught' do
      task =Task.new(task_name:'tast', description:'content')
      expect(task).not_to be_valid
    end
  end
  context "if the task details are empty" do
    it 'validation is caught' do
      task =Task.new(task_name:'tast', description:'content', start:'30-08-2021', deadline:'31-08-2021')
      expect(task).to be_valid
    end
  end
end
