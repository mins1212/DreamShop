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
	
	/* Slide image */
	#main_slide {
		width: 100%;
	}
</style>
<script src="//code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    var htm1 = "<iframe width='854' height='480' src='https://www.youtube.com/embed/8vHPa1hADm8' frameborder='0' allow='autoplay; encrypted-media' allowfullscreen></iframe>";
    var htm2 = "<img id='slide2' alt='slide2' src=''>";
    var htm3 = "<img id='slide3' alt='slide3' src=''>";
    $("#main_slide").append(htm);
    $("#slide1").height($(window).height());
    $("#slide1").width($(window).width());
    //$("#slide1").css("z-index", "1");
}); 
</script>
</head>
<body>
	<div id="content_wrapper">
		<!-- Main Slide -->
		<div id="main_slide">
			
		</div>
		
		<!-- Main Category -->
		<div id="main_category">
			
		</div>
		
		<!-- Main Map -->
		<div id="main_map">
			
		</div>
	</div>
<div></div>
</body>
</html>
