class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable
  

  #has_secure_password

  has_one :business

  validates_presence_of :first_name, :last_name

  validates :email, presence: true
end
