<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" 	uri="http://tiles.apache.org/tags-tiles" %>
<%@ include file="../inc/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dream Shop</title>
</head>
<body>
	<div id="main_wrapper">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="content">
			<tiles:insertAttribute name="content" />
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
	<tiles:insertAttribute name="script" />
</body>
</html>