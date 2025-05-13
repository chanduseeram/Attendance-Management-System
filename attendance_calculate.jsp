<%@ page import="java.sql.*" language="java" contentType="text/html"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Management System</title>
    <link href="collegelogo.png" rel="icon" type="image">
</head>
<body>
    <%
        try {
            String id;
            id=request.getParameter("idbox");
            Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","AP","chandukittu");
            PreparedStatement ps = con.prepareStatement("SELECT SUM(total_classes) AS total_classes FROM total_classes_mca2sem");
            ResultSet rs = ps.executeQuery();
            int total=0;
            if(rs.next()){
                total = rs.getInt("total_classes");
            }
            ps.close();
            rs.close();
            con.close();
        }
    %>
        <script>
            document.getElementById("totalClasses").innerText="t: <%= total %>";
        </script>
    <%
        catch(Exception ex){
            out.println("<script>alert('Error at : "+ex.getMessage()+"')</script>");
        }
    %>
</body>
</html>