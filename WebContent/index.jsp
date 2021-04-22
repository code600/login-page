<%@ page import="java.sql.*" %>  

<%
if(session.getAttribute("login")!=null) //check login session user not access or back to index.jsp page
{
	response.sendRedirect("welcome.jsp");
}
%>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","root"); //create connection
	
	if(request.getParameter("btn_login")!=null) //check login button click event not null
	{
		String dbemail,dbpassword;
		
		String email,password;
		
		email=request.getParameter("txt_email"); //txt_email
		password=request.getParameter("txt_password"); //txt_password
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("select * from login1 where email=? AND password=?"); //sql select query 
		pstmt.setString(1,email);
		pstmt.setString(2,password);
		
		ResultSet rs=pstmt.executeQuery(); //execute query and store in resultset object rs.
		
		if(rs.next())
		{
			dbemail=rs.getString("email");
			dbpassword=rs.getString("password");
			
			if(email.equals(dbemail) && password.equals(dbpassword))
			{
				session.setAttribute("login",dbemail); //session name is login and store fetchable database email address
				response.sendRedirect("welcome.jsp"); //after login success redirect to welcome.jsp page
			}
		}
		else
		{
			request.setAttribute("errorMsg","invalid email or password"); //invalid error message for email or password wrong
		}
		
		con.close(); //close connection	
	}
	
}
catch(Exception e)
{
	out.println(e);
}
%>

<!DOCTYPE html>
<html>

<head>

	<script>
		
		function validate()
		{
			var email = document.myform.txt_email;
			var password = document.myform.txt_password;
				
			if (email.value == null || email.value == "") //check email textbox not blank
			{
				window.alert("please enter email ?"); //alert message
				email.style.background = '#f08080';
				email.focus();
				return false;
			}
			if (password.value == null || password.value == "") //check password textbox not blank
			{
				window.alert("please enter password ?"); //alert message
				password.style.background = '#f08080'; 
				password.focus();
				return false;
			}
		}
			
	</script>
	
</head>

<body>




<style>
body{
      background-color: green;
}

.form-row  {

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

#heading{
text-align: center;

}
#btn{
        margin: 7px 627px;
        color: white;
        background-color: rgba(0, 0, 0, 0.425);
        padding: 11px 17px;
        font-size: 20px;
        cursor: pointer;
    }
    #form-log-in-with-existing{
    
        text-align: center;
        margin: 193px 529px;

    }
    
    #forget_password{
           text-align: center;
           margin: 195px 609px;
    
    }
}

</style>

   

    <div>

        <form method="post" name="myform" onsubmit="return validate();">

            <div>

                <div>

                    <div >
                        <h1 id="heading">Login</h1>
                    </div>
					
					<p style="color:red">				   		
					<%
					if(request.getAttribute("errorMsg")!=null)
					{
						out.println(request.getAttribute("errorMsg")); //error message for email or password 
					}
					%>
					</p>
				   
				   </br>

                    <div class="form-row">
                        <label>
                            <span>Email</span>
                            <input type="text" name="txt_email" id="email" placeholder="Enter email">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Password</span>
                            <input type="password" name="txt_password" id="password" placeholder="Enter password">
                        </label>
                    </div>
                    
                    
                    <a href="forget.jsp"  id="forget_password">Forgot password</a>
					<input id="btn" type="submit" name="btn_login" value="Login">
                    
                </div>

				<a href="register.jsp" id="form-log-in-with-existing">You Don't have an account? <b> Register here </b></a>
				

            </div>

        </form>

    </div>

</body>

</html>
