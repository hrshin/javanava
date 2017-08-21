<%@page import="com.siec.chart.ChartVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="com.siec.chart.ChartDAO" %>
<%@page import="com.siec.chart.ChartVO"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<% // arrayList 값을 JSON 형태로 변환

	ChartDAO dao = new ChartDAO();
	ChartVO vo = null;
	Gson gson = new Gson();
	ArrayList<ChartVO> arrayListData = dao.selectAllData2();
	String json  = gson.toJson(arrayListData);

PrintWriter pw = response.getWriter();
pw.print(json);
pw.flush();
pw.close();

%>