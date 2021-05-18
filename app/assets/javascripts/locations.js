$(document).ready(function(){
	/*logoタッチ&shop詳細fadeIn*/
	let step_info = $('li.hidei'),
			mallInfo=$('.mallInfo'),
			mallShopInfo=$('ul.mallShopInfo'),
			renbanPrev=$('#gotoPrev');
			renbanNext=$('#gotoNext');
			step_info.hide();
			mallInfo.hide();
			mallShopInfo.hide();
			renbanPrev.hide();
			renbanNext.hide();
			//臨時！$('#thegate').hide();
			
	$('div.info_fadeout').bind('touchstart', function() {
	//hideのアクション主に「×」=>[No]は下部のhoverで消す. console.log("[No]で消された");
		$(this).parents('li.hidei').hide();
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
			$('#gotoPrev').fadeIn();
		}
	});

	var cssResultN = $('#renban_next').css('color');
	$('#renban_next').on('touchstart', function() {
		if('rgb(1, 14, 95)'==cssResultN){
			$('#renban_next').fadeIn();
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

	//street_search//
	$('#streetConfirm').hide();
	$('#search_button').on('touchstart', function() {
		var sw=window.pageXOffset;//console.log("swは"+sw);
		$('#streetConfirm').fadeIn().offset({top: 170, left: sw+10});
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
		$('#passwordinput').on('touchstart', function(){
			let UserInput = prompt("パスワードを入力して下さい:","");
			// 入力内容をチェック
			if( /\W+/g.test(UserInput) ) {// 半角英数字以外エラー
				alert("半角英数字のみを入力して下さい。");
			}else if( UserInput != null ) {
				let ans="stin";
				if(UserInput==ans){
					$('#thegate').hide();
				}//ifの終わり
			}//else ifの終わり
		});

});