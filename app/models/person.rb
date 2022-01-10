class Person < ApplicationRecord
  belongs_to :company
  has_many :jobs, dependent: :destroy
end
