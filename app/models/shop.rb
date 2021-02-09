class Shop < ApplicationRecord
	belongs_to :location ,optional: true
	has_many :operationHours
	
end
