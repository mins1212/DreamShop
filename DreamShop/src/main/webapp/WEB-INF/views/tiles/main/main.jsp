<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../inc/common.jsp"%>
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
	
	/* Main Controll cl */
	#controll_cl {
		position: relative;
		width: 100%;
		background-image: url("${ctx_path}/img/tokey.png");
		background-size: 100% 100%;
		background-repeat: no-repeat;
		z-index: 1;
	}
	#hand_cover {
		position: absolute;
		top: 0px;
		left: 0px;
		width: 100%;
		height: 100%;
	}
	#hour_hand {
		position: absolute;
		top: 33.9%;
		left: 14.1%;
		background-image: url("${ctx_path}/img/Hour_Hand.png");
		background-size: 100% 100%;
		width: 3%;
		height: 25%;
		z-index: 104;
	}
	#front_frame {
		position: relative;
		top: 0px;
		left: 0px;
		width: 100%;
		height: 800px;
		z-index: 2;
	}
	#frames, #images {
		position: absolute;
		top: 20%;
		left: 50%;
	}
	#frames2, #images2 {
		position: absolute;
		top: 63%;
		left: 50%;
	}
	#frames3, #images3 {
		position: absolute;
		top: 20%;
		left: 75%;
	}
	#frames4, #images4 {
		position: absolute;
		top: 63%;
		left: 75%;
	}
	#frames, #images, #frames2, #images2, #frames3, #images3, #frames4, #images4 {
		width: 22%;
		height: 35%;
		background-size: 100% 100%;
	}
	#frames, #frames2, #frames3, #frames4 {
		background-image: url("${ctx_path}/img/home_frame.png");
		text-align: center;
		z-index: 101;
		box-shadow: -3px 3px 10px 5px rgba(0, 0, 0, 0.6);
	}
	#images, #images2, #images3, #images4 {
		background-image: url("${ctx_path}/img/slide3.jpg");
		z-index: 100;
	}
	
	/* Main map Setting */
	#main_map {
		width: 100%;
		overflow: scroll;
		overflow-x: hidden;
		-ms-overflow-style: none;
	}
	::-webkit-scrollbar {display:none;}
	#map_image {
		position: relative;
		width: 100%;
	}
	#map_image_cover {
		position: absolute;
		bottom: 0px;
		left: 0px;
		width: 100%;
		height: 30%;
		background-image: url("${ctx_path}/img/map_image_base.png");
		background-size: 100% 130%;
	}
</style>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
/* Settings */
var btnCount = 1;
var slide = new Array();
slide[1] = "<iframe id='slide1' class='s_img' width='854' height='480' src='https://www.youtube.com/embed/8vHPa1hADm8?controls=0&autoplay=1&loop=1&showinfo=0&start=1&vq=hd1080&disablekb=1&modestbranding=1&rel=0&fs=0' frameborder='0' allow='autoplay; encrypted-media' fullscreen='true'></iframe>";
slide[2] = "<img id='slide2' class='s_img' alt='slide2' src='${ctx_path}/img/slide2.jpg'>";
slide[3] = "<img id='slide3' class='s_img' alt='slide3' src='${ctx_path}/img/slide3.jpg'>";

var change_img = new Array();
change_img[1] = "${ctx_path}/img/175032.jpg";
change_img[2] = "${ctx_path}/img/dawn-on-the-sea.jpg";
change_img[3] = "${ctx_path}/img/painel.jpg";
change_img[4] = "${ctx_path}/img/slide3.jpg";

var dig = 0;
var divCenterX = null;
var divCenterY = null;
var win_h;

