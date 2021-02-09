class Location < ApplicationRecord
	#asociation
	belongs_to :street
	has_many :shops
	
	#validation
	validates :street_id, inclusion: { in: 0..100 }
end
