<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Tracking System</title>
    <link rel="icon" type="image" href="logo.png">
    <link href="home_style.css" rel="stylesheet" type="text/css">
</head>
<body class="bodytag">
    <div id="header">
			<div id="logo"> <img src="logo.png" height="100" width="120" alt="Page Logo"></div>
			<div><h3 style="font-size: 30px; margin-right: 350px; word-spacing: 10px;">ATTENDANCE MANAGEMENT SYSTEM</h3></div>
		</div>
    </div><br>
<%
	String name = (String) session.getAttribute("nameDisplay");
	String department = ((String) session.getAttribute("department")).toUpperCase();
	if(department=="MCA" || department=="MSC" || department=="MBA" || department=="BCA"){
%>
    <h1 style="color:black; margin-left:30px;">Welcome, <%= name %>!</h1>
    <br><br><br>
    <div id="hiddenDept">
        <center><h1 style="margin-bottom: 5px;" id="mcaSelect">Select Department</h1></center>
        <center><h2 style="color:brown" id="mcaSelect2">To mark Attendance</h2></center><br><br>
        <center>
      		<form method="post">
    <select id="Selectdepartment" name="Selectdepartment" style="color: black; font-size: 18px; border-radius:10px; padding:5px 5px;" required>
        <option value="" disabled selected hidden>Select Department</option>
            <option value="<%= department %>"><%= department %></option>
<% 
	}
	else {
%>
		<h1 style="color:black; margin-left:30px;">Welcome, <%= name %>!</h1>
	    <br><br><br>
	    <div id="hiddenDept">
	        <center><h1 style="margin-bottom: 5px;" id="mcaSelect">Select Department</h1></center>
	        <center><h2 style="color:brown" id="mcaSelect2">To mark Attendance</h2></center><br><br>
	        <center>
	      		<form method="post">
	    <select id="Selectdepartment" name="Selectdepartment" style="color: black; font-size: 18px; border-radius:10px; padding:5px 5px;" required>
	    <option value="" disabled selected hidden>Select Department</option>
<%	    
		String[] departments = department.split("AND");
		String dept1 = departments.length > 0 ? departments[0] : "";
		String dept2 = departments.length > 1 ? departments[1] : "";
		String dept3 = departments.length > 2 ? departments[2] : "";
		String dept4 = departments.length > 3 ? departments[3] : "";
		String dept5 = departments.length > 4 ? departments[4] : "";
%>
		<% if (!dept1.trim().isEmpty()) { %>
            <option value="<%= dept1 %>"><%= dept1 %></option>
        <% } %>
        <% if (!dept2.trim().isEmpty()) { %>
            <option value="<%= dept2 %>"><%= dept2 %></option>
        <% } %>
        <% if (!dept3.trim().isEmpty()) { %>
            <option value="<%= dept3 %>"><%= dept3 %></option>
        <% } %>
        <% if (!dept4.trim().isEmpty()) { %>
            <option value="<%= dept4 %>"><%= dept4 %></option>
        <% } %>
        <% if (!dept5.trim().isEmpty()) { %>
            <option value="<%= dept5 %>"><%= dept5 %></option>
        <% } }%>
    </select>
    <button type="submit" style="background-color: green; margin-left:20px;">Submit</button>
	</form>  		
       </center>
    </div>
    
<%
	String dept = request.getParameter("Selectdepartment");
	session.setAttribute("dept", dept); 
%>
    <script>
    var department = "<%= dept %>";
    window.onload = function() {
        if (department !== "") {
            document.getElementById("hiddenDept").style.display = "block";
            var divId = "hiddenSem" + department.toUpperCase();
            var divToShow = document.getElementById(divId);
            if (divToShow) {
                divToShow.style.display = "block";
            }
        }
    };
</script>
    <br><br>
    <div id="hiddenSemMCA" style="display:none">
        <center><h1 style="margin-bottom: 5px;" id="mcaSelect">Select Semister</h1></center>
        <center><h2 style="color:brown" id="mcaSelect2">To mark Attendance</h2></center><br><br>
        <a style="margin-left: 350px;" href="FirstSem.jsp">MCA 1st Sem</a>
        <a href="attandace.jsp">MCA 2nd Sem</a>
        <a href="SecondSem.jsp">MCA 3rd Sem</a>
        <a href="ThirdSem.jsp">MCA 4th Sem</a>
    </div>
    <div id="hiddenSemMSC" style="display:none">
        <center><h1 style="margin-bottom: 5px;" id="mscSelect">Select Semister</h1></center>
        <center><h2 style="color:brown" id="mscSelect2">To mark Attendance</h2></center><br><br>
        <a style="margin-left: 350px;" href="FirstSem.jsp">M.Sc 1st Sem</a>
        <a href="SecondSem.jsp">M.Sc 2nd Sem</a>
        <a href="ThirdSem.jsp">M.Sc 3rd Sem</a>
        <a href="FourthSem.jsp">M.Sc 4th Sem</a>
    </div>
    <div id="hiddenSemMBA" style="display:none" >
        <center><h1 style="margin-bottom: 5px;" id="mbaSelect">Select Semister</h1></center>
        <center><h2 style="color:brown" id="mbaSelect2">To mark Attendance</h2></center><br><br>
        <a style="margin-left: 350px;" href="FirstSem.jsp">MBA 1st Sem</a>
        <a href="SecondSem.jsp">MBA 2nd Sem</a>
        <a href="mca3sem.jsp">MBA 3rd Sem</a>
        <a href="FourthSem.jsp">MBA 4th Sem</a>
    </div>
    <div id="hiddenSemBCA" style="display:none" >
        <center><h1 style="margin-bottom: 5px;" id="bcaSelect">Select Semister</h1></center>
        <center><h2 style="color:brown" id="bcaSelect2">To mark Attendance</h2></center><br><br>
        <a style="margin-left: 125px;" href="FirstSem.jsp">BCA 1st Sem</a>
        <a href="SecondSem.jsp">BCA 2nd Sem</a>
        <a href="mca3sem.jsp">BCA 3rd Sem</a>
        <a href="FourthSem.jsp">BCA 4th Sem</a>
        <a href="BCAFifthSem.jsp">BCA 5th Sem</a>
        <a href="BCASixthSem.jsp">BCA 6th Sem</a>
    </div>

    <div id="footer">
        <h3 style="margin-right:60px; color:aqua;">Contact us</h3>
        <span class="footerspan">Phone : +91 7013074531</span>&nbsp;&nbsp;<span class="footerspan">attendanceproject1@gmail.com</span class="footerspan">&nbsp;&nbsp;<span class="footerspan">Gvp colllege, Rushikonda</span><br>
        <label style="font-size:12px; margin-top:20px; margin-right:50px; margin-bottom:0px; ">&copy; 2024-2025 GVP All rights reserved.</label>
	</div>
</body>
</html>