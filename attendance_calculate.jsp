<%@ page import="java.sql.*" language="java" contentType="text/html"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Management System</title>
    <link href="logo.png" rel="icon" type="image">
	<link href="home_style.css" rel="stylesheet" type="text/css">
    <script>
        function check() {
            var pattern = document.getElementById("idbox").value;
            var matching = /^PG\d{8,9}$/;
            if(!matching.test(pattern)){
                alert("Enter correct ID");
                window.location.href="checkingAttendance.html";
                return false;
            }
        }
        document.getElementById("sform").addEventListener("submit", 
        function(event){
            event.preventDefault();
            var percentage = parseFloat(document.getElementById("resultper").value);
            var result="";
            if(percentage>=75){
                result="----Have eligibile percentage for you----";
            }
            else {
                result="----You doesn't have eligible attandance----";
            }
            document.getElementById("displaybox").innerText=result;
            document.getElementById("hided").style.display="block"
            document.getElementById("original").style.borderRadius="0"
        });
    </script>
</head>
<body>
    <div id="header">
			<div id="logo"> <img src="logo.png" height="190" width="200" alt="Page Logo"></div>
			<div><h3 style="font-size: 30px; margin-right: 350px; word-spacing: 10px;">ATTENDANCE MANAGEMENT SYSTEM</h3></div>
		</div>
    </div><br>
    <br><br><br><br><br><br><br>
    <div id="original" class="percentagebox">
        <form id="sform" action="attendance_calculate.jsp" method="POST" name="sform" onsubmit="return check()">
        <center>
        <h3 style="padding: 10px 20px; color: brown;">Want to know your Attandance Percentage?</h3>
        <h3 style="padding: 3px 20px; color:black; display: inline;">Enter your student ID</h3>
        <input type="text" id="idbox" name="idbox"/>
        <input type="submit" value="check" style="width: 100px; padding-left: 0%; background-color: greenyellow; font-weight: 600; border-radius: 10px;"/>
        </center>
        </form>
    </div>

    <table id="tab1">
    <thead>
        <tr>
            <th>Student Name</th>
            <th>Student ID</th>
            <th>Total Classes</th>
            <th>Total Attended</th>
            <th>Total Percentage</th>
            <th>Status</th>
        </tr>
    </thead>
    <tbody id="dataBody">
            <%
                try {
                    String id;
                    id=request.getParameter("idbox");
                    Class.forName("oracle.jdbc.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","AP","chandukittu");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT SUM(total_classes) AS total_classes FROM total_classes_mca2sem");
                    int total=0;
                    while(rs.next()){
                        total = rs.getInt("total_classes");
                    }
                    
                }
            %>
        <tr>
            <td><%= rs2.getInt("total_classes") %></td>
            <td><%= rs2.getString("projectid") %></td>
            <td><%= rs2.getString("projectname") %></td>
            <td>return check();</td>
        </tr>
    </tbody>
    
    <div id="hided" class="percentagebox" style="display: none; border-radius: 0; height: 160px;">
        <center>
        <h2 style="padding: 10px 20px; color: brown; text-decoration: underline; font-weight: 700;">RESULT</h2><br>
        <h3 style="padding: 3px 20px; color:black; display: inline;">Total classes</h3>
        <input type="number" readonly id="totalClasses" name="totalClasses" style="width: 60px; margin-right: 50px;"/>
        <h3 style="padding: 3px 20px; color:black; display: inline;">No. of classes attended</h3>
        <input type="number" readonly id="resulttotal" name="resulttotal" style="width: 60px;">
        <h3 style="padding: 3px 20px; color:black; display: inline;">Calculated Percentage :</h3>
        <input type="text" readonly id="resultper" name="resultper" style="width: 60px;">
        <br><br>
        <h4 id="displaybox" style="color: red;"></h4>
        </center>
    </div>
        

    <%
        ps.close();
        rs.close();
        con.close();
        catch(Exception ex){
            out.println("<script>alert('Error at : "+ex.getMessage()+"')</script>");
        }
    %>
    <div id="footer">
        <h3 style="margin-right:60px; color:aqua;">Contact us</h3>
        <span class="footerspan">+91 7013074531</span>&nbsp;&nbsp;<span class="footerspan">attendanceproject1@gmail.com</span class="footerspan">&nbsp;&nbsp;<span class="footerspan">Gvp colllege, Rushikonda</span><br>
        <label style="font-size:12px; margin-top:20px; margin-right:50px; margin-bottom:0px; ">&copy; 2024-2025 GVP All rights reserved.</label>
	</div>
</body>
</html>