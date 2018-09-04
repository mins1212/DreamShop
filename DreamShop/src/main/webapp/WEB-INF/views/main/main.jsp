<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../inc/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	/* Base settings */
	body > #content_wrapper {
		position: fixed;
		top: 0px;
		width: 100%;
		z-index: 1;
	}
	
	/* Slide image(Utube) */
	/* #main_slide {
		position: relative; 
		padding-bottom: 56.25%; 
		height: 0; 
		overflow: hidden;
	}
	#main_slide iframe, #main_slide object, #main_slide embed {
		position: absolute; 
		top: 0; 
		left: 0; 
		width: 100%; 
		height: 100%;
	} */
	
	/* Slide Controller */
	#main_slide #left, #main_slide #right {
		position: absolute;
		bottom: 130px;
		width: 100px;
		height: 40px;
	}
	#main_slide #left {
		left: 30%;
	}
	#main_slide #right {
		right: 30%;
	}
	#main_slide .circle {
		position: absolute;
		bottom: 140px;
		width: 10px;
		height: 10px;
		background: #ddd;
		border: 2px solid #bbb;
		border-radius: 50%;
	}
	#main_slide .circle:HOVER {
		background: #fff;
		border-color: #ddd;
		box-shadow: 0px 0px 3px 3px #fff;
	}
	#main_slide .hover {
		background: #fff;
		border-color: #ddd;
		box-shadow: 0px 0px 3px 3px #fff;
	}
	#main_slide #circle1 {
		left: 45%;
	}
	#main_slide #circle2 {
		left: 49%;
	}
	#main_slide #circle3 {
		left: 53%;
	}
	
	/* Main Category */
	#main_category {
		width: 100%;
	}
</style>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
var btnCount = 1;
var slide = new Array();
slide[1] = "<iframe id='slide1' class='slide' width='854' height='480' src='https://www.youtube.com/embed/8vHPa1hADm8?controls=0&autoplay=1&loop=1&showinfo=0&start=1&vq=hd1080&disablekb=1&modestbranding=1&rel=0&fs=0' frameborder='0' allow='autoplay; encrypted-media' fullscreen='true'></iframe>";
slide[2] = "<img id='slide2' class='slide' alt='slide2' src='${ctx_path}/img/slide2.jpg'>";
slide[3] = "<img id='slide3' class='slide' alt='slide3' src='${ctx_path}/img/slide3.jpg'>";

$(document).ready(function() {
    $("#main_slide").append(slide[1]);
    $("#circle1").addClass("hover");
    sizing();
    
    $(".circle").click(function(event){
    	var btn = $(this).attr("id");
    	if(btn == "circle1" && btnCount != 1) {
    		insertColor("#circle1", btnCount);
        	sizing();
    		btnCount = 1;
    	} else if(btn == "circle2" && btnCount != 2) {
    		insertColor("#circle2", btnCount);
        	sizing();
    		btnCount = 2;
    	} else if(btn == "circle3" && btnCount != 3) { 
    		insertColor("#circle3", btnCount);
        	sizing();
    		btnCount = 3;
    	} 
    });
    $(".lr").click(function(event){
    	var btn = $(this).attr("id");
    	if(btn == "left") {
    		if(btnCount == 1) {
    			$("#circle3").trigger("click");
    		} else {
    			var cir = "#circle" + (btnCount-1);
    			$(cir).trigger("click");
    		}
    	} else if(btn == "right") {
    		if(btnCount == 3) {
    			$("#circle1").trigger("click");
    		} else {
    			var cir = "#circle" + (btnCount+1);
    			$(cir).trigger("click");
    		}
    	} 
    });
}); 
$(window).resize(function (){
	sizing();
})
function sizing() {
    $(".slide").width($(window).width());
	$(".slide").height($(window).height());
    $(".slide").css("pointer-events", "none");
}
function insertColor(name, num) {
	var no1 = name.substr(name.length - 1);
	var no2 = $("#slide" + num);
	var no3 = $("#circle" + num);
	$(name).addClass("hover");
	$(no3).removeClass("hover");
	$("#main_slide").append(slide[no1]);
	$(no2).remove();
}
</script>
</head>
<body>
	<div id="content_wrapper">
		<!-- Main Slide -->
		<div id="main_slide">
			<img id="left" class="lr" alt="left" src="${ctx_path}/img/left.png">
			<div class="circle" id="circle1"></div>
			<div class="circle" id="circle2"></div>
			<div class="circle" id="circle3"></div>
			<img id="right" class="lr" alt="right" src="${ctx_path}/img/right.png">
		</div>
		
		<!-- Main Category -->
		<div id="main_category">
			<div id=""></div><!-- 아날로그 시계가 돌아가도록 낮~밤 분위기나 시간에 맞춰서 올ㅋ -->
		</div>
		
		<!-- Main Map -->
		<div id="main_map">
			
		</div>
	</div>
<div></div>
</body>
</html>
