class Source < ApplicationRecord
  validates :content, presence:true
  has_many :tasks, through: :sourcings
  has_many :sourcings, dependent: :destroy
  belongs_to :user
end
