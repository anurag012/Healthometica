<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Hashtable" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
  <title>Healthometica</title>
  <meta name="description" content="website description" />
  <meta name="keywords" content="website keywords, website keywords" />
  <meta http-equiv="content-type" content="text/html; charset=windows-1252" />
  <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Tangerine&amp;v1" />
  <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Yanone+Kaffeesatz" />
  <link rel="stylesheet" type="text/css" href="style/style.css" />
</head>

<body>
<%
Object email = session.getAttribute("email");
%>
  <div id="main">
	        <div id="header">
      <div id="logo">
        <h1>Healthometica</h1>
        <div class="slogan">Health for Life !!</div>
      </div>
      <div id="menubar">
        <ul id="menu">
          <!-- put class="current" in the li tag for the selected page - to highlight which page you're on -->
          <li><a href="Home.jsp?email=<%= email %>">Home</a></li>
          <li><a href="symptomChecker.jsp">Symptom Checker</a></li>
          <li><a href="userHistory.jsp">Update Records</a></li>
          <li class="current"><a href="precautions.jsp">View Precautions</a></li>
          <li><a href="report.jsp">View Report</a></li>
        </ul>
      </div>
    </div>
    <div id="site_content">
      <div id="sidebar_container">
        <img class="paperclip" src="style/paperclip.png" alt="paperclip" />
        <div class="sidebar">
        <!-- insert your sidebar items here -->
         <h3>Tip of the Day</h3>
        <h5>25th Nov 2015</h5>
        <p>Health is not valued till sickness comes..<br /><a href="http://www.trihealth.com/dailyhealthwire/wellness-and-fitness/Top-3-Ways-to-Maintain-Good-Health.aspx">Read more</a></p>
        </div>
        <img class="paperclip" src="style/paperclip.png" alt="paperclip" />
        <div class="sidebar">
          <h3>Amazing facts about your face</h3>
          <p>Laughter is a great way to reduce obesity risk..<br /><a href="http://theberry.com/2013/05/05/random-facts-for-your-face-24-photos/">Read more</a></p>
          
        </div>
       
      </div>
      <div id="content">
        <!-- insert the page content here -->
        <h1>Healthometica</h1>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hci",
        "root", "1234");

Statement st2 = con.createStatement();
ResultSet rs2;
rs2=st2.executeQuery("select symptom, group_concat(precautions) as prec, symptom_date from symptom_extraction where emailid ='"+email+"' group by symptom,symptom_date;");
%>
<center>
<table style="width: 100% ; border-spacing:0;">
<tr><th colspan=3>Precautions</th></tr>
<% 
while(rs2.next()){ 
	String[] ext = rs2.getString(2).split(",");
%>
<tr><td rowspan=<%= ext.length %> align="center"><b><%= rs2.getString("symptom") %></b></td><td rowspan=<%= ext.length %> align="center"><b><%= rs2.getString("symptom_date")%></b></td>
<% String[] word = rs2.getString("prec").split(",");
for(int i=0;i<word.length;i++){
	System.out.println(word[i]);
%>
	<td><%= word[i] %></td></tr>
<% 
}
} 
%>

</table>
</center>

<h3>Go back to <a href="Home.jsp?email=<%= email %>">Home</a></h3>
      </div>
    </div>
    <div id="footer">
    	<p><a href="logout.jsp">Log Out</a></p>
      <p>Copyright &copy; Anurag Garg| Jvalin Dave | Mohammed Saifullah </p>
    </div>

  </div>
</body>
</html>
