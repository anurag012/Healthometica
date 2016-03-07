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
Object email=session.getAttribute("email");
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
          <li><a href="precautions.jsp">View Precautions</a></li>
          <li class="current"><a href="report.jsp">View Report</a></li>
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
        <p>Good Health and good sense are two of the life's greatest blessings<br /><a href="http://www.mindbodygreen.com/0-21099/7-natural-ways-to-boost-your-brain-power-sharpen-your-mind.html">Read more</a></p>
        </div>
        <img class="paperclip" src="style/paperclip.png" alt="paperclip" />
        <div class="sidebar">
         <h3>Amazing facts about Cleanliness</h3>
          <p>The term "Hygiene" comes from "Hygieia",the greek goddess of health,cleanliness and moon..<br /><a href="http://www.chatelaine.com/living/10-facts-on-dirt-and-cleanliness/">Read more</a></p>
          
        </div>
       
      </div>
      <div id="content">
        <!-- insert the page content here -->
        <h1>Healthometica</h1>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hci",
        "root", "1234");
Statement st = con.createStatement();
ResultSet rs;
rs=st.executeQuery("select u.name, u.age,u.gender,u.email, h.allergy, h.on_disease, h.on_medication from users u inner join user_history h on u.email=h.email where u.email='"+email+"'"); %>
<table style="width: 100% ; border-spacing:0;">
<% while(rs.next()){ %>
<tr><td>Name </td><td><%=rs.getString(1) %></td></tr>
<tr><td>Age </td><td><%=rs.getString(2) %></td></tr>
<tr><td>Gender </td><td><%=rs.getString(3) %></td></tr>
<tr><td>Email </td><td><%=rs.getString(4) %></td></tr>
<tr><td>Allergy </td><td><%=rs.getString(5) %></td></tr>
<tr><td>On going Health Issue </td><td><%=rs.getString(6) %></td></tr>
<tr><td>On going Medication  </td><td><%=rs.getString(7) %></td></tr>	
<%
} %>
</table>


<%
rs=st.executeQuery("select symptom, group_concat(extracted_symptom) as prec, symptom_date from symptom_extraction where emailid ='"+email+"' group by symptom,symptom_date;");
 %>
 <center>
<table style="width: 100% ; border-spacing:0;">
<tr><th colspan=3>Health History</th></tr>
<% 
while(rs.next()){ 
	String[] ext = rs.getString(2).split(",");
%>
<tr><td rowspan=<%= ext.length %> align="center"><b><%= rs.getString("symptom") %></b></td><td rowspan=<%= ext.length %> align="center"><b><%= rs.getString("symptom_date")%></b></td>
<% String[] word = rs.getString("prec").split(",");
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
