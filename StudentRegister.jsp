<%@ page import="java.sql.*" contentType="text/html" language="java" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Attendance Management System</title>
        <link rel="icon" href="collegelogo.png" type="image">
        <meta charset="ISO-8859-1">
    </head>
    <body>
<%
try {
    String Sname,Sid,Smail,Sphone,Sdepartment;
    Sname=request.getParameter("sname");
    Sid=request.getParameter("sid");
    Smail=request.getParameter("smail");
    Sphone=request.getParameter("sphone");
    Sdepartment=request.getParameter("sdepartment");

    Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","AP","chandukittu");
    PreparedStatement ps = con.prepareStatement("insert into Student_register values(?,?,?,?,?)");
    ps.setString(1,Sname);
    ps.setString(2,Sid);
    ps.setString(3,Smail);
    ps.setString(4,Sphone);
    ps.setString(5,Sdepartment);

    int n = ps.executeUpdate();
    if(n>=1){
        out.println("<script>alert('Registration successful..!'); window.location.href='admin.html';</script>");
    }
    else{
        out.println("<script>alert('registration failed')</script>");
    }
    con.close();
}
catch(Exception ex){
    out.println("<script>alert('Error at :"+ex.getMessage()+"')</script>");
}
%> 
    </body>
</html>