$(document).ready(function(){
	/*logoタッチ&shop詳細fadeIn*/
	let step_info = $('li.hidei'),
			mallInfo=$('.mallInfo'),
			mallShopInfo=$('ul.mallShopInfo');
			step_info.hide();
			mallInfo.hide();
			mallShopInfo.hide();
  $('.info_fadeout').bind('touchstart', function() {
  	//step_info.hide();
  	$(this).parent('.hidei').hide();
  	return false;//消された状態をキープ
	});
	
	$('ul.shops').bind('touchstart', function() {
		$(this).children('li.hidei').fadeIn().offset({ top: 300, left: 120 });
	});
	
	$('li.tenants').bind('touchstart', function() {
		console.log("こっちだお");
		$(this).next('ul.mallShopInfo').fadeIn();
	});
	//logoタッチ終わり//
	
	//ぢっけんsass//
	//sass//
	
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
		console.log(stid);
	});
	//street_search終わり//

	//shop_sort//
	$('div#sort1').on('touchstart', function() {
			let text = "#shopping";
		$('.shop_category').each(function(){
			if(this.innerText.indexOf(text)>-1){
				let shop=$(this).parents('ul');
				shop.css('box-shadow','0px 0px 25px 8px rgba(204,126,255,0.6) inset');
			}	});
	});

	$('div#sort2').on('touchstart', function() {
			let text = "#eat&drink";
		$('.shop_category').each(function(){
			if(this.innerText.indexOf(text)>-1){
				let shop=$(this).parents('ul');
				shop.css('box-shadow','0px 0px 28px 6px rgba(91,247,92,0.6) inset');
			}	});
	});
	
	$('div#sort3').on('touchstart', function() {
		let text = "#salon";
		$('.shop_category').each(function(){
			if(this.innerText.indexOf(text)>-1){
				let shop=$(this).parents('ul');
				shop.css('box-shadow','0px 0px 25px 8px rgba(0,222,255,0.6) inset');
			} });
	});

	$('div#sort4').on('touchstart', function() {
		let text = "#withkids";
		$('.shop_category').each(function(){
			if(this.innerText.indexOf(text)>-1){
				let shop=$(this).parents('ul');
				shop.css('box-shadow','0px 0px 25px 8px rgba(0,222,255,0.6) inset');
			}	});
	});
	
	//sortswitch()イマココ！関数をまとめたい。

	//shop_sort終わり//

	//map要素ぐるぐる実験//
	//ぐるぐる実験終わり。物置き場に//
});