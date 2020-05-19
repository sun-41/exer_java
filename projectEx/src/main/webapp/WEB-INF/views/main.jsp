<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!-- 796afd80e35a43896b3a73d7a209d7bc  37.4824, 127.00460 -->
<%
  request.setCharacterEncoding("UTF-8");
%> 
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<% Date nowTime = new Date(); %>


<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>메인 페이지</title>
</head>
  <body>
	<div id="map" style="width: 100%; height: 500px;"></div>
	<p id="result"></p>

	<!-- 지도표시  -->
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=796afd80e35a43896b3a73d7a209d7bc">
	</script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.4824, 127.00460), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨 
		};
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		
		
		<!-- 지도에 사각형 표시 --> 
		var sw = new kakao.maps.LatLng(37.482842, 127.0045), // 사각형 영역의 남서쪽 좌표
		    ne = new kakao.maps.LatLng(37.481599,  127.003176); // 사각형 영역의 북동쪽 좌표

		// 사각형을 구성하는 영역정보를 생성합니다
		// 사각형을 생성할 때 영역정보는 LatLngBounds 객체로 넘겨줘야 합니다
		var rectangleBounds = new kakao.maps.LatLngBounds(sw, ne);

		// 지도에 표시할 사각형을 생성합니다
		var rectangle = new kakao.maps.Rectangle({
		    bounds: rectangleBounds, // 그려질 사각형의 영역정보입니다
		    strokeWeight: 4, // 선의 두께입니다
		    strokeColor: '#FF3DE5', // 선의 색깔입니다
		    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'shortdashdot', // 선의 스타일입니다
		    fillColor: '#FF8AEF', // 채우기 색깔입니다
		    fillOpacity: 0.8 // 채우기 불투명도 입니다
		});
		// 지도에 사각형을 표시합니다
		rectangle.setMap(map);
		
		
		<!-- 드래그 가능 마커 생성 --> 
		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(37.4824, 127.00460); 
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		// 마커가 드래그 가능하도록 설정합니다 
		marker.setDraggable(true);
		// 마커 좌표를 반환합니다.
		marker.getPosition();

		
		<!-- 사각형에 들어 갔을시 이벤트 발생 --> 
 		// 사각형에 geolocation 이벤트를 등록합니다
		 kakao.maps.event.addListener(marker, 'dragend', function() {
		 var pos = marker.getPosition();
		 var isContain = rectangleBounds.contain(pos);
		  
		 if (isContain) {
	     console.log(event);			    	
		 var resultDiv = document.getElementById('result');
		 resultDiv.innerHTML = '출퇴근이 가능합니다!';
		
 		 var markeroverOption = { 
		 fillColor: '#A2FF99', // 채우기 색깔입니다
		 fillOpacity: 0.8 // 채우기 불투명도 입니다        
		 };
 		 rectangle.setOptions(markeroverOption);
 		 document.getElementById("test_div").style.display="block";
 	
		 }
 
		 else {
	     var downCount = 0;	
		 console.log(event);			    	
		 var resultDiv = document.getElementById('result');
	     resultDiv.innerHTML = '거리가 너무 멉니다!';	 
	     
		 var markeroutOption = {
		 fillColor: '#FF8AEF', // 채우기 색깔입니다 
		 fillOpacity: 0.7 // 채우기 불투명도 입니다        
		 };
		 rectangle.setOptions(markeroutOption);
 		 document.getElementById("test_div").style.display="none";
		 }
		 });
 					
			
/* 		<!-- 현재위치 -->
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {

			// GeoLocation을 이용해서 접속 위치를 얻어옵니다
			navigator.geolocation.getCurrentPosition(function(position) {

				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도

				var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
				message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다

				// 마커와 인포윈도우를 표시합니다
				displayMarker(locPosition, message);

			});

		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다

			var locPosition = new kakao.maps.LatLng(33.450701, 126.570667), 
			message = 'geolocation을 사용할수 없어요..'

			displayMarker(locPosition, message);
		}

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map,
				position : locPosition
			});

			var iwContent = message, // 인포윈도우에 표시할 내용
			iwRemoveable = true;

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
				content : iwContent,
				removable : iwRemoveable
			});

			// 인포윈도우를 마커위에 표시합니다 
			infowindow.open(map, marker);

			// 지도 중심좌표를 접속위치로 변경합니다
			map.setCenter(locPosition);
		} */
		
/* 		 function fn_enable(obj){ //퇴근하기 클릭시 텍스트박스 활성화
			 document.getElementById("commute.id").disabled;
			 document.getElementById("commute.name").disabled;
			 document.getElementById("commute.job").disabled;
			 document.getElementById("commute.attendance").disabled;
			 document.getElementById("commute.absent").disabled=false;
			 document.getElementById("commute.workweek").disabled;
		 } */
		
		function btn2(){
		    alert('벌써 퇴근하시게요??');
		}
		</script>
		
		<!--  시간 표시 -->
		<script>
		function printClock() {
	    
	    var clock = document.getElementById("clock");            // 출력할 장소 선택
	    var currentDate = new Date();                                     // 현재시간
	    var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
	    var amPm = 'AM'; // 초기값 AM
	    var currentHours = addZeros(currentDate.getHours(),2); 
	    var currentMinute = addZeros(currentDate.getMinutes() ,2);
	    var currentSeconds =  addZeros(currentDate.getSeconds(),2);
	    
	    if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
	    	amPm = 'PM';
	    	currentHours = addZeros(currentHours - 12,2);
	    }
	
	    if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
	       currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
	    }
	    clock.innerHTML = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:50px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
	    
	    setTimeout("printClock()",1000);         // 1초마다 printClock() 함수 호출
		}
	
		function addZeros(num, digit) { // 자릿수 맞춰주기
		  var zero = '';
		  num = num.toString();
		  if (num.length < digit) {
		    for (i = 0; i < digit - num.length; i++) {
		      zero += '0';
		    }
		  }
		  return zero + num;
		}
		</script>
		<body>
		<body onload="printClock()">
			<div style="border:1px solid #dedede; width:100%; height:120px; line-height:80px; color:#666;font-size:100px; text-align:center;" id="clock">
			</div>
		</body>
		
		<!-- 		<script>
		function fn_workForm(isLogOn,workForm,loginForm){
	    if(isLogOn != '' && isLogOn != 'false'){
	    location.href=workForm;
	 	 }
	    else{
	    alert("로그인 후 출퇴근이 가능합니다.")
	    location.href=loginForm+'?action=/commute/workForm.do';
	  	}
		}
		</script>
	 -->
		
		<div id ="test_div" style="display:none;"> 
		<!--  출퇴근 버튼 -->

  		 <table border="1"  width="100%" align="center" >
         <tr align="center"> 
          
      	 <td colspan="3">
	     <input type="button" value="출근" onclick="location.href='commute/workForm.do'"> 
         </td>
         
         <td colspan="3">
            <input type="button" value="퇴근" onclick="btn2()"> 
         </td>
      	</tr>
  		</table>
	
		</div>
  </body>
</html>