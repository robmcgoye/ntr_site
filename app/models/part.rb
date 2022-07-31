class Part < ApplicationRecord
  validates :content, presence: true
  validates :name, presence: true, 
  length: { minimum: 2, maximum: 50 }  
  belongs_to :page
end
