class Item < ActiveRecord::Base
  belongs_to :business
  validates :name, presence: true
  validates :price, presence: true,:numericality => { :greater_than_or_equal_to => 0, :other_than => 0  }
  

  
end
