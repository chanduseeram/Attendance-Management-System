<%@ page import="java.sql.*" language="java" contentType="text/html"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Management System</title>
</head>
<body>
    <%
        try {
            String id,pass;
            id=request.getParameter("AloginID");
            pass=request.getParameter("AloginPass");
            Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","AP","chandukittu");
            PreparedStatement ps = con.prepareStatement("select admin_id,password from admin_register where admin_id=? and password=?");
            ps.setString(1,id);
            ps.setString(2,pass);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                if(id.equals(rs.getString(1)) && pass.equals(rs.getString(2))){
                    response.sendRedirect("admin.html");
                }
            }
            else
            {
                out.println("<script>alert('Invalid Admin Login details')</script>");
            }
            con.close();
            ps.close();
            rs.close();
        }
        catch(Exception ex) {
            out.println("<script>alert('error at :"+ ex.getMessage() +"')</script>");
        }
    %>
</body>
</html>