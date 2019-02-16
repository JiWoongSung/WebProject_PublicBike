var make =[];
var contentList = [];
var lati = [];
var longi = [];
var placeN = [];
var countL = [];


var map = new naver.maps.Map('map', {
	    center: new naver.maps.LatLng(37.566612, 126.97747),
	    zoom: 10,
	    mapTypeControl: true
});
naver.maps.Event.addListener(map, 'idle', function() {
    updateMarkers(map, make);
});

var bounds = map.getBounds(),
southWest = bounds.getSW(),
northEast = bounds.getNE(),
lngSpan = northEast.lng() - southWest.lng(),
latSpan = northEast.lat() - southWest.lat();


function getList(){

	$.ajax({
		url:'server.jsp',
		success:function(data){
			var obj = JSON.parse(data);
			var memberList = obj.list;
			for (var i=0; i<memberList.length; i++){
				var placeName = memberList[i].name;
				var latitude = memberList[i].latitude;
				var longitude = memberList[i].longitude;
				var count = memberList[i].count;
				placeN.push(placeName);
				countL.push(count);
				lati.push(latitude);
				longi.push(longitude);
				var marker = new naver.maps.Circle({
				    map: map,
				    center: new naver.maps.LatLng(latitude, longitude),
				    radius: 40,
//				    fillColor: '#01DF01',
				    fillOpacity: 0.8,
				    
				});
				marker.setClickable(true);
//				var marker = new naver.maps.Marker({
////				    position: new naver.maps.LatLng(latitude, longitude),
////				    map: map,
//				    position: new naver.maps.LatLng(latitude, longitude),
//				    map: map,
//				    title: 'Green',
//				    icon: {
//				        content: [
//				                    '<div class="cs_mapbridge">',
//				                        '<div class="map_group _map_group crs">',
//				                            '<div class="map_marker _marker num1 num1_big"> ',
//				                                '<span class="ico _icon"></span>',
//				                                '<span class="shd"></span>',
//				                            '</div>',
//				                        '</div>',
//				                    '</div>'
//				                ].join(''),
//				        size: new naver.maps.Size(38, 58),
//				        anchor: new naver.maps.Point(19, 58),
//				    },
//				    
//				});
				var contentString = [
					'<div class="iw_inner" style="width:200px; padding:10px;">',
					'<h5><b>'+placeName+'</b></h5>',
					'<p>수량:'+count+'</p>',
					'</div>'
					
				].join('');

				var infoWindow = new naver.maps.InfoWindow({
					anchorSkew: true,
					content : contentString
					
				});
				
				make.push(marker);
				contentList.push(infoWindow);
			}
			for (var i = 0, ii = make.length; i < ii; i++) {
				naver.maps.Event.addListener(make[i], 'click', clickHandler(i));
			}
		}
	})
}

function resetData(){
	$.ajax({
		url:'server.jsp',
		success:function(data){
			var obj = JSON.parse(data);
			var memberList = obj.list;
			for (var i=0; i<memberList.length; i++){
				var placeName = memberList[i].name;
				var count = memberList[i].count;
				var contentString = [
					'<div class="iw_inner" style="width:200px; padding:10px;">',
					'<h5><b>'+placeName+'</b></h5>',
					'<p>수량:'+count+'</p>',
					'</div>'
					
				].join('');
				if (count >= 15){
					make[i].setStyles("fillColor","#088A29");
				}
				else if (count >= 5){
					make[i].setStyles("fillColor","#FF8000");
				}
				else{
					make[i].setStyles("fillColor","#DF0101");
				}
				contentList[i].setContent(contentString);
			}		
		}
	})
}

function updateMarkers(map, markers) {

    var mapBounds = map.getBounds();
    var marker, position;

    for (var i = 0; i < markers.length; i++) {

        marker = markers[i]
        position = marker.getCenter();
//        position = marker.getPosition();

        if (mapBounds.hasLatLng(position)) {
            showMarker(map, marker);
        } else {
            hideMarker(map, marker);
        }
        
    }

}

function showMarker(map, marker) {

    if (marker.getMap()) return;
    marker.setMap(map);
}

function hideMarker(map, marker) {

    if (!marker.getMap()) return;
    marker.setMap(null);
}
//for (var i=0,ii=lati.length; i<ii; i++){
//	var marker = new naver.maps.Marker({
//	    position: new naver.maps.LatLng(lati[i], longi[i]),
//	    map: map
//	    
//	});
//	var contentString = [
//		'<div class="iw_inner" style="width:200px; padding:10px;">',
//		'<h5><b>'+placeN[i]+'</b></h5>',
//		'<p>수량:'+countL[i]+'</p>',
//		'</div>'
//		
//	].join('');
//
//	var infoWindow = new naver.maps.InfoWindow({
//		anchorSkew: true,
//		content : contentString
//		
//	});
//	make.push(marker);
//	contentList.push(infoWindow);
//	
//}



