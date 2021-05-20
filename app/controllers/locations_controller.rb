class LocationsController < ApplicationController
	require 'mechanize'
	require 'uri'
	require 'date'

	def cityscape0
	end
	
	def cityscape1
	end
	
	def gotoprev
	end
	
	def gotonext
	end

	def index
		p "hellow world again! from location action index"
		search
		p @street_num
		if @street_num.blank?
			@street_num=1
		else
			@street_num=@street_num.to_i	#p "@street_numは#{@street_num}"
		end
		@streetSide = Street.find(@street_num)#=>プロペラ通り

			p @renban=@streetSide.street_name.index("(") #番号の順番。14とか。
			p @renban_end=@streetSide.street_name.index(")") #最後のカッコ順番
			if @renban
				p "連番発生してます"
				@renban_next=@streetSide.street_name.next #＠renban="Omotesando-表参道(3)"
				@renban_next=Street.find_by(street_name: @renban_next)
				if @renban_next.blank?#nil? #あんぱ？
					p "ないなら、prev連番"
					@renban_s=@renban+1
					 @renban_prev=@streetSide.street_name[@renban_s...@renban_end].to_i-1
					 @name_string=@streetSide.street_name[0...@renban]
					 #ない場合の処理を考える、次回！
					p @renban_prev=Street.find_by(street_name: "#{@name_string}(#{@renban_prev})")
				end
			end
		@renbanAction="color:rgb(1,14,95);"

		@cityscape0 = Location.includes(:shops).where(street_id: @streetSide.id, side:0).pluck(:id).uniq#=>[5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
		@cityscape1 = Location.includes(:shops).where(street_id: @streetSide.id, side:1).pluck(:id).uniq#=>[5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
		@many=[@cityscape0.length, @cityscape1.length].max
		p "多いサイドの店舗数"
		p @many

		closeShops
		@grayAction = "border: 6px solid gray;"
		@greenAction = "border: 6px solid yellowgreen;"
		@mallCss = "border-radius: 1vh; border: 5px solid navy;"
		@crossingStreet = "background-color: rgba(2, 15, 100, 0.86); box-shadow:none; border-radius: 0vh; border: 0px; color:rgba(255, 250, 214, 1); height: 9vh;"

		@events = Event.all.limit(5).order('id DESC')#5件制限。降順
		@random = Random.new
		@random = @random.rand(1..3)
		##mall実験##、##表示の実験##、##scraping##、##touchmove実験##=>不要
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
		  #p "このtextみれますか？"		
			p @present = @today.hour.to_s+@hun#=>"2337"
			
			#p "ここから@cityscape0"
			@cityscape0.each do |id| #side0
				@shopLists = Shop.where(location_id: id).pluck(:id)
				@shopLists.each do |shopList|
					@cross_street = Shop.find_by(id: shopList, shop_name: "cross_street")
					@operationHour = OperationHour.find_by(shop_id: shopList, day: @today.wday)
					#p "ここまで到達!cross_streetは#{@cross_street}です"
					p "ここまで到達!shopListは#{shopList}です"
				end

					if @cross_street
						p "Alley-裏通りです"
					elsif @operationHour.blank?
						p "店舗ありません"
					elsif @operationHour.close1.blank?
						if @operationHour.open1.to_i < @present.to_i && @operationHour.close2.to_i > @present.to_i
							p "営業時間中"
						else
							@shop_id = @operationHour.shop_id
							@closeShops_0.push(@shop_id)
							p "shop_id#{@shop_id}しまってます。"
						end
					else #close1に値がある
						if @operationHour.open1.to_i < @present.to_i && @operationHour.close1.to_i > @present.to_i || @operationHour.open2.to_i < @present.to_i && @operationHour.close2.to_i > @present.to_i
							p "close1に値あって営業中"
						else
							@shop_id = @operationHour.shop_id
							@closeShops_0.push(@shop_id)
						end
					end #if @operationHour.blank?の終わり
			end

			#p "ここから@cityscape1"
			@cityscape1.each do |id| #side1
				@shopLists = Shop.where(location_id: id).pluck(:id)
				@shopLists.each do |shopList|
					#p "shopをshop_idで調べてるOperationHour"
					@cross_street = Shop.find_by(id: shopList, shop_name: "cross_street")
					@operationHour = OperationHour.find_by(shop_id: shopList)

				if @cross_street
					p "Alley-裏通りです"
				elsif @operationHour.blank?
					p "店舗ありません"
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
					@street_num=1
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
