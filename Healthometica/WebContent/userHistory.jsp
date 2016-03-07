<%@ page import = "java.sql.*" %>
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


.logo {
    width: 213px;
    height: 36px;
    background: url('http://i.imgur.com/fd8Lcso.png') no-repeat;
    margin: 30px auto;
}

.register-block {
    width: 320px;
    padding: 20px;
    background: #fff;
    border-radius: 5px;
    border-top: 5px solid DarkTurquoise;
    margin: 0 auto;
}

.register-block h1 {
    text-align: center;
    color: #000;
    font-size: 18px;
    text-transform: uppercase;
    margin-top: 0;
    margin-bottom: 20px;
}

.register-block input {
    width: 100%;
    height: 42px;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-bottom: 20px;
    font-size: 14px;
    font-family: Montserrat;
    padding: 0 20px 0 50px;
    outline: none;
}

.register-block label {
    display: inline-block;
    cursor: pointer;
	background-size: 16px 80px;
    position: relative;
    padding: 0 5px 0 10px;
    margin-right: 15px;
    font-family: Montserrat;
	font-size: 14px;
}

input[type=radio] {
    display: inline-block;
	height: 16px;
	width: 16px;
}




.register-block input#username {
    background: #fff url('http://i.imgur.com/u0XmBmv.png') 20px top no-repeat;
    background-size: 16px 80px;
}

.register-block input#username:focus {
    background: #fff url('http://i.imgur.com/u0XmBmv.png') 20px bottom no-repeat;
    background-size: 16px 80px;
}


.register-block input#password {
    background: #fff url('http://i.imgur.com/Qf83FTt.png') 20px top no-repeat;
    background-size: 16px 80px;
}

.register-block input#password:focus {
    background: #fff url('http://i.imgur.com/Qf83FTt.png') 20px bottom no-repeat;
    background-size: 16px 80px;
}

.register-block input:active, .login-block input:focus {
    border: 1px solid DarkTurquoise;
}

.register-block input#submit {
    width: 100%;
    height: 40px;
    background: DarkTurquoise;
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
}

.register-block input#submit:hover {
    background: #00e1e6;
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
          <li><a href="Home.jsp?email=<%= email%>">Home</a></li>
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
        
        
      </div>
      <div id="content">
        <!-- insert the page content here -->
        <h1>Healthometica</h1>
<div class="logo"></div>
<div class="register-block">
    <h1>Update Records</h1>
	<%

//session.setAttribute("email", email);
System.out.println(email);
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hci",
        "root", "1234");
Statement st = con.createStatement();
ResultSet rs;
ResultSet rs1;
String allergy="";
String medic = "";
String disease = "";
rs=st.executeQuery("select * from users where email='"+email+"'");

%>
		<form method="post" action="updated.jsp">
<% if (rs.next()){ %>
  Age: <input type="text" value="<%= rs.getString("age")%>" placeholder="<%= rs.getString("age")%>" id="username" name="age" />
   Gender: <input type="text" value="<%= rs.getString("gender")%>" placeholder="<%= rs.getString("gender")%>" id="username" name="gender" />
   E-Mail: <input type="text" value="<%= rs.getString("email")%>" placeholder="<%= rs.getString("email")%>" id="username" name="email" />
    Password: <input type="password" value="<%= rs.getString("password")%>" placeholder="<%= rs.getString("password")%>" id="password" name="pwd"/>
<% } %>
<%
rs1 = st.executeQuery("select * from user_history where email='"+email+"'");
if(rs1.next()){
	allergy=rs1.getString("allergy");
	medic=rs1.getString("on_medication");
	disease=rs1.getString("on_disease");
}
%>	
	Any allergy: <input type="text" value="<%= allergy%>" placeholder="<%= allergy%>" id="username" name="allergy"/>
	Ongoing Health issue: <input type="text" value="<%= disease%>" placeholder="<%= disease%>" id="username" name="ondisease"/>
	Ongoing Medication: <input type="text" value="<%= medic%>" placeholder="<%= medic%>" id="username" name="onmedication"/>
    <input type="submit" name="submit" value="submit" id="submit">
	</form>
	</div>
      </div>
    </div>
    <div id="footer">
    	<p><a href="logout.jsp">Log Out</a></p>
     <p>Copyright &copy; Anurag Garg| Jvalin Dave | Mohammed Saifullah </p>
    </div>

  </div>
</body>
</html>
