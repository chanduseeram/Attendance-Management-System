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
            String Date = request.getParameter("getdatevalue");
            String sub = request.getParameter("subject");
            if (Date == null || Date.trim().isEmpty()) {
                out.println("<script>alert('Error: Date is missing!')</script>");
                return;
            }
            
            Date = Date.replace(" ", "").trim(); // main logic that removes spaces. because sql column name doesnt accept spaces.
            Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "AP", "chandukittu");
            Statement st = con.createStatement();
            st.executeUpdate("ALTER TABLE Attendance_register ADD \"" + Date + "\" NUMBER DEFAULT 0");
            st.close();
            PreparedStatement ps = con.prepareStatement("UPDATE Attendance_register SET \"" + Date + "\" = ? WHERE s_no = ?");
            PreparedStatement Psub = con.prepareStatement("INSERT INTO total_classes_mca2sem VALUES('\"" + sub + "\"',1)");
            
            Psub.executeUpdate();
            Psub.close();
            int k = 0;
            for (int i = 1; i <= 64; i++) {
                String checkboxValue = request.getParameter(String.valueOf(i));
                int attendance = (checkboxValue != null) ? 1 : 0;
                ps.setInt(1, attendance);
                ps.setInt(2, i);
                k += ps.executeUpdate();
            }
            if (k > 0) {
                response.sendRedirect("index.html");
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