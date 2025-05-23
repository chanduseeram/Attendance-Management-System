<%@ page import="java.sql.*" language="java" contentType="text/html"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Tracking System</title>
    <link rel="icon" type="image" href="logo.png">
    <link href="home_style.css" rel="stylesheet" type="text/css">
    <style>
        * { 
        	color: #001D3D; 
        }
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .sub2 {
            color: white;
            background-color: #001D3D;
            margin-left: 20px;
            padding: 4px 5px;
        }
        select {
            color: #001D3D;
            height: 35px;
        }
        table {
            width: 80%;
            max-width: 1200px;
            background-color: #ffffff;
            color: #001D3D;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 20px;
            border-collapse: separate;
            border-spacing: 0;
            text-align: center;
            margin-left: 150px;
        }
        th, td {
            padding: 12px 16px;
            color: #001D3D;
        }
        th {
            background-color: #e6f0ff;
            font-weight: bold;
        }
        td {
            border-bottom: 1px solid #eee;
        }
        tr:last-child td {
            border-bottom: none;
        }
        .eligible { color: green; }
        .not-eligible { color: red; }
    </style>
    <script>
        function filterTable() {
            const input = document.getElementById("searchInput");
            const filter = input.value.toUpperCase();
            const rows = document.getElementById("dataBody").getElementsByTagName("tr");

            for (let row of rows) {
                row.style.display = row.innerText.toUpperCase().includes(filter) ? "" : "none";
            }
        }
    </script>
</head>
<body style="background-color:white !important;">
    <div id="header">
        <div id="logo"><img src="logo.png" height="100" width="150" alt="Page Logo"></div>
        <div><h3 style="font-size: 30px; margin-right: 350px; word-spacing: 10px;">ATTENDANCE MANAGEMENT SYSTEM</h3></div>
    </div>
    <br><br><br>

    <!-- Form for Subject Selection -->
    <center>
        <form method="get" action="">
            <select id="subjectSelect" name="subjectSelect" required style="width: 200px; padding: 5px; font-size: 16px;">
                <option value="" disabled selected hidden>Select Subject</option>
                <option value="FLAT">FLAT</option>
                <option value="Computer Networks">Computer Networks</option>
                <option value="DBMS">DBMS</option>
                <option value="Web programming">Web Programming</option>
                <option value="AI">AI</option>
                <option value="IRS">IRS</option>
                <option value="DAA">DAA</option>
                <option value="OE Non conventional">OE Non conventional</option>
                <option value="OE Entrepreneurship">OE Entrepreneurship</option>
                <option value="WP Lab">WP Lab</option>
                <option value="DBMS Lab">DBMS Lab</option>
                <option value="CN Lab">CN Lab</option>
            </select>
            <input type="submit" value="Search" class="sub2" />
        </form>
    </center>

    <%
    String subject = request.getParameter("subjectSelect");
    if (subject != null && !subject.isEmpty()) {
    %>
    <div id="displayMain" style="display:block;">
    	<br><br>
        <center>
        	<h2><%= subject %></h2><br><br>
            <input id="searchInput" type="text" placeholder="Search for a student" onkeyup="filterTable()" style="width:220px; height:30px; padding:3px 0px 3px 50px;" />
        </center>
        <br><br>
        <table>
            <thead>
                <tr>
                    <th>Student Name</th>
                    <th>Student ID</th>
                    <th>Total Classes</th>
                    <th>Attended Classes</th>
                    <th>Percentage</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody id="dataBody">
<%
try {
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "AP", "chandukittu");

    String sql = "SELECT ar.student_name AS s_name, " +
                 "ar.student_id AS s_id, " +
                 "(SELECT COUNT(DISTINCT t.TODAY_DATE) FROM total_classes_mca2sem t WHERE t.SUBJECT = ?) AS total_classes, " +
                 "(SELECT COUNT(DISTINCT s2.TODAY_DATE) " +
                 " FROM student_attendance_register s2 " +
                 " WHERE s2.S_NO = ar.S_NO AND s2.STATUS = 1 AND s2.TODAY_DATE IN " +
                 "     (SELECT TODAY_DATE FROM total_classes_mca2sem WHERE SUBJECT = ?)) AS attended_classes " +
                 "FROM attendance_register ar " +
                 "ORDER BY ar.student_id";

    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, subject);
    ps.setString(2, subject);
    ResultSet rs = ps.executeQuery();

    while (rs.next()) {
        String s_name = rs.getString("s_name");
        String s_id = rs.getString("s_id");
        int total_classes = rs.getInt("total_classes");
        int attended = rs.getInt("attended_classes");
        double percent;
        if (total_classes == 0) {
            percent = 0.0;
        } else {
            percent = ((double) attended / total_classes) * 100;
        }

        String statusText = percent >= 75 ? "Eligible" : "Not eligible";
%>
<tr>
  <td style="text-align: left;"><%= s_name %></td>
  <td><%= s_id %></td>
  <td><%= total_classes %></td>
  <td><%= attended %></td>
  <td><%= String.format("%.2f", percent) %>%</td>
  <td class="<%= percent >= 75 ? "eligible" : "not-eligible" %>"><%= statusText %></td>

</tr>
<%
    }

    rs.close();
    ps.close();
    con.close();
} catch (Exception ex) {
    out.println("<script>alert('Error: " + ex.getMessage() + "')</script>");
}
%>

            </tbody>
        </table>
    </div>
    <%
    } //if dhi idhi
    %>
</body>
</html>
