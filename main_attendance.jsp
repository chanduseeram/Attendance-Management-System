<%@ page import="java.sql.*" contentType="text/html" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Management System</title>
    <link href="collegelogo.png" type="image" rel="icon">
</head>
<body>
    <%
        try {
            String date = request.getParameter("getdatevalue");
            String sub = request.getParameter("subject");
            if (date == null ||date.trim().isEmpty()) {
                out.println("<script>alert('Error: Date is missing!')</script>");
                return;
            }
            Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "AP", "chandukittu");
            PreparedStatement ps = con.prepareStatement("insert into student_attendance_register values(?,?,?)");
            PreparedStatement Psub = con.prepareStatement("INSERT INTO total_classes_mca2sem VALUES (?, 1, ?)");
            Psub.setString(1, sub);
            Psub.setString(2, date);
            Psub.executeUpdate();
            Psub.close();

            int k = 0;
            for (int i = 1; i <= 64; i++) {
                String checkboxValue = request.getParameter(String.valueOf(i));
                int attendance = (checkboxValue != null) ? 1 : 0;
                ps.setInt(1, i);
                ps.setString(2, date);
                ps.setInt(3, attendance);
                k += ps.executeUpdate();
            }
            if (k > 0) {
            	out.println("<script>alert('Attendance submitted successfully!'); window.location.href='index.html';</script>");
            } else {
                out.println("<script>alert('Failed to update attendance')</script>");
            }

            ps.close();
            con.close();
        } catch(Exception ex) {
            out.println("<script>alert('Error: " + ex.getMessage() + "')</script>");
        }
    %>
</body>
</html>