class Step < ApplicationRecord
  belongs_to :task

  validates :name, presence:true
  validates :content, presence:true
end
