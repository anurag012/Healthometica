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
  <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<meta charset="UTF-8">
<style>
#site_content{
width: 1000px;
}
#sidebar_container {
width: 400px;
}
.sidebar {
width: 350px;
}
#content {
width: 530px;
}
</style>
<style>

.login-block {
    width: 320px;
    padding: 20px;
    background: #fff;
    border-radius: 5px;
    border-top: 5px solid #ff656c;
    margin: 0 auto;
}

.login-block h1 {
    text-align: center;
    color: #000;
    font-size: 18px;
    text-transform: uppercase;
    margin-top: 0;
    margin-bottom: 20px;
}

.login-block input {
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

.login-block input#user {
    background: #fff url('http://i.imgur.com/u0XmBmv.png') 20px top no-repeat;
    background-size: 16px 80px;
}

.login-block input#user:focus {
    background: #fff url('http://i.imgur.com/u0XmBmv.png') 20px bottom no-repeat;
    background-size: 16px 80px;
}

.login-block input#pass {
    background: #fff url('http://i.imgur.com/Qf83FTt.png') 20px top no-repeat;
    background-size: 16px 80px;
}

.login-block input#pass:focus {
    background: #fff url('http://i.imgur.com/Qf83FTt.png') 20px bottom no-repeat;
    background-size: 16px 80px;
}

.login-block input:active, .login-block input:focus {
    border: 1px solid #ff656c;
}

.login-block input#sub {
    width: 100%;
    height: 40px;
    background: #ff656c;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #e15960;
    color: #fff;
    font-weight: bold;
    text-transform: uppercase;
    font-size: 14px;
    font-family: Montserrat;
    outline: none;
    cursor: pointer;
}

.login-block input#sub:hover {
    background: #ff7b81;
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

.register-block input:active, .register-block input:focus {
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
  <div id="main">
    <div id="header">
      <div id="logo">
        <h1>Healthometica</h1>
        <div class="slogan">Health for Life !!</div>
      </div>
      <div id="menubar">
      </div>
    </div>
    <div id="site_content">
      <div id="sidebar_container">
        <img class="paperclip" src="style/paperclip.png" alt="paperclip" />
        <div class="sidebar">
        <!-- insert your sidebar items here -->
        <h3>Login</h3>
        <div class="logo"></div>
<div class="login-block">
    <h1>Login</h1>
	<form action = "login" method = "post">
    <input type="text" name="uname" value="" placeholder="E-Mail" id="user" />
    <input type="password" name="email" value="" placeholder="Password" id="pass" />
    <input type="submit" name="submit" value="submit" id="sub">
	</form>
	</div>

        </div>
        <img class="paperclip" src="style/paperclip.png" alt="paperclip" />
        <div class="sidebar">
          <h3>Register Here</h3>
      <div class="logo"></div>
<div class="register-block">
    <h1>Registeration</h1>
	<form action = "registeration" method = "post">
   <input type="text" value="" placeholder="Username" id="username" name="username" />
   <input type="text" value="" placeholder="Age" id="username" name="age" />
<div class="radio">
    <input id="male" type="radio" name="gender" value="male">
    <label for="male">Male</label>
    <input id="female" type="radio" name="gender" value="female">
    <label for="female">Female</label>
</div>
   <input type="text" value="" placeholder="E-Mail" id="username" name="email" />
    <input type="password" value="" placeholder="Password" id="password" name="pwd"/>
    <input type="submit" name="submit" value="submit" id="submit">
	</form>
	</div>
        </div>
      </div>
      <div id="content">
        <!-- insert the page content here -->
        <h1 style="color:Blue">Healthometica</h1>
<h3>
People tend to forget to report symptoms, allergies or any on going medication that affect the physical health. So, a self assessment before meeting a
doctor would help the doctor understand patient's condition with more clarity.
</h3>

<h3>
Healthomeitca is an online health profile maintenance system. It organizes a person's health record in a systematic way and generates a report
which a person can carry while visiting a doctor. Also, it suggests some precautions to be taken for some minor symptoms such as cough, cold etc. 
</h3>

      </div>
    </div>
    <div id="footer">
      <p>Copyright &copy; Anurag Garg| Jvalin Dave | Mohammed Saifullah </p>
    </div>
  </div>
</body>
</html>
