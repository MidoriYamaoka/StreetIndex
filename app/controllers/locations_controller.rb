class LocationsController < ApplicationController
	require 'mechanize'
	require 'uri'
	require 'date'

	def cityscape0
	end
	
	def cityscape1
	end

	def index
		@today = Time.zone.now
		p "hellow world again! from location action index"
		search
		p @street_num
		if @street_num.blank?
			@street_num=1
		else
			@street_num=@street_num.to_i
			#p "今@street_numの値は#{@street_num}ですよ"
		end
		@streetSide = Street.find(@street_num)#=>プロペラ通り
		@cityscape0 = Location.where(street_id: @streetSide.id, side:0).pluck(:id)#=>[5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
		@cityscape1 = Location.where(street_id: @streetSide.id, side:1).pluck(:id)#=>[5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

		closeShops
		@grayAction = "border: 6px solid gray; box-shadow: 0px 0px 36px 18px rgba(73,74,76,0.47) inset;"
		@greenAction = "border: 6px solid yellowgreen; box-shadow: 0px 0px 36px 18px rgba(73,74,76,0.47) inset;"
		@mallCss = "border-radius: 1vh; border: 5px solid navy;"
		@crossingStreet = "background-color: rgba(159, 101, 115, 0.65); box-shadow:none ;border-radius: 0vh; border: 0px;"

		@events = Event.all
		@random = Random.new
		@random = @random.rand(1..3)
		##mall実験##
		##表示の実験##
		##scraping##
		##touchmove実験##=>不要。
	end
	
	def closeShops##営業時間反映実験##
			p "クロー！"
			p @streetSide.id
			@closeShops_0 = []
			@closeShops_1 = []
			p @today = Time.zone.now#=>Thu, 24 Dec 2020 12:15:09 JST +09:00
			@hun = @today.min.to_s
		  if @hun.length === 1#=>1桁なら0を追加
		  	@hun = "0"+@hun
		  end
			p @present = @today.hour.to_s+@hun#=>"2337"
			
			#@cityscape = Location.where(street_id: @street_num).pluck(:id)
			#[1, 2, 3, 4, 21, 22, 23, 24, 25, 26, 27, 28, 29]
			#@cityscape0 = Location.where(street_id: @streetSide.id, side:0).pluck(:id)#=>[5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
			#@cityscape1 = Location.where(street_id: @streetSide.id, side:1).pluck(:id)#=>[5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
			
			p @cityscape0#<=イマココ！まだこのアクションに値が入ってないっぽい。_1も同じだと思う。2/8
			@cityscape0.each do |id|
				@shopLists = Shop.where(location_id: id).pluck(:id)
				@shopLists.each do |shop_id|
					@operationHour = OperationHour.find_by(shop_id: 51)
				end

					if @operationHour.open.to_i < @present.to_i && @operationHour.close.to_i > @present.to_i
						p "営業時間中"
					else
						@shop_id = @operationHour.shop_id
						@closeShops_0.push(@shop_id)
					end
			end
			@cityscape1.each do |id|
				@shopLists = Shop.where(location_id: id).pluck(:id)
				@shopLists.each do |shop_id|
					@operationHour = OperationHour.find_by(shop_id: 51)
				end

					if @operationHour.open.to_i < @present.to_i && @operationHour.close.to_i > @present.to_i
						p "営業時間中"
					else
						@shop_id = @operationHour.shop_id
						@closeShops_1.push(@shop_id)
					end
			end
			#p closeShops
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
