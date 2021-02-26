class LocationsController < ApplicationController
	require 'mechanize'
	require 'uri'
	require 'date'

	def cityscape0
	end
	
	def cityscape1
	end

	def index

	end
	
	def closeShops##営業時間反映実験##
			p "クロー！"
			@streetSide.id
			@closeShops_0 = []
			@closeShops_1 = []
			@today = Time.zone.now#=>Thu, 24 Dec 2020 12:15:09 JST +09:00
			@hun = @today.min.to_s
		  if @hun.length === 1#=>1桁なら0を追加
		  	@hun = "0"+@hun
		  end
			p @present = @today.hour.to_s+@hun#=>"2337"
			
			#p "ここから@cityscape0"
			@cityscape0.each do |id| #side0
				@shopLists = Shop.where(location_id: id).pluck(:id)
				@shopLists.each do |shopList|
					@cross_street = Shop.find_by(id: shopList, shop_name: "cross_street")
					@operationHour = OperationHour.find_by(shop_id: shopList)
				end

					if @cross_street
						#p "裏道です"
					elsif @operationHour.close1.blank?
						if @operationHour.open1.to_i < @present.to_i && @operationHour.close2.to_i > @present.to_i
							#p "営業時間中"
						else
							@shop_id = @operationHour.shop_id
							@closeShops_0.push(@shop_id)
						end
					else #close1に値がある
						if @operationHour.open1.to_i < @present.to_i && @operationHour.close1.to_i > @present.to_i || @operationHour.open2.to_i < @present.to_i && @operationHour.close2.to_i > @present.to_i
							p "close1に値あって営業中"
						else
							@shop_id = @operationHour.shop_id
							@closeShops_0.push(@shop_id)
						end
					end
			end

			#p "ここから@cityscape1"
			@cityscape1.each do |id| #side1
				@shopLists = Shop.where(location_id: id).pluck(:id)
				@shopLists.each do |shopList|
					#p "shopをshop_idで調べてるOperationHour"
					@cross_street = Shop.find_by(id: shopList, shop_name: "cross_street")
					@operationHour = OperationHour.find_by(shop_id: shopList)

				if @cross_street
					p "裏道です"
				elsif @operationHour.close1.blank?
					if @operationHour.open1.to_i < @present.to_i && @operationHour.close2.to_i > @present.to_i
						p "営業時間中"
					else
						@shop_id = @operationHour.shop_id
						@closeShops_1.push(@shop_id)
					end
				else #close1に値がある
					if @operationHour.open1.to_i < @present.to_i && @operationHour.close1.to_i > @present.to_i || @operationHour.open2.to_i < @present.to_i && @operationHour.close2.to_i > @present.to_i
						p "close1に値あって営業中"
					else
						@shop_id = @operationHour.shop_id
						@closeShops_1.push(@shop_id)
					end
				end
			end#shopList.each終わり
			end
	end#closeShops終わり#
	
	def search##あいまい検索実験=>ストリート表示##
			params[:search]
			@streetNames=[]
			@s_result=Location.where('location LIKE (?)',"%#{params[:search]}%")
				if !@s_result.blank?
					@street_ids=@s_result.pluck(:street_id).uniq#uniqは重複削除
					@street_ids.each do |street_id|
						 @streetRec=Street.find_by(id: street_id)
						 @streetNames.push(@streetRec)
					end
				else
					p "ありませーーん！"
				end
			 @streetNames=@streetNames.compact#nil要素を削除
			 
				if params[:commit].blank?
					@street_num=3
					p "commit.blankに来てます"
				else
					p @street_num=params[:commit]
					@street_num.to_i
					p "commit受け取ったよー！"
				end
	end##検索実験終わり##

	 helper_method :search
	 helper_method :closeShops
	
end
