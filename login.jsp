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
    String name,password;

    name=request.getParameter("FloginID");
    password=request.getParameter("FloginPass");
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","AP","chandukittu");
    PreparedStatement ps=con.prepareStatement("select ID, password from faculty_register_table where id=? and password=?");
    ps.setString(1,name);
    ps.setString(2,password);
    ResultSet rs=ps.executeQuery();
    if(rs.next())
    {
        if(name.equals(rs.getString(1)) && password.equals(rs.getString(2)))
        {
            response.sendRedirect("home.html");	 
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