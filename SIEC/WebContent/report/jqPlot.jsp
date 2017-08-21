<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.siec.chart.ChartVO" %>
<%@ page import="com.siec.chart.ChartDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link class="include" rel="stylesheet" type="text/css" href="../jqPlot/jquery.jqplot.min.css" />
</head>

<body>
	
<%
	ChartDAO dao = new ChartDAO();
	ChartVO vo = null;
	ArrayList<ChartVO> arrayListData = dao.selectAllData2();
    String goal = "", performance = "", rate = "";
    
 for(int i = 0; i < arrayListData.size(); i++) // ArrayList 값 확인
	{

		vo = (ChartVO) arrayListData.get(i);
		goal += vo.getGoal();
		if ( i != arrayListData.size() -1)
		{
			goal += ",";
		}
		performance += vo.getPerformance();
		if ( i != arrayListData.size() -1)
		{
			performance += ",";
		}
		rate += vo.getRate();
		if ( i != arrayListData.size() -1)
		{
			rate += ",";
		}
	}
 
%>
	
	<div id="graph" style="width:700px; height:300px;">
	</div>
	

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="../jqPlot/jquery.jqplot.min.js"></script>
<script src="../jqPlot/plugins/jqplot.categoryAxisRenderer.js"></script>
<script src="../jqPlot/plugins/jqplot.barRenderer.js"></script>
<script src="../jqPlot/plugins/jqplot.pointLabels.js"></script>	
<script>
$(function(){
    //1번째 입력값 (그려진 영역의 id값)
    //2번째 입력값 (그래프내에 들어갈 데이터 값)
      var goal = [<%=goal%>];
      var performance = [<%=performance%>];
      var rate = [<%=rate%>]
      var ticks = ['1월', '2월', '3월', '4월', '5월', '6월'];
     jQuery("#graph").jqplot([goal,performance, rate], {
		 animate : true, // 애니메이션 효과
    	 
    	 axes:
    	 {
    		xaxis:
    		{
    			renderer:jQuery.jqplot.CategoryAxisRenderer, // 카테고리 구분선
    			ticks : ticks // ticks : 눈금 지정
    		},
    		y2axis :
    		{
    			tickOptions:
    			{
    				formatString : "%'d%"
    			},
    			rendererOptions:
    			{
    				forceTickAt0: false
    			},
    			min : 0,
    			numberTicks :4
    		},	
    		yaxis :
    		{
    			tickOption :
    			{
    				formation : "%d"
    			},	
    			rendererOption:
    			{
    				alignTicks: true,
    				forceTickAt0: true
    			},
    			min : 0
    			
    		}	
    	 },
    	 
    	 series :
         [
        	 {
        	 	yaxis : 'yaxis',
        	 	
        	 },
        	 {
        		 yaxis : 'yaxis'
        	 },
        	 {
        		 yaxis : 'y2axis',
   
                 pointLabels: { show:true },
                 showLine : false,
                 color : '#FF0000',
                 markerOptions:{style:'diamond'}
        	 	 
        	 },
        	
         ]	

	});
});

</script>
</body>
</html>