<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login successful</title>
</head>
<body>
<%
try
    {
    String id,password;

    id=request.getParameter("FloginID");
    password=request.getParameter("FloginPass");
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","AP","chandukittu");
    PreparedStatement ps=con.prepareStatement("select ID, password from faculty_register_table where id=? and password=?");
    PreparedStatement ps1=con.prepareStatement("select name, department from faculty_register_table where id=?");
    ps.setString(1,id);
    ps.setString(2,password);
    ResultSet rs=ps.executeQuery();
    ps1.setString(1, id);
    ResultSet rs1 = ps1.executeQuery();
    if(rs1.next()) {
    	String nameDisplay = rs1.getString("name");
		session.setAttribute("nameDisplay", nameDisplay); 
		String department = rs1.getString("department");
		session.setAttribute("department", department);
    }
    if(rs.next())
    {
        if(id.equals(rs.getString(1)) && password.equals(rs.getString(2)))
        {
            response.sendRedirect("home.jsp");	 
        }
        
    }
    else
    {
        out.println("<script>alert('Invalid Login details')</script>");
    }
	con.close();
    ps.close();
    rs.close();
	
    }
catch(Exception ex)
{
    out.println("<script>alert('error "+ex.getMessage()+"')</script>");
}

%>


</body>
</html>