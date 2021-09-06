class Sourcing < ApplicationRecord
  belongs_to :task
  belongs_to :source
end
