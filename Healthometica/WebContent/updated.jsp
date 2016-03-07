<%@ page import="java.sql.*" %>
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
Object email1 = session.getAttribute("email");
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
          <li><a href="Home.jsp?email=<%= email1 %>">Home</a></li>
          <li><a href="symptomChecker.jsp">Symptom Checker</a></li>
          <li class="current"><a href="userHistory.jsp">Update Records</a></li>
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
        <h3>Tip of the Day</h3>
        <h5>25th Nov 2015</h5>
        <p>Early to bed and early to rise makes a man healthy, wealthy and wise..<br /><a href="http://www.webmd.com/sleep-disorders/features/9-reasons-to-sleep-more">Read more</a></p>
        </div>
        <img class="paperclip" src="style/paperclip.png" alt="paperclip" />
        <div class="sidebar">
          <h3>Amazing facts about your Body</h3>
          <p>It takes an interaction of 72 different muscles to produce human speech..<br /><a href="http://www.factslides.com/s-Your-Body">Read more</a></p>
          
        </div>
        <img class="paperclip" src="style/paperclip.png" alt="paperclip" />
        <div class="sidebar">
          <h3>Latest Blog</h3>
          <h4>Website Goes Live</h4>
          <h5>1st July 2011</h5>
          <p>We have just launched our new website. Take a look around, we'd love to know what you think.....<br /><a href="#">read more</a></p>
        </div>
      </div>
      <div id="content">
        <!-- insert the page content here -->
        <h1>Healthometica</h1>
<%

//session.setAttribute("email", email1);
String age = request.getParameter("age");
String gender = request.getParameter("gender");
String email = request.getParameter("email");
String password = request.getParameter("pwd");
String allergy = request.getParameter("allergy");
String ondisease = request.getParameter("ondisease");
String medication = request.getParameter("onmedication");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hci",
        "root", "1234");
Statement st = con.createStatement();
st.executeUpdate("update users set age="+age+", gender='"+gender+"', email='"+email+"', password='"+password+"' where email='"+email1+"'");
st.executeUpdate("update user_history set email='"+email+"', allergy='"+allergy+"', on_disease='"+ondisease+"', on_medication='"+medication+"' where email='"+email1+"'");
%>
<h2 style="color: Green"> Values have been updated. </h2>
<h3>Go back to <a href="Home.jsp?email=<%= email1 %>">Home</a></h3>
      </div>
    </div>
    <div id="footer">
    	<p><a href="logout.jsp">Log Out</a></p>
      <p>Copyright &copy; Anurag Garg| Jvalin Dave | Mohammed Saifullah </p>
    </div>

  </div>
</body>
</html>
