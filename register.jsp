<%@ page import="java.sql.*" language="java" contentType="text/html"
pageEncoding="ISO-8859-1"%>
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
                String name,id,phone,mail,password;

                name = request.getParameter("fnamenew");
                id = request.getParameter("fidnew");
                phone = request.getParameter("phonenew");
                mail = request.getParameter("mailnew");
                password = request.getParameter("pwdnew");

                Class.forName("oracle.jdbc.OracleDriver");
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","AP","chandukittu");
                PreparedStatement ps=con.prepareStatement("insert into faculty_register_table values(?,?,?,?,?)");
                ps.setString(1,id);
                ps.setString(2,name);
                ps.setString(3,password);
                ps.setString(4,mail);
                ps.setString(5,phone);

                int n = ps.executeUpdate();
                if(n>0){
                	response.sendRedirect("index.html");
                    out.println("<script>alert('Succesfully registered'); </script>");
                }
                else {
                    out.println("<script>alert('Failed to register')</script>");
                }
                con.close();
            }
            catch(Exception ex){
                out.println("<script>alert('Error "+ex.getMessage()+"')</script>");
            }
        %>
     </body>
</html>