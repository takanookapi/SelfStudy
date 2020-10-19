class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
    
  has_many :time_reports
  has_many :comments
    
  with_options presence: true do
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, {format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }}  
    validates :name, length: { maximum: 6 }
  end  
end
