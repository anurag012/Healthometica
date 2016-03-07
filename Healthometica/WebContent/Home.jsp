<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*" %>
    <%@ page import="java.net.*" %>
<%@ page import="java.util.*" %>
    
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
Object email = request.getAttribute("email");
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
          <li class="current"><a href="Home.jsp?email=<%= email %>">Home</a></li>
          <li><a href="symptomChecker.jsp">Symptom Checker</a></li>
          <li><a href="userHistory.jsp">Update Records</a></li>
          <li><a href="precautions.jsp">View Precautions</a></li>
          <li><a href="report.jsp">View Report</a></li>
        </ul>
      </div>
    </div>
    <div id="site_content">
      <div id="sidebar_container">
        <img class="paperclip" src="style/paperclip.png" alt="paperclip" />
        <div class="sidebar">
        <!-- insert your sidebar items here -->
        <h3>Tip Of the Day</h3>
        <h5>25th Nov 2015</h5>
        <p>An Apple a day keeps the doctor away<br /><a href="http://www.besthealthmag.ca/best-eats/nutrition/15-health-benefits-of-eating-apples">Read more</a></p>
        </div>
        <img class="paperclip" src="style/paperclip.png" alt="paperclip" />
        <div class="sidebar">
          <h3>Amazing facts about your heart</h3>
          <p>Happiness and strong sense of emotional vitality helps lower your risk of heart diseases..<br /><a href="http://health.clevelandclinic.org/2015/07/21-amazing-facts-about-your-heart-infographic/">Read more</a></p>
          
        </div>
      </div>
      <div id="content">
        <!-- insert the page content here -->
        <h1>Healthometica</h1>
		<% 

session.setAttribute("email", email);
if(session.getAttribute("email")==null || session.getAttribute("email")==""){
	Object email1 = request.getParameter("email");
	session.setAttribute("email", email1);
}
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hci",
        "root", "1234");
Statement st = con.createStatement();
ResultSet rs;
rs=st.executeQuery("select * from users where email='"+ session.getAttribute("email")+"'");
while(rs.next()){
%>
<h3>Hello  <%= rs.getString("name") %> </h3>
<%
}
%>
	
      </div>
    </div>

    <div id="footer">
    <p><a href="logout.jsp">Log Out</a></p>
      <p>Copyright &copy; Anurag Garg| Jvalin Dave | Mohammed Saifullah </p>
    </div>

  </div>
</body>
</html>

