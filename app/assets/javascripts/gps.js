$(document).ready(function(){

function getLocation(){
    if(navigator.geolocation){
        navigator.geolocation.getCurrentPosition(success, error, {"enableHighAccuracy": false, "timeout": 300, "maximumAge": 100});
        function success(result){
            var lat = result.coords.latitude;
            var lng = result.coords.longitude;
            var uri = "https://www.finds.jp/ws/rgeocode.php?json&lat=" + lat + "&lon=" + lng
            $.getJSON(uri)
                .done(function(json){
                    if(json.status == 200){
                        alert(json.result.prefecture.pname + json.result.municipality.mname + json.result.local[0].section);
                    }else{
                        alert("現在位置サービスの取得に失敗しました。(status = " + json.status + ")");
                    }
                })
                .fail(function(){
                    alert("現在位置サービスの取得に失敗しました。");
                })
        }
        function error(error){
            var errorMsg = {
                0: "原因不明のエラーにより、現在位置を取得出来ませんでした。",
                1: "位置情報の取得が許可されていません。端末の設定をご確認下さい。",
                2: "位置情報が取得出来ませんでした。",
                3: "タイムアウトにより、位置情報が取得出来ませんでした。",
            };
            if(errorMsg[error.code] === undefined){error.code = 0;}
            alert(errorMsg[error.code]);
        }
    }else{
        alert("お使いの端末では、現在位置を取得出来ません。");
    }
}

	$('.fas.fa-location-arrow').bind('touchstart', function() {
		getLocation();
	});
	
	$('.fa-layers.fa-fw').hide();

});