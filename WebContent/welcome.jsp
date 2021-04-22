<!DOCTYPE html>
<html>

<head>

	

	<title>Welcome : <%=session.getAttribute("login")%></title>

	

</head>

<body>

    

    <div class="main-content">
	
	<center>
	
	<%
	if(session.getAttribute("login")==null || session.getAttribute("login")==" ") //check condition unauthorize user not direct access welcome.jsp page
	{
		response.sendRedirect("index.jsp"); 
	}
	%>
	
	<h1> Welcome, <%=session.getAttribute("login")%> </h1>

	<h2><a href="logout.jsp">Logout</a></h2>
    
	</center>
	

   <style>
   #registerheading{
   text-align: center;
   
   }
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
        #btn-register{
            margin: 7px 627px;
    color: white;
    background-color: rgba(0, 0, 0, 0.425);
    padding: 11px 17px;
    font-size: 20px;
    cursor: pointer;
        }
    </style>
    <div class="container">

        <form  method="post" onsubmit="return validate();" >

            <div >

                <div>

                    <div >
                        <h1 id="registerheading">Product-information</h1>
                    </div>
                    <p style="color:green">				   		
					<%
					if(request.getAttribute("successMsg")!=null)
					{
						out.println(request.getAttribute("successMsg")); //register success message
					}
					%>
				   
					
				   
                    <div class="form-row">
                        <label>
                            <span>Product Name:</span>
                            <input type="text" name="prname" id="Pname" placeholder="Enter Productname">
                        </label>
                    </div>
					<div class="form-row">
                        <label>
                            <span>Product Price:</span>
                            <input type="number" name="prprice" id="Prprice" placeholder="Enter Product Price">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Product Date:</span>
                            <input type="date" name="prdate" id="prdate" placeholder="Enter product date">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Product type:</span>
                            <input type="name" name="prtype" id="prtype" placeholder="Enter product type">
                        </label>
                    </div>
                    <div class="form-row">
                        <label>
                            <span>Date of buy:</span>
                            <input type="date" name="dty" id="prdtby" placeholder="Enter Date of bought">
                        </label>
                    </div>

					<input id="btn-register" type="submit" name="btn_register" value="Register">
					
                </div>
				
                

            </div>

        </form>

    </div>

</body>

</html>