$(document).ready(function() {
    $("#main_slide").append(slide[1]);
    $("#circle1").addClass("hover");
    sizing();
    hourPosition();
    
    /* Slide buttons setting */
    $(".circle").click(function(event){
    	var btn = $(this).attr("id");
    	if(btn == "circle1" && btnCount != 1) {
    		insertColor("#circle1", btnCount);
    		btnCount = 1;
    	} else if(btn == "circle2" && btnCount != 2) {
    		insertColor("#circle2", btnCount);
    		btnCount = 2;
    	} else if(btn == "circle3" && btnCount != 3) { 
    		insertColor("#circle3", btnCount);
    		btnCount = 3;
    	} 
        hourPosition();
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
    
    /* Timer start and Drag */
    var timer = setInterval( function(){ digital(); }, 1000);
    $("#hour_hand").draggable({
        opacity: 0.01, 
        helper: 'clone',
        drag: function(event, ui){
        	var r = Math.atan2(divCenterX-event.pageX, divCenterY-event.pageY);
        	if (r < 0) 
        	 	r += Math.PI * 2;
        	var d = r*180/Math.PI;
        	while (d < 0)
        	 	d += 360;
        	d = 360 - d;
        	moveAngle(d);
        	dig = d;
        }
    }); 
    
    /* Scroll the page */
    win_h = $(window).height();
    $('.box').each(function(index) {
		$(this).attr("data_index", win_h * index);
	});
    $('.box').on("mousewheel", function(e) {
		var sectionPos = parseInt($(this).attr("data_index"));
		if(e.originalEvent.wheelDelta >= 0) {
			$("html, body").stop().animate({scrollTop: sectionPos - win_h}, {duration: 500, complete: function () {}});
		} else if(e.originalEvent.wheelDelta < 0) {
			$("html, body").stop().animate({scrollTop: sectionPos + win_h}, {duration: 500, complete: function () {}});
		}
	});
}); 

/* Page size setting */
$(window).resize(function (){
	sizing();
    hourPosition();
    win_h = $(window).height();
});
function sizing() {
    $(".slide").width($(window).width());
	$(".slide").height($(window).height());
	$(".s_img").width($(window).width());
	$(".s_img").height($(window).height());
    $(".s_img").css("pointer-events", "none");
}

/* Clock position setting */
function hourPosition() {
	var divEl = $("#hour_hand");
    var divX = divEl.offset().left;
    var divY = divEl.offset().top;
    var divHalfWidth = divEl.width() / 2;
    var divHalfHeight = divEl.height() / 2;
    divCenterX = divX + divHalfWidth;
    divCenterY = divY + divHalfHeight;
}

/* Slide page Transitions setting */
function insertColor(name, num) {
	var no1 = name.substr(name.length - 1);
	var no2 = $("#slide" + num);
	var no3 = $("#circle" + num);
	$(name).addClass("hover");
	$(no3).removeClass("hover");
	$(no2).fadeOut(300, function () {
		$(no2).remove();
		var jq = $(slide[no1]);
		jq.hide();
		$("#main_slide").append(jq);
		sizing();
		jq.fadeIn(300);
	});
}

/* Clock timer setting */
function digital() {
	dig += 6; 
	if(dig > 360) 
		dig -= 360;
	moveAngle(dig);
}

/* Second hand angle setting  */
function moveAngle(ds) {
	var jq = $("#images");
	var jq2 = $("#images2");
	var jq3 = $("#images3");
	var jq4 = $("#images4");
	
	if(ds >= 0 && ds < 6) {
		imageIn(jq, change_img[1]);
		imageIn(jq2, change_img[2]);
		imageIn(jq3, change_img[3]);
		imageIn(jq4, change_img[4]);
	} else if(ds >= 90 && ds < 96) {
		imageIn(jq, change_img[2]);
		imageIn(jq2, change_img[4]);
		imageIn(jq3, change_img[1]);
		imageIn(jq4, change_img[3]);
	} else if(ds >= 180 && ds < 186) {
		imageIn(jq, change_img[3]);
		imageIn(jq2, change_img[1]);
		imageIn(jq3, change_img[4]);
		imageIn(jq4, change_img[2]);
	} else if(ds >= 270 && ds < 276) {
		imageIn(jq, change_img[4]);
		imageIn(jq2, change_img[3]);
		imageIn(jq3, change_img[2]);
		imageIn(jq4, change_img[1]);
	} 
	
	/* IE 10+, Firefox */
	document.getElementById("hour_hand").style.transform = "rotate(" + ds + "deg)";
	/* IE 9 */
	document.getElementById("hour_hand").style.MsTransform = "rotate(" + ds + "deg)";
	/* Opera, Chrome, Safari */
	document.getElementById("hour_hand").style.WebkitTransform = "rotate(" + ds + "deg)";
	
}
function imageIn(jq, img) {
	jq.hide();
	jq.css("background-image", "url('" + img + "')").fadeIn(500);
}
</script>
</head>
<body>
	<div id="content_wrapper">
		<!-- Main Slide -->
		<div id="main_slide" class="slide box">
			<img id="left" class="lr" alt="left" src="${ctx_path}/img/left.png">
			<div class="circle" id="circle1"></div>
			<div class="circle" id="circle2"></div>
			<div class="circle" id="circle3"></div>
			<img id="right" class="lr" alt="right" src="${ctx_path}/img/right.png">
		</div>
		
		<!-- Main Category -->
		<div id="main_category">
			<div id="controll_cl" class="slide box">
				<div id="hand_cover">
					<div id="hour_hand"></div>
				</div>
				<div id="front_frame">
					<div id="frames"></div>
					<div id="images"></div>
					
					<div id="frames2"></div>
					<div id="images2"></div>
					
					<div id="frames3"></div>
					<div id="images3"></div>
					
					<div id="frames4"></div>
					<div id="images4"></div>
				</div>
			</div>
		</div>
		
		<!-- Main Map -->
		<div id="map_container">
			<div id="main_map" class="slide box">
				<img id="map_image" alt="" src="${ctx_path}/img/map_image.jpg">
			</div>
		</div>
	</div>
<div></div>
</body>
</html>
