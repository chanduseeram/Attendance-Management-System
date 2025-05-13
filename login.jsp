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

    name=request.getParameter("uid");
    password=request.getParameter("pwd");
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","AP","chandukittu");
    PreparedStatement ps=con.prepareStatement("select ID, password from faculty_register_table where id=? and password=?");
    ps.setString(1,name);
    ps.setString(2,password);
    ResultSet rs=ps.executeQuery();

    PreparedStatement printname = con.prepareStatement("SELECT name FROM faculty_register_table WHERE id=?");
    printname.setString(1, name);
    ResultSet rsName = printname.executeQuery();


    if(rs.next())
    {
        if(name.equals(rs.getString(1)) && password.equals(rs.getString(2)))
        {
            String facultyName = "";
            if (rsName.next()) 
            {
                facultyName = rsName.getString("name");
            }
            session.setAttribute("facultyName", facultyName);
            response.sendRedirect("home.html");	 
        }
        
    }
    else
    {
        out.println("<script>alert('Invalid Login details')</script>");
    }
	con.close();
	
    }
catch(Exception ex)
{
    out.println("<script>alert('error "+ex.getMessage()+"')</script>");
}

%>


</body>
</html>