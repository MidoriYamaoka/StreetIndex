$(document).ready(function(){
	/*logoタッチ&shop詳細fadeIn*/
	let step_info = $('li.hidei'),
			mallInfo=$('.mallInfo'),
			mallShopInfo=$('ul.mallShopInfo'),
			renbanPrev=$('#gotoPrev'),
			renbanNext=$('#gotoNext'),
			ww=$(window).width(),
			main=$('#main_wrap').offset().top;
			step_info.hide();
			mallInfo.hide();
			mallShopInfo.hide();
			renbanPrev.hide();
			renbanNext.hide();
			//臨時！$('#thegate').hide();

	//長い店名6文字以上で0.8remよ関数
	$('#main_space>ul.shops>span.shop_name, li.tenants>span.shop_nameMall').each(function(i, e){
		//let kore=$(this).text();
		let kantei=$(this).text().length;
		if(kantei>=6){
			$(this).css({'line-height':'0.8rem','font-size':'0.8rem','top':'0.7vh','z-index':'35'});
		}
	});

	$('div#info_fadeout').bind('touchstart', function() {
	//hideのアクション主に「×」=>[No]は下部のhoverで消す. console.log("[No]で消された");
		$(this).parents('li.hidei, div#streetConfirm').hide();
		return false;//消された状態をキープ
	});

	$('div.mallShop_fadeout').bind('touchstart', function() {
		//mallShop要素を消す.console.log("mallShop_fadeoutで消された");
		$(this).parents('ul.mallShopInfo').hide();
		return false;//消された状態をキープ
	});
	
	//fadeInのアクション
	$('ul.shops').bind('touchstart', function() {
		var sw=window.pageXOffset;
		$(this).children('li.hidei').fadeIn().offset({ top: 170, left: 10+sw });
	});
	
	$('li.tenants').bind('touchstart', function() {
		var sw=window.pageXOffset;
		$(this).next('ul.mallShopInfo').fadeIn().offset({ top: 170, left: 10+sw });
	});
	
	//メニューバー表示。
	$('.fas.fa-bars').on('touchstart', function() {
		$(".whatishere").toggleClass('whatisthere');
	});
		
		//ストリート連番
	var cssResultP = $('#renban_prev').css('color');
	$('#renban_prev').on('touchstart', function() {
		if('rgb(1, 14, 95)'==cssResultP){
			renbanPrev.fadeIn();
		}
	});

	var cssResultN = $('#renban_next').css('color');
	$('#renban_next').on('touchstart', function() {
		var sw=window.pageXOffset;
		if('rgb(1, 14, 95)'==cssResultN){
			renbanNext.fadeIn().offset({ top: 170, left: 30+sw });
		}
	});

	//[No]処理:hoverでfadeOut
	$('a#renban_no').hover(function() {
		$('#gotoPrev, #gotoNext').fadeOut();
	});
	//logoタッチ終わり//
	
	//event//
	function eventClone(){
		setTimeout(function(){
			$('ul#event_carousel').clone().appendTo('div#event_area');
		},6000); //7000=>14000=>6000
	}
	eventClone();
	//event終わり//

	//iphoneのkeybordで必要。blur⇄focus//
	$('input').on('touchstart', function(){
		$(this).focus();
	});

	//street_search//
	$('#streetConfirm').hide();
	$('#search_button').on('touchstart', function() {
		let sw=window.pageXOffset;//console.log("swは"+sw+"nowは"+now);//console.log("そしてmainは"+main);
		$('input').blur(function () { //バーチャルキーボードのための設定//
			$(window).scrollTop(0);
			//$('#search_button').css('background-color','red');
			//alert("あらと");
		});
		$('#streetConfirm').delay(1000).fadeIn().offset({left: sw+5});
	});
	
	$('.streetOK').on('touchstart', function() {
		let stid=$(this).data('stid');//console.log(stid);
	});
	//street_search終わり//

	//shop_sort//
	$('div#sort1').on('touchstart', function() {
			let text = "#shopping";
		$('.shop_category').each(function(){
			if(this.innerText.indexOf(text)>-1){
				let shop=$(this).parents('ul');
				shop.toggleClass('changeBoxshadow');
			}	});
	});

	$('div#sort2').on('touchstart', function() {
			let text = "#eat&drink";
		$('.shop_category').each(function(){
			if(this.innerText.indexOf(text)>-1){
				let shop=$(this).parents('ul');
				shop.toggleClass('changeBoxshadow');
			}	});
	});
	
	$('div#sort3').on('touchstart', function() {
		let text = "#salon";
		$('.shop_category').each(function(){
			if(this.innerText.indexOf(text)>-1){
				let shop=$(this).parents('ul');
				shop.toggleClass('changeBoxshadow');
			} });
	});

	$('div#sort4').on('touchstart', function() {
		let text = "#withkids";
		$('.shop_category').each(function(){
			if(this.innerText.indexOf(text)>-1){
				let shop=$(this).parents('ul');
				shop.toggleClass('changeBoxshadow');
			}	});
	});
	//sortswitch
	
	//最初のパスワード
	//	$('#passwordinput').on('touchstart', function(){
	//		let UserInput = prompt("パスワードを入力して下さい:","");
			// 入力内容をチェック
	//		if( /\W+/g.test(UserInput) ) {// 半角英数字以外エラー
	//			alert("半角英数字のみを入力して下さい。");
	//		}else if( UserInput != null ) {
	//			let ans="stin";
	//			if(UserInput==ans){
	//				$('#thegate').hide();
	//			}//ifの終わり
	//		}//else ifの終わり
	//	});

});