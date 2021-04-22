<%@ page import="java.sql.*" %>  

<%
if(session.getAttribute("login")!=null) //check login session user not access or back to register.jsp page
{
	response.sendRedirect("welcome.jsp");
}
%>


<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","root"); //create connection
	
	if(request.getParameter("btn_register")!=null) //check register button click event not null
	{
		String firstname,lastname,email,password;
		
		firstname=request.getParameter("txt_firstname"); //txt_firstname
		lastname=request.getParameter("txt_lastname"); //txt_lastname
		email=request.getParameter("txt_email"); //txt_email
		password=request.getParameter("txt_password"); //txt_password
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("insert into login1(firstname,lastname,email,password) values(?,?,?,?)"); //sql insert query
		pstmt.setString(1,firstname);
		pstmt.setString(2,lastname);
		pstmt.setString(3,email);
		pstmt.setString(4,password);
		
		pstmt.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","Register Successfully...! Please login"); //register success messeage

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
			var first_name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			var last_name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			var email_valid= /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/; //pattern valid email validation
			var password_valid=/^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/; //pattern password allowed A to Z, a to z, 0-9, !@#$%&*()<> charecter 
			
			var fname = document.getElementById("fname"); //textbox id fname
            var lname = document.getElementById("lname"); //textbox id lname
            var email = document.getElementById("email"); //textbox id email
            var password = document.getElementById("password"); //textbox id password
			
			if(!first_name.test(fname.value) || fname.value=='') 
            {
				alert("Enter Firstname Alphabet Only....!");
                fname.focus();
                fname.style.background = '#f08080';
                return false;                    
            }
			if(!last_name.test(lname.value) || lname.value=='') 
            {
				alert("Enter Lastname Alphabet Only....!");
                lname.focus();
                lname.style.background = '#f08080';
                return false;                    
            }
			if(!email_valid.test(email.value) || email.value=='') 
            {
				alert("Enter Valid Email....!");
                email.focus();
                email.style.background = '#f08080';
                return false;                    
            }
			if(!password_valid.test(password.value) || password.value=='') 
            {
				alert("Password Must Be 6 to 12 and allowed !@#$%&*()<> character");
                password.focus();
                password.style.background = '#f08080';
                return false;                    
            }
		}
		
	</script>	

</head>



<body>
<style>

body{
      background-color: pink;
}
.form-row{
text-align: center;
        display: block;
        width: 441px;
        padding: 9px;
        
        margin: 11px auto;
      
        font-size: 17px;


}
#registerheading{
text-align: center;
color: blue;
}
.form-row input{
text-align: center;
        display: block;
        width: 441px;
        padding: 9px;
        
        margin: 11px auto;
      
        font-size: 17px;

}

#btn-register{
     margin: 7px 627px;
    color: white;
    background-color: rgba(0, 0, 0, 0.425);
    padding: 11px 17px;
    font-size: 20px;
    cursor: pointer;
    }
    
    .form-log-in-with-existing{
       text-align: center;
       margin: 193px 529px;
    
    }
</style>

   

    <div >

        <form  method="post" onsubmit="return validate();">

            <div >

                <div>

                    <div >
                        <h1 id="registerheading">Register</h1>
                    </div>
				   
					<p style="color:green">				   		
					<%
					if(request.getAttribute("successMsg")!=null)
					{
						out.println(request.getAttribute("successMsg")); //register success message
					}
					%>
					</p>
				   
				   </br>
				   
                    <div class="form-row">
                        <label>
                            <span>First name</span>
                            <input type="text" name="txt_firstname" id="fname" placeholder="Enter firstname">
                        </label>
                    </div>
					<div class="form-row">
                        <label>
                            <span>Last name</span>
                            <input type="text" name="txt_lastname" id="lname" placeholder="Enter lastname">
                        </label>
                    </div>

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

					<input id="btn-register" type="submit" name="btn_register" value="Register">
					
                </div>
				
                <a href="index.jsp" class="form-log-in-with-existing">Already have an account? <b> Login here </b></a>

            </div>

        </form>

    </div>

</body>

</html>
