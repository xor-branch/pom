class Task < ApplicationRecord
  validates :task_name, presence:true, null:false, uniqueness:true, length:{maximum:60}
  validates :description, presence:true, null:false
  validates :start, presence:true, null:false
  validates :deadline, presence:true, null:false

  enum statut: %i[not_started doing done]
  enum priority: %i[low medium high]

  paginates_per 7

  has_many :steps, dependent: :destroy
  accepts_nested_attributes_for :steps, reject_if: :all_blank
  belongs_to :user
end
