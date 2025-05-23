<%@ page import="java.sql.*" language="java" contentType="text/html"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Tracking System</title>
    <link rel="icon" type="image" href="logo.png">
    <link href="home_style.css" rel="stylesheet" type="text/css">
</head>
<body>
    <div id="header">
        <div id="logo"> <img src="logo.png" height="100" width="150" alt="Page Logo"></div>
        <div><h3 style="font-size: 30px; margin-right: 150px; word-spacing: 10px;">ATTENDANCE MANAGEMENT SYSTEM</h3></div>
        <a style="background-color: transparent;" href="SelectDepartment.html"><button style="background-color: #001D3D; ">Check Entire Attandance</button></a>
    </div>
    <br><br><br><br><br><br>

    <div id="original" class="percentagebox" style="height:100px;">
        <form id="sform">
            <center>
                <h3 style="padding: 20px 20px 10px 20px; color: brown;">Want to know your Attendance Percentage?</h3>
                <h3 style="padding: 3px 20px; color:black; display: inline;">Enter your student ID</h3>
                <input type="text" id="idbox" name="idbox" required/>
                <input type="submit" value="Check" style="width: 110px; background-color: greenyellow; font-weight: 600; padding-right:10px; border-radius: 10px;"/>
            </center>
        </form>
    </div>

    <%
        String id = "";
        String fullId = request.getParameter("idbox");
        if (fullId != null && fullId.length() >= 2) {
        	id = fullId.substring(fullId.length() - 2);
        }
        if (id != null && !id.trim().isEmpty()) {
            try {
                Class.forName("oracle.jdbc.OracleDriver");
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","AP","chandukittu");
                PreparedStatement ps = con.prepareStatement(
                    "SELECT s_no, COUNT(*) AS total_days, SUM(status) AS present_days, " +
                    "ROUND(SUM(status) * 100.0 / COUNT(*), 2) AS percentage " +
                    "FROM student_attendance_register WHERE s_no = ? GROUP BY s_no ORDER BY s_no"
                );
				PreparedStatement ps1 = con.prepareStatement("select student_name as s_name, student_id as s_id from attendance_register where student_id=?");
				ps1.setString(1, fullId);
                ps.setString(1, id);
                ResultSet rs = ps.executeQuery();
				ResultSet rs1 = ps1.executeQuery();
				String s_name = "";
				String s_id = "";
				if (rs1.next()) {
    				s_name = rs1.getString("s_name");
    				s_id = rs1.getString("s_id");
				}
                if (rs.next()) {
                    int total_days = rs.getInt("total_days");
                    int present_days = rs.getInt("present_days");
                    double percentage = rs.getDouble("percentage");
    %>
    <div id="hided" class="percentagebox" style="border-radius: 0; height: 240px;">
        <center>
            <h2 style="padding: 10px 20px; color: brown; padding-top:40px; text-decoration: underline; font-weight: 700;">RESULT</h2><br>
            <h3 style="padding: 3px 20px; color:black; display: inline;">Student Name</h3>
            <input type="text" readonly id="totalClasses" value="<%= s_name %>" style="width: 190px; margin-right: 50px; padding-left:15px;" />
            
            <h3 style="padding: 3px 20px; color:black; display: inline;">Student ID</h3>
            <input type="text" readonly id="totalClasses" value="<%= s_id %>" style="width: 125px; margin-right: 50px;" /><br><br>
            
            <h3 style="padding: 3px 20px; color:black; display: inline;">Total classes</h3>
            <input type="text" readonly id="totalClasses" value="<%= total_days %>" style="width: 60px; margin-right: 50px;" />

            <h3 style="padding: 3px 20px; color:black; display: inline;">No. of classes attended</h3>
            <input type="text" readonly id="resulttotal" value="<%= present_days %>" style="width: 60px;" />

            <h3 style="padding: 3px 20px; color:black; display: inline;">Calculated Percentage :</h3>
            <input type="text" readonly id="resultper" value="<%= percentage %>" style="width: 60px;" />
            <br><br>
            <h4 id="displaybox" style="color: red;"></h4>
        </center>
    </div>

    <script>
        var percentage = parseFloat("<%= percentage %>");
        var result = "";
        if (percentage >= 75) {
            result = "----You have eligible attendance percentage----";
            color = "green";
        } else {
            result = "----You do not have eligible attendance----";
        }
        document.getElementById("displaybox").innerText = result;
        document.getElementById("displaybox").style.color = color;
        document.getElementById("original").style.borderRadius = "0";
    </script>
    <%
                } else {
                    out.println("<script>alert('Student ID not found or no attendance records.')</script>");
                }
                rs.close();
                ps.close();
                con.close();
            } catch(Exception ex){
                out.println("<script>alert('Error: " + ex.getMessage() + "')</script>");
            }
        }
    %>

    <div id="footer">
        <h3 style="margin-right:60px; color:aqua;">Contact us</h3>
        <span class="footerspan">+91 7013074531</span>&nbsp;&nbsp;
        <span class="footerspan">attendanceproject1@gmail.com</span>&nbsp;&nbsp;
        <span class="footerspan">GVP College, Rushikonda</span><br>
        <label style="font-size:12px; margin-top:20px; margin-right:50px;">&copy; 2024-2025 GVP All rights reserved.</label>
    </div>
</body>
</html>
