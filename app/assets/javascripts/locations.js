$(document).ready(function(){
	/*logoタッチ&shop詳細fadeIn*/
	let step_info = $('li.hidei'),
			mallInfo=$('.mallInfo'),
			mallShopInfo=$('ul.mallShopInfo');
			step_info.hide();
			mallInfo.hide();
			mallShopInfo.hide();
	$('div.info_fadeout').bind('touchstart', function() {
		//shop要素、cross_streetを消す
		$(this).parents('li.hidei').hide();
		return false;//消された状態をキープ
	});
	$('div.mallShop_fadeout').bind('touchstart', function() {
		//mallShop要素を消す
		$(this).parents('ul.mallShopInfo').hide();
		return false;//消された状態をキープ
	});
	
	$('ul.shops').bind('touchstart', function() {
		$(this).children('li.hidei').fadeIn().offset({ top: 300, left: 120 });
	});
	
	$('li.tenants').bind('touchstart', function() {
		$(this).next('ul.mallShopInfo').fadeIn();
	});
	//logoタッチ終わり//
	
	//event//
	function eventClone(){
		setTimeout(function(){
			$('ul#event_carousel').clone().appendTo('div#event_area');
		},6000);
	}
	eventClone();
	//event終わり//

	//street_search//
	let streetCon=$('#streetConfirm');
	$('#streetConfirm').hide();
	$('#search_button').on('touchstart', function() {
		$('#streetConfirm').delay(200).fadeIn();
	});
	$('.streetOK').on('touchstart', function() {
		let stid=$(this).data('stid');
		//console.log(stid);
	});
	//street_search終わり//

	//shop_sort//

	$('div#sort1').on('touchstart.one', function() {
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
	//sortswitch()イマココ！関数をまとめたい。

	//shop_sort終わり//

	//map要素ぐるぐる実験//
	//ぐるぐる実験終わり。物置き場に//
});