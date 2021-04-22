<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Forget password</title>
	<script>
		
		function validate()
		{
			var email = document.myform.txt_email;
			var email_valid= /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/;
		    var email = document.getElementById("email"); 
			
				
			if (email.value == null || email.value == "") //check email textbox not blank
			{
				window.alert("please enter email ?"); //alert message
				email.style.background = '#f08080';
				email.focus();
				return false;
			}
			if(!email_valid.test(email.value) || email.value=='') 
            {
				alert("Enter Valid Email....!");
                email.focus();
                email.style.background = '#f08080';
                return false;                    
            }
			
		}
			
	</script>
	
</head>
<body>
<style>
.form-row{
text-align: center;
        display: block;
        width: 441px;
        padding: 9px;
        
        margin: 11px auto;
      
        font-size: 17px;

}
.form-row input{
   text-align: center;
        display: block;
        width: 441px;
        padding: 9px;
        border: 2px solid black;
        margin: 11px auto;
        border-radius: 8px;
        font-size: 17px;


}
#btn{
margin: 7px 627px;
    color: white;
    background-color: rgba(0, 0, 0, 0.425);
    padding: 11px 17px;
    font-size: 20px;
    cursor: pointer;
}
</style>
<div>

<form method="post" name="myform" onsubmit="return validate();">
<div class="form-row">
                        <label>
                            <span>Enter email</span>
                             <input type="text" name="txt_email" id="email" placeholder="Enter email">
                        </label>
                    </div>
                    <input id="btn" type="submit" name="btn_login" value="submit">
</div>

<%

try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","root");
Statement st=con.createStatement();
String email = request.getParameter("txt_email");

String sql= "SELECT * from login1 where email='" +email+ "' " ; 

ResultSet rs = st.executeQuery(sql); 
rs.next();
if(email.equals(request.getParameter("txt_email")))
{
	out.println("<h1>your email is</h1>"  +email);
	out.println("<h1>your password is</h1>" +rs.getString("password")  );
}

else{
out.println("Invalid Email Id !");
}
con.close();
}
catch (Exception e){
	
	out.println(e);
e.printStackTrace();
}
%>
</body>
</html>