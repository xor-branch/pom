FactoryBot.define do
  factory :task do
    task_name { 'Task1' }
    description { 'test_content' }
    start { '2021-08-30' }
    deadline { '2021-08-31' }
  end
  factory :second_task, class: Task do
    task_name { 'Task2' }
    description { 'test_content' }
    start { '2021-08-30' }
    deadline { '2021-08-31' }
  end
end
