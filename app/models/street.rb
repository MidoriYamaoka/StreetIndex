class Street < ApplicationRecord
	has_many :locations
	
	#joinsの実験
	#Street.joins(:locations)

end
