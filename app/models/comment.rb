class Comment < ApplicationRecord
  belongs_to :time_report
  belongs_to :user

  with_options presence: true do
  validates :content
  end
end
