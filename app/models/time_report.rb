class TimeReport < ApplicationRecord
  belongs_to :user
  has_many :comments

  with_options presence: true do
  validates :memo
  end

end