function clickHandler(seq) {
	return function(e) {
		var marker = make[seq], infoWindow = contentList[seq];

		if (infoWindow.getMap()) {
			
			infoWindow.close();
		} else {
			
			infoWindow.open(map, marker.getCenter());
		}
	}
}


function searchAddressToCoordinate(address) {
	
	naver.maps.Service
			.geocode(
					{
						address : address
					},
					
					function(status, response) {
						
						if (status === naver.maps.Service.Status.ERROR) {
							return alert('지도에 표시할 수 없습니다.');
						}

						var item = response.result.items[0], addrType = item.isRoadAddress ? '[도로명 주소]'
								: '[지번 주소]', point = new naver.maps.Point(
								item.point.x, item.point.y);
						var contentString = [
							'<div style="width:200px; padding:10px; line-height:150%;">',
							'<h5><b>'+response.result.userquery+'</b></h5>',
							'<p>'+addrType + ' ' + item.address+'</p>',
							'</div>'
							
						].join('');

						var infoWindow = new naver.maps.InfoWindow({
							anchorSkew: true,
							content : contentString
							
						});
//						infoWindow
//								.setContent([
//										'<div style="padding:10px;min-width:200px;line-height:150%;">',
//										'<h4 style="margin-top:5px;">검색 주소 : '
//												+ response.result.userquery
//												+ '</h4><br />',
//										addrType + ' ' + item.address
//												+ '<br />', '</div>' ]
//										.join('\n'));

						map.setCenter(point);
						infoWindow.open(map, point);
					});
}

function initGeocoder() {

	$('#search').on('keydown', function(e) {
		
		var keyCode = e.which;
		

		if (keyCode === 13) { // Enter Key
			e.preventDefault();
			searchAddressToCoordinate($('#search').val());
			$.ajax({
				url : 'server.jsp',
				data : {
					name : $("#search").val()
				},
				success : function(data) {
					
					var obj = JSON.parse(data);
					var memberList = obj.list;

					$('#placeList').empty();
					for (var i=0; i<memberList.length; i++){
						var placeName = memberList[i].name;
						var bu = document.createElement("button");
						bu.innerHTML = placeName;
						bu.className ="list-group-item";
						bu.value = memberList[i].location;
						bu.id = i;
						$('#placeList').append(bu);
					}
					for (var i=0; i<memberList.length; i++){
						$('#'+i).on('click',function(e){
							var stringSplit = this.value.split(' ');
							var s1 = parseFloat(stringSplit[0]);
							var s2 = parseFloat(stringSplit[1]);
							var point = new naver.maps.Point(
									s2, s1);
							var contentString = [
								'<div class="iw_inner" style="width:200px; padding:10px;">',
								'<h5><b>'+this.innerHTML+'</b></h5>',
								'<p>수량: '+stringSplit[2]+' </p>',
								'</div>'
								
							].join('');

							var infoWindow = new naver.maps.InfoWindow({
								anchorSkew: true,
								content : contentString
								
							});
							map.setCenter(point);
							infoWindow.open(map,point);
//							alert(stringSplit[0]);
//							alert(stringSplit[1]);
						})
					}
				},
				error : function() {
					alert('data error');
				}
			})
			
		}
	});

	$('#execute').on('click', function(e) {
		e.preventDefault();
		searchAddressToCoordinate($('#search').val());
		
		$.ajax({
			url : 'server.jsp',		
			data : {
				name : $("#search").val()
			},

			success : function(data) {
				var obj = JSON.parse(data);
				var memberList = obj.list;
				$('#placeList').empty();
				for (var i=0; i<memberList.length; i++){
					var placeName = memberList[i].name;
//					var li = document.createElement("li");
//					var a = document.createElement("a");
//					a.id = i;
//					a.value = memberList[i].location;
//					a.innerHTML = placeName;
//					li.append(a);
//					$('#placeList').append(li);
					var bu = document.createElement("button");
					bu.innerHTML = placeName;
					bu.className ="list-group-item";
					bu.value = memberList[i].location;
					bu.id = i;
					$('#placeList').append(bu);
				}
				for (var i=0; i<memberList.length; i++){
					$('#'+i).on('click',function(e){
						var stringSplit = this.value.split(' ');
						var s1 = parseFloat(stringSplit[0]);
						var s2 = parseFloat(stringSplit[1]);
						var point = new naver.maps.Point(
								s2, s1);
						var contentString = [
							'<div class="iw_inner" style="width:200px; padding:10px;">',
							'<h5><b>'+this.innerHTML+'</b></h5>',
							'<p>수량:'+stringSplit[2]+'</p>',
							'</div>'
							
						].join('');

						var infoWindow = new naver.maps.InfoWindow({
							anchorSkew: true,
							content : contentString
							
						});
						map.setCenter(point);
						infoWindow.open(map,point);

					})
				}
			},
			error : function() {
				alert('data error');
			}
		})
	});
	
}
$(document).ready(function(){
	getList();
	setInterval(resetData,1000);
});

naver.maps.onJSContentLoaded = initGeocoder;