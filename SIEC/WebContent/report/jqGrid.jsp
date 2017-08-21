<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" type="text/css" href="../CSS/main.css">
<link rel = "stylesheet" type = "text/css" media = "screen" href = "../CSS/jquery-ui.min.css"/>
<link rel = "stylesheet" type = "text/css" media = "screen" href = "../CSS/ui.jqgrid.css"/>
</head>

<body>

		<!-- Content -->
		<section >
				<table id="list4"></table>
		</section>

<script src = "../JS/jquery-1.11.0.min.js"></script>
<script src = "../JS/i18n/grid.locale-kr.js"></script>
<script src = "../JS/jquery.jqGrid.min.js"></script>
<script>
$(function() {
	$("#list4").jqGrid({
		url:'jsonType2.jsp',
		loadtext: '로딩중....',
		datatype: "json",
		height: 250,
		colNames: ['1월', '2월', '3월'],
		colModel: [
					{ name: 'goal' },
   					{ name: 'performance'},
    				{ name: 'rate' }  
				  ]

});
});

    </script>
</body>
</html>