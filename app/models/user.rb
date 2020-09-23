class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
    
  has_many :time_reports
  has_many :comments
    
  with_options presence: true do
    validates :name, length: { maximum: 6 }
  end  
    validates :email, uniqueness: { case_sensitive: false }
end
