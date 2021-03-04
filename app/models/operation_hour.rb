class OperationHour < ApplicationRecord
	belongs_to :shop
	
	#validation
	validates :close1, allow_nil: true #(まだ入れてないifで詰まったら)
	#validates :open2, allow_nil: true
end
