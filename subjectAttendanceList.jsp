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

    <div id="originalNew2" name="originalNew2" class="percentagebox" style="height:120px; padding:5px 20px; margin-left:370px; width:700px;">
            <form id="formNew2" name="formNew2" method="post"><br>
                <h3 style="padding: 3px 10px; color:black; display: inline;">Enter department</h3>
                <select id="departmentNew2" name="departmentNew2" style="color: black; font-size: 16px; padding: 5px 15px; border-radius:10px;" required>
                    <option value="" disabled selected hidden>Department</option>
                    <option value="mca">MCA</option>
                    <option value="msc">M.Sc</option>
                    <option value="bca">BCA</option>
                    <option value="mba">MBA</option>
                 </select>
                <h3 style="padding: 3px 10px; color:black; display: inline; margin-left:40px;">Enter semester</h3>
                <select id="semesterNew2" name="semesterNew2" style="color: black; font-size: 16px; padding: 5px 15px; border-radius:10px;" required>
                    <option value="" disabled selected hidden>Semester</option>
                    <option value="1sem">1st sem</option>
                    <option value="2sem">2nd sem</option>
                    <option value="3sem">3rd sem</option>
                    <option value="4sem">4th sem</option>
                    <option value="5sem">5th sem</option>
                    <option value="6sem">6th sem</option>
                 </select><br><br>
                <center><input type="submit" value="Check" style="width: 110px; background-color: greenyellow; font-weight: 600; margin-top:10px; padding-right:10px; border-radius: 10px;"/></center>
            </form>
         </div><br><br><br>
    <center>
    
<% 
	String dept1 = request.getParameter("departmentNew2");
	String sem1 = request.getParameter("semesterNew2");
	if("mca".equalsIgnoreCase(dept1) && "1sem".equalsIgnoreCase(sem1)){
%>   
<div>
    <form method="post">
    <select id="subject1sem" name="subject1sem" style="width: 200px; padding: 5px 5px; font-size: 16px;">
      <option value="" disabled selected hidden>Select Subject</option>
      <option value="OS">Operating System</option>
      <option value="CO">Computer Organization</option>
      <option value="DS">Data Structures & Algorithms</option>
      <option value="OOPS">OOPS</option>
      <option value="Management Accounts">Management Accounts</option>
      <option value="OR">Operational Research</option>
      <option value="DS Lab">DS Lab</option>
      <option value="OS Lab">OS Lab</option>
      <option value="CO Lab">CO Lab</option>
    </select>
	</form>
</div>
    
<% 
	}
	String dept2 = request.getParameter("departmentNew2");
	String sem2 = request.getParameter("semesterNew2");
	if("mca".equalsIgnoreCase(dept2) && "2sem".equalsIgnoreCase(sem2)){
%>
    <div>
        <form method="get" action="">
            <select id="subjectSelect2" name="subjectSelect2" required style="width: 200px; padding: 5px; font-size: 16px;">
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
    </div>
    </center>

<% 
	}
	String dept3 = request.getParameter("departmentNew2");
	String sem3 = request.getParameter("semesterNew2");
	if("mca".equalsIgnoreCase(dept3) && "3sem".equalsIgnoreCase(sem3)){
%>
    <div>
        <form method="get" action="">
            <select id="subjectSelect3" name="subjectSelect3" required style="width: 200px; padding: 5px; font-size: 16px;">
            	<option value="" disabled selected hidden>Select Subject</option>
                <option value="dont know">dont know</option>
      			<option value="dont know">dont know</option>
      			<option value="dont know">dont know</option>
      			<option value="dont know">dont know</option>
      			<option value="dont know">dont know</option>
      			<option value="dont know">dont know</option>
      			<option value="dont know">dont know</option>
     			<option value="dont know">dont know</option>
      			<option value="dont know">dont know</option>
      			<option value="dont know lab">dont know lab</option>
      			<option value="dont know lab">dont know lab</option>
      			<option value="dont know lab">dont know lab</option>
            </select>
            <input type="submit" value="Search" class="sub2" />
        </form>
    </div>
    </center>

<% 
	}
	String dept4 = request.getParameter("departmentNew2");
	String sem4 = request.getParameter("semesterNew2");
	if("mca".equalsIgnoreCase(dept4) && "4sem".equalsIgnoreCase(sem4)){
%>
    <div>
        <form method="get" action="">
            <select id="subjectSelect4" name="subjectSelect4" required style="width: 200px; padding: 5px; font-size: 16px;">
            	<option value="" disabled selected hidden>Select Subject</option>
                <option value="dont know">dont know</option>
      			<option value="dont know">dont know</option>
      			<option value="dont know">dont know</option>
      			<option value="dont know">dont know</option>
      			<option value="dont know">dont know</option>
      			<option value="dont know">dont know</option>
      			<option value="dont know">dont know</option>
     			<option value="dont know">dont know</option>
      			<option value="dont know">dont know</option>
      			<option value="dont know lab">dont know lab</option>
      			<option value="dont know lab">dont know lab</option>
      			<option value="dont know lab">dont know lab</option>
            </select>
            <input type="submit" value="Search" class="sub2" />
        </form>
    </div>
    </center>

    <%
	}
    String subject1 = request.getParameter("subjectSelect1");
    String subject2 = request.getParameter("subjectSelect2");
    String subject3 = request.getParameter("subjectSelect3");
    String subject4 = request.getParameter("subjectSelect4");
    String sub = "";
    if(subject1!=null){
    	sub = subject1;
    }
    else if(subject2!=null){
    	sub = subject2;
    }
    else if(subject3!=null){
    	sub = subject3;
    }
    else if(subject4!=null){
    	sub = subject4;
    }
    if (sub != null && !sub.isEmpty()) {
    %>
    <div id="displayMain" style="display:block;">
    	<br><br>
        <center>
        	<h2><%= sub %></h2><br><br>
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
    
    String dept = request.getParameter("departmentNew2");
	String sem = request.getParameter("semesterNew2");
    
    if (dept != null && sem != null) {
    	int joiningYear = 2425;
    	String deptFull = dept + sem;
        PreparedStatement ps2 = con.prepareStatement("SELECT joining_year AS jyear FROM semester_year where department = ?");
        
            ps2.setString(1, deptFull.toLowerCase());
        
        ResultSet rs12 = ps2.executeQuery();
        if(rs12.next()){
        	joiningYear = rs12.getInt("jyear");
        }

    String sql = "SELECT sr.s_name, sr.s_id, " +
                 "(SELECT COUNT(DISTINCT t.CLASS_DATE) FROM classes_"+ deptFull +"_"+ joiningYear +" t WHERE t.SUBJECT = ?) AS total_classes, " +
                 "(SELECT COUNT(DISTINCT adr.CLASS_DATE) " +
                 " FROM attendance_"+ deptFull +"_"+ joiningYear +" adr " +
                 " WHERE adr.S_NO = sr.S_NO AND adr.STATUS = 1 AND adr.CLASS_DATE IN " +
                 "     (SELECT CLASS_DATE FROM classes_"+ deptFull +"_"+ joiningYear +" WHERE SUBJECT = ?)) AS attended_classes " +
                 "FROM student_register_"+ dept +"_"+ joiningYear +" sr " +
                 "ORDER BY sr.s_id";

    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, sub);
    ps.setString(2, sub);
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
    }
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
