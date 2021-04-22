<%@ page import="java.sql.*" %>  
<%
if(session.getAttribute("register")!=null) 
{
	response.sendRedirect("product-info.jsp");
}
%>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb","root","root"); //create connection
	
	if(request.getParameter("btn_register")!=null) //check register button click event not null
	{
		String productName,productPrice,productDate,productType,DateofBuy;
		
		productName=request.getParameter("prname "); 
		productPrice=request.getParameter("prprice "); 
		productDate=request.getParameter("prdate "); 
		productType=request.getParameter("prtype "); 
		DateofBuy=request.getParameter(" dty"); 
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("insert into productinfo(productName,productPrice,productDate,productType,DateofBuy ) values(?,?,?,?,?)"); //sql insert query
		pstmt.setString(1,productName);
		pstmt.setString(2,productPrice);
		pstmt.setString(3,productDate);
		pstmt.setString(4,productDate);
		pstmt.setString(5,DateofBuy);
		
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