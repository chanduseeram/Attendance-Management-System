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
    body {
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    table {
      width: 80%;
      max-width: 1200px;
      background-color: #ffffff;
      color: #001D3D;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* soft shadow */
      border-radius: 10px;
      padding: 20px;
      border-collapse: separate;
      border-spacing: 0;
      text-align: center;
      margin-left:150px;
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
	    updateFooter();
	}
  	function updateFooter() {
	    const update = document.getElementById("footer");
	    update.style.position="fixed";
	    update.style.bottom="0";
	    update.style.left="0";
	    update.style.width="100%";
  	}
  </script>
</head>
<body style = "background-color:white !important;">
    <div id="header">
        <div id="logo"> <img src="logo.png" height="100" width="150" alt="Page Logo"></div>
        <div><h3 style="font-size: 30px; margin-right: 50px; word-spacing: 10px;">ATTENDANCE MANAGEMENT SYSTEM</h3></div>
        <a style="background-color: transparent;" href="subjectAttendanceList.jsp"><button style="background-color: #001D3D; ">Check Subject wise Attendance</button></a>
        
        
    </div>
	<br><br><br> 
	<center>
	<div style="justify-content:center; align-items:center;">
		<input id="searchInput" type="text" placeholder="Search for a student" onkeyup="filterTable()" style="justify-content:center; align-items:center; width:220px; height:30px; padding: 5px 0px 5px 50px; "/>
	</div>
	</center><br><br>
	<table style="color: #001D3D;">
	<thead>	
    <tr>
      <th>Student Name</th>
      <th>Student ID</th>
      <th>Total Classes</th>
      <th>Attended Classes</th>
      <th>Percentage&nbsp;&nbsp;</th>
      <th>Status&nbsp;&nbsp;</th>
    </tr>
    </thead>
    <tbody id="dataBody">
<%
try {
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "AP", "chandukittu");
    String sql = "SELECT ar.student_name AS s_name, ar.student_id AS s_id, " +
                 "COUNT(*) AS total_days, " +
                 "SUM(sar.status) AS present_days, " +
                 "ROUND(SUM(sar.status) * 100.0 / COUNT(*), 2) AS percentage " +
                 "FROM attendance_register ar " +
                 "JOIN student_attendance_register sar ON ar.s_no = sar.s_no " +
                 "GROUP BY ar.student_name, ar.student_id " +
                 "ORDER BY ar.student_id";

    PreparedStatement ps = con.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();

    while (rs.next()) {
        String s_name = rs.getString("s_name");
        String s_id = rs.getString("s_id");
        int total_days_count = rs.getInt("total_days");
        int present_days = rs.getInt("present_days");
        double percentage = rs.getDouble("percentage");

        String statusText = percentage >= 75 ? "Eligible" : "Not eligible";
        String color = percentage >= 75 ? "green" : "red";
%>
<tr>
  <td style="text-align: left;"><%= s_name %></td>
  <td><%= s_id %></td>
  <td><%= total_days_count %></td>
  <td><%= present_days %></td>
  <td><%= percentage %>%</td>
  <td class="<%= percent >= 75 ? "eligible" : "not-eligible" %>"><%= statusText %></td>
</tr>
<%
    }

    rs.close();
    ps.close();
    con.close();
} catch (Exception ex) {
    out.println("<script>alert('Error at: " + ex.getMessage() + "')</script>");
}
%>
	</tbody>
	</table><br><br><br>
    <div id="footer" style="position: relative; bottom:0; left:0;">
        <h3 style="margin-right:60px; padding-top:5px; color:aqua;">Contact us</h3>
        <span class="footerspan">+91 7013074531</span>&nbsp;&nbsp;
        <span class="footerspan">attendanceproject1@gmail.com</span>&nbsp;&nbsp;
        <span class="footerspan">GVP College, Rushikonda</span><br>
        <label style="font-size:12px; padding-top:5px; margin-right:50px;">&copy; 2024-2025 GVP All rights reserved.</label>
    </div>
</body>
</html>
