<%@ page import ="java.sql.*" %>
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
  <style>


#content form {
	margin: 40px 0;
}

#content div {
	clear: initial;
	margin: 0 150px;
}

#content label {
  width: 150%;
  border-radius: 3px;
  border: 1px solid #D1D3D4
}

/* hide input */
#content input.radio:empty {
	margin-left: -999px;
}

/* style label */
#content input.radio:empty ~ label {
	position: relative;
	float: left;
	line-height: 2.5em;
	text-indent: 3.25em;
	margin-top: 2em;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

#content input.radio:empty ~ label:before {
	position: absolute;
	display: block;
	top: 0;
	bottom: 0;
	left: 0;
	content: '';
	width: 2.5em;
	background: #D1D3D4;
	border-radius: 3px 0 0 3px;
}

/* toggle hover */
#content input.radio:hover:not(:checked) ~ label:before {
	content:'\2714';
	text-indent: .9em;
	color: #C2C2C2;
}

#content input.radio:hover:not(:checked) ~ label {
	color: #888;
}

/* toggle on */
#content input.radio:checked ~ label:before {
	content:'\2714';
	text-indent: .9em;
	color: #9CE2AE;
	background-color: #4DCB6D;
}

#content input.radio:checked ~ label {
	color: #777;
}

#content input#submit {
    width: 90%;
    height: 40px;
    background: #4DCB6D;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #009699;
    color: #fff;
    font-weight: bold;
    text-transform: uppercase;
    font-size: 14px;
    font-family: Montserrat;
    outline: none;
    cursor: pointer;
	padding: 0 20px 0 50px;
	margin-top: 20px;
}

#content input#submit:hover {
    background: #61d17e;
}

</style>
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
          <li class="current"><a href="symptomChecker.jsp">Symptom Checker</a></li>
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
        <h3>Latest News</h3>
        <h4>What's the News?</h4>
        <h5>1st July 2011</h5>
        <p>Put your latest news item here, or anything else you would like in the sidebar!<br /><a href="#">Read more</a></p>
        </div>
        <img class="paperclip" src="style/paperclip.png" alt="paperclip" />
        <div class="sidebar">
          <h3>Newsletter</h3>
          <p>If you would like to receive our newletter, please enter your email address and click 'Subscribe'.</p>
          <form method="post" action="#" id="subscribe">
            <p style="padding: 0 0 9px 0;"><input class="search" type="text" name="email_address" value="your email address" onclick="javascript: document.forms['subscribe'].email_address.value=''" /></p>
            <p><input class="subscribe" name="subscribe" type="submit" value="Subscribe" /></p>
          </form>
        </div>
      </div>
      <div id="content">
        <!-- insert the page content here -->
        <h1>Healthometica</h1>
<%

//session.setAttribute("email", email);
String dname = request.getParameter("disease");
int i=0;
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hci",
        "root", "1234");
Statement st = con.createStatement();
ResultSet rs;
rs = st.executeQuery("select * from disease where diseaseName='"+dname+"'");
%>
      <form method="post" action="precautions">
	  <input type="hidden" name="dname" value="<%= dname%>">
<input type="hidden" name="email" value="<%= email%>">
	Please select the appropriate details: 
	<% 
while (rs.next()){
%>
<div>

<input type = "checkbox" name = "symptom" id="<%= i%>" class="radio" value="<%= rs.getString("symptom_keyword")%>">
<label for="<%= i++%>"> <%= rs.getString("relatedSymptom") %></label>
</div>
	<% 
	System.out.println(i);
		System.out.println(rs.getString("symptom_keyword"));
}
%>

<div>
<input type="submit" value="submit" id="submit" name="submit"> 
</div>
</form>
	
      </div>
    </div>
    <div id="footer">
    	<p><a href="logout.jsp">Log Out</a></p>
      <p>Copyright &copy; Anurag Garg| Jvalin Dave | Mohammed Saifullah </p>
    </div>

  </div>
</body>
</html>

