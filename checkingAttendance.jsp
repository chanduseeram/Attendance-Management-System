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
        <a style="background-color: transparent;" href="allAttendanceTable.jsp"><button style="background-color: #001D3D; ">Check Entire Attendance</button></a>
    </div>
    <br><br><br><br><br>

    <div id="original" name="original" class="percentagebox" style="height:120px; padding:5px 20px;">
    	<center><h3 style="padding: 10px 20px 10px 20px; color: brown;">Want to know your Attendance Percentage?</h3></center>
            <center>
            <form id="sform" name="sform" method="post">
                <h3 style="padding: 3px 10px; color:black; display: inline;">Enter student ID</h3>
                <input type="text" id="idbox" name="idbox" style="width:130px; font-size:16px;" required/>
                <h3 style="padding: 3px 10px; color:black; display: inline;">Enter department</h3>
                <select id="Adepartment" name="Adepartment" style="color: black; font-size: 16px; padding: 5px 15px; border-radius:10px;" required>
                    <option value="" disabled selected hidden>Department</option>
                    <option value="mca">MCA</option>
                    <option value="msc">M.Sc</option>
                    <option value="bca">BCA</option>
                    <option value="mba">MBA</option>
                 </select>
                <h3 style="padding: 3px 10px; color:black; display: inline; margin-left:40px;">Enter semester</h3>
                <select id="Asemester" name="Asemester" style="color: black; font-size: 16px; padding: 5px 15px; border-radius:10px;" required>
                    <option value="" disabled selected hidden>Semester</option>
                    <option value="1sem">1st sem</option>
                    <option value="2sem">2nd sem</option>
                    <option value="3sem">3rd sem</option>
                    <option value="4sem">4th sem</option>
                    <option value="5sem">5th sem</option>
                    <option value="6sem">6th sem</option>
                 </select>
                <center><input type="submit" value="Check" style="width: 110px; background-color: greenyellow; font-weight: 600; margin-top:10px; padding-right:10px; border-radius: 10px;"/></center>
            </form>
            </center>
        
    </div>

    <%
    if (request.getMethod().equalsIgnoreCase("post")) {
        String id = "";
    	String fullId = request.getParameter("idbox");
    	if (fullId != null) {
    		fullId = fullId.trim();
    		fullId = fullId.toUpperCase();
    	}
        String dept = request.getParameter("Adepartment");
        String sem = request.getParameter("Asemester");
        if (fullId != null && fullId.length() >= 2) {
        	id = fullId.substring(fullId.length() - 2);
        }
        if (id != null && !id.trim().isEmpty()) {
            try {
                Class.forName("oracle.jdbc.OracleDriver");
                Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","AP","chandukittu");
                
                int joiningYear = 2425;
                PreparedStatement ps2 =con.prepareStatement("SELECT joining_year AS jyear FROM semester_year where department = ?");
                if (dept != null && sem != null) {
                    String deptFull = dept + sem;
                    ps2.setString(1, deptFull.toLowerCase());
                }

                ResultSet rs12 = ps2.executeQuery();
                if(rs12.next()){
                	joiningYear = rs12.getInt("jyear");
                }
                
                
                PreparedStatement ps = con.prepareStatement(
                    "SELECT s_no, COUNT(*) AS total_days, SUM(status) AS present_days, " +
                    "ROUND(SUM(status) * 100.0 / COUNT(*), 2) AS percentage " +
                    "FROM attendance_"+ dept + sem +"_"+ joiningYear +" WHERE s_no = ? GROUP BY s_no ORDER BY s_no"
                );
				PreparedStatement ps1 = con.prepareStatement("select s_name, s_id from student_register_"+ dept +"_"+ joiningYear +" where s_id=?");
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
    <div id="hided1" class="percentagebox" style="border-radius: 0; height: 240px; width:1070px;">
        <center>
            <h2 style="padding: 10px 20px; color: brown; padding-top:40px; text-decoration: underline; font-weight: 700;">RESULT</h2><br>
            <h3 style="padding: 3px 20px; color:black; display: inline;">Student Name</h3>
            <input type="text" readonly id="st_name" value="<%= s_name %>" style="width: 190px; margin-right: 50px; padding-left:15px;" />
            
            <h3 style="padding: 3px 20px; color:black; display: inline;">Student ID</h3>
            <input type="text" readonly id="st_id" value="<%= s_id %>" style="width: 125px; margin-right: 50px;" /><br><br>
            
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
        let color = "red";
        if (percentage >= 75) {
            result = "----You have eligible attendance percentage----";
            color = "green";
        } else {
            result = "----You do not have eligible attendance----";
        }
        document.getElementById("displaybox").innerText = result;
        document.getElementById("displaybox").style.color = color;
        document.getElementById("hided1").style.display = "block";
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
