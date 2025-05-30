<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Tracking System</title>
    <link href="attandance_styles.css" rel="stylesheet">
    <link rel="icon" type="image" href="logo.png">
    </head>
<body>
    <div id="header">
			<div id="logo"> <img src="logo.png" height="100" width="150" alt="Page Logo"></div>
			<div><h3 style="font-size: 30px; margin-right: 150px; word-spacing: 10px;">ATTENDANCE MANAGEMENT SYSTEM</h3></div>
			<button onclick="openF_RegisterModal()" type="submit">Semester update??</button>
			<div id="SemUpdate" class="modal">
			 <div class="modal-content">
			 <h3>Semester update</h3>
			  <span class="close" onclick="closeF_RegisterModal()">&times;</span>
			  <center><span style="color:red; font-size:14px;">"If 2025-2026 batch then enter : 2526"</span></center>
			  <form method="post">
				<input type="tel" placeholder="Enter new Joining years" maxlength="4" pattern="[0-9]{4}" id="semYears2" name="semYears2"/>
			  	<button type="submit">Update</button>
			  </form>
			</div>
		  </div>
		</div>
    <br>
    <%
    try
    {
    	String dept = (String) session.getAttribute("dept").toString();
    	String dept2 = dept+"2sem";
    	Class.forName("oracle.jdbc.OracleDriver");
    	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","AP","chandukittu");
    	PreparedStatement p =con.prepareStatement("SELECT joining_year AS jyear FROM semester_year where department = ?");
        p.setString(1, dept2.toLowerCase());
        ResultSet r = p.executeQuery();
        int joining2=2526;
        if(r.next()){
        	joining2 = r.getInt("jyear");
        }
        
    %>
    <center><h2 style="color:#15467a; text-decoration: underline; font-size: 28px;"><%= dept %> Department <%= joining2 %></h2></center>
    <br>
    <center><h2 style="color:red; font-size: 25px; ">Mark the Attendance</h2></center><br>
    <h2 style="margin: 18px 20px 0px 100px; display: inline;">Today Date :</h2><h2 id="todaydate" name="todaydate" style="margin: 0px; padding: opx; display: inline; color: brown;"></h2><br><br>
    <form id="attandance" action="<%= dept %>_attendance_record.jsp" method="POST" name="attandancemain" onsubmit="return check()">
    <h2 style="display: inline;  margin-left: 100px;">Select Date :</h2><input style="margin-left: 20px; font-size: 17px; color: black; padding: 5px 5px; height: 23px;" placeholder="Format : DD_MM_YYYY" type="text" id="getdatevalue"name="getdatevalue"><br><br>
    <h2 style="display: inline; margin-left: 100px; margin-right: 20px;">Select Subject :</h2>
    <select id="subject2sem" name="subject2sem" style="width: 200px; padding: 5px 5px; font-size: 16px;">
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
    <br><br>
    <center><span style="color: red;">("Press Tab to move for next Roll no. and press SpaceBar to Mark the Checkbox")</span></center>
    <br><br>
<div class="row" id="row1">
  <label class="student"><input type="checkbox" name="1"><span class="testing" id="1001" name="1001"></span></label>
  <label class="student"><input type="checkbox" name="2"><span class="testing" id="1002" name="1002"></span></label>
  <label class="student"><input type="checkbox" name="3"><span class="testing" id="1003" name="1003"></span></label>
</div>
<div class="row" id="row2">
  <label class="student"><input type="checkbox" name="4"><span class="testing" id="1004" name="1004"></span></label>
  <label class="student"><input type="checkbox" name="5"><span class="testing" id="1005" name="1005"></span></label>
  <label class="student"><input type="checkbox" name="6"><span class="testing" id="1006" name="1006"></span></label>
</div>
<div class="row" id="row3">
  <label class="student"><input type="checkbox" name="7"><span class="testing" id="1007" name="1007"></span></label>
  <label class="student"><input type="checkbox" name="8"><span class="testing" id="1008" name="1008"></span></label>
  <label class="student"><input type="checkbox" name="9"><span class="testing" id="1009" name="1009"></span></label>
</div>
<div class="row" id="row4">
  <label class="student"><input type="checkbox" name="10"><span class="testing" id="1010" name="1010"></span></label>
  <label class="student"><input type="checkbox" name="11"><span class="testing" id="1011" name="1011"></span></label>
  <label class="student"><input type="checkbox" name="12"><span class="testing" id="1012" name="1012"></span></label>
</div>
<div class="row" id="row5">
  <label class="student"><input type="checkbox" name="13"><span class="testing" id="1013" name="1013"></span></label>
  <label class="student"><input type="checkbox" name="14"><span class="testing" id="1014" name="1014"></span></label>
  <label class="student"><input type="checkbox" name="15"><span class="testing" id="1015" name="1015"></span></label>
</div>
<div class="row" id="row6">
  <label class="student"><input type="checkbox" name="16"><span class="testing" id="1016" name="1016"></span></label>
  <label class="student"><input type="checkbox" name="17"><span class="testing" id="1017" name="1017"></span></label>
  <label class="student"><input type="checkbox" name="18"><span class="testing" id="1018" name="1018"></span></label>
</div>
<div class="row" id="row7">
  <label class="student"><input type="checkbox" name="19"><span class="testing" id="1019" name="1019"></span></label>
  <label class="student"><input type="checkbox" name="20"><span class="testing" id="1020" name="1020"></span></label>
  <label class="student"><input type="checkbox" name="21"><span class="testing" id="1021" name="1021"></span></label>
</div>
<div class="row" id="row8">
  <label class="student"><input type="checkbox" name="22"><span class="testing" id="1022" name="1022"></span></label>
  <label class="student"><input type="checkbox" name="23"><span class="testing" id="1023" name="1023"></span></label>
  <label class="student"><input type="checkbox" name="24"><span class="testing" id="1024" name="1024"></span></label>
</div>
<div class="row" id="row9">
  <label class="student"><input type="checkbox" name="25"><span class="testing" id="1025" name="1025"></span></label>
  <label class="student"><input type="checkbox" name="26"><span class="testing" id="1026" name="1026"></span></label>
  <label class="student"><input type="checkbox" name="27"><span class="testing" id="1027" name="1027"></span></label>
</div>
<div class="row" id="row10">
  <label class="student"><input type="checkbox" name="28"><span class="testing" id="1028" name="1028"></span></label>
  <label class="student"><input type="checkbox" name="29"><span class="testing" id="1029" name="1029"></span></label>
  <label class="student"><input type="checkbox" name="30"><span class="testing" id="1030" name="1030"></span></label>
</div>
<div class="row" id="row11">
  <label class="student"><input type="checkbox" name="31"><span class="testing" id="1031" name="1031"></span></label>
  <label class="student"><input type="checkbox" name="32"><span class="testing" id="1032" name="1032"></span></label>
  <label class="student"><input type="checkbox" name="33"><span class="testing" id="1033" name="1033"></span></label>
</div>
<div class="row" id="row12">
  <label class="student"><input type="checkbox" name="34"><span class="testing" id="1034" name="1034"></span></label>
  <label class="student"><input type="checkbox" name="35"><span class="testing" id="1035" name="1035"></span></label>
  <label class="student"><input type="checkbox" name="36"><span class="testing" id="1036" name="1036"></span></label>
</div>
<div class="row" id="row13">
  <label class="student"><input type="checkbox" name="37"><span class="testing" id="1037" name="1037"></span></label>
  <label class="student"><input type="checkbox" name="38"><span class="testing" id="1038" name="1038"></span></label>
  <label class="student"><input type="checkbox" name="39"><span class="testing" id="1039" name="1039"></span></label>
</div>
<div class="row" id="row14">
  <label class="student"><input type="checkbox" name="40"><span class="testing" id="1040" name="1040"></span></label>
  <label class="student"><input type="checkbox" name="41"><span class="testing" id="1041" name="1041"></span></label>
  <label class="student"><input type="checkbox" name="42"><span class="testing" id="1042" name="1042"></span></label>
</div>
<div class="row" id="row15">
  <label class="student"><input type="checkbox" name="43"><span class="testing" id="1043" name="1043"></span></label>
  <label class="student"><input type="checkbox" name="44"><span class="testing" id="1044" name="1044"></span></label>
  <label class="student"><input type="checkbox" name="45"><span class="testing" id="1045" name="1045"></span></label>
</div>
<div class="row" id="row16">
  <label class="student"><input type="checkbox" name="46"><span class="testing" id="1046" name="1046"></span></label>
  <label class="student"><input type="checkbox" name="47"><span class="testing" id="1047" name="1047"></span></label>
  <label class="student"><input type="checkbox" name="48"><span class="testing" id="1048" name="1048"></span></label>
</div>
<div class="row" id="row17">
  <label class="student"><input type="checkbox" name="49"><span class="testing" id="1049" name="1049"></span></label>
  <label class="student"><input type="checkbox" name="50"><span class="testing" id="1050" name="1050"></span></label>
  <label class="student"><input type="checkbox" name="51"><span class="testing" id="1051" name="1051"></span></label>
</div>
<div class="row" id="row18">
  <label class="student"><input type="checkbox" name="52"><span class="testing" id="1052" name="1052"></span></label>
  <label class="student"><input type="checkbox" name="53"><span class="testing" id="1053" name="1053"></span></label>
  <label class="student"><input type="checkbox" name="54"><span class="testing" id="1054" name="1054"></span></label>
</div>
<div class="row" id="row19">
  <label class="student"><input type="checkbox" name="55"><span class="testing" id="1055" name="1055"></span></label>
  <label class="student"><input type="checkbox" name="56"><span class="testing" id="1056" name="1056"></span></label>
  <label class="student"><input type="checkbox" name="57"><span class="testing" id="1057" name="1057"></span></label>
</div>
<div class="row" id="row20">
  <label class="student"><input type="checkbox" name="58"><span class="testing" id="1058" name="1058"></span></label>
  <label class="student"><input type="checkbox" name="59"><span class="testing" id="1059" name="1059"></span></label>
  <label class="student"><input type="checkbox" name="60"><span class="testing" id="1060" name="1060"></span></label>
</div>
<div class="row" id="row21">
  <label class="student"><input type="checkbox" name="61"><span class="testing" id="1061" name="1061"></span></label>
  <label class="student"><input type="checkbox" name="62"><span class="testing" id="1062" name="1062"></span></label>
  <label class="student"><input type="checkbox" name="63"><span class="testing" id="1063" name="1063"></span></label>
</div>
<div class="row" id="row22">
  <label class="student"><input type="checkbox" name="64"><span class="testing" id="1064" name="1064"></span></label>
  <label class="student"><input type="checkbox" name="65"><span class="testing" id="1065" name="1065"></span></label>
  <label class="student"><input type="checkbox" name="66"><span class="testing" id="1066" name="1066"></span></label>
</div>
<div class="row" id="row23">
  <label class="student"><input type="checkbox" name="67"><span class="testing" id="1067" name="1067"></span></label>
  <label class="student"><input type="checkbox" name="68"><span class="testing" id="1068" name="1068"></span></label>
  <label class="student"><input type="checkbox" name="69"><span class="testing" id="1069" name="1069"></span></label>
</div>
<div class="row" id="row24">
  <label class="student"><input type="checkbox" name="70"><span class="testing" id="1070" name="1070"></span></label>
  <label class="student"><input type="checkbox" name="71"><span class="testing" id="1071" name="1071"></span></label>
  <label class="student"><input type="checkbox" name="72"><span class="testing" id="1072" name="1072"></span></label>
</div>
<div class="row" id="row25">
  <label class="student"><input type="checkbox" name="73"><span class="testing" id="1073" name="1073"></span></label>
  <label class="student"><input type="checkbox" name="74"><span class="testing" id="1074" name="1074"></span></label>
  <label class="student"><input type="checkbox" name="75"><span class="testing" id="1075" name="1075"></span></label>
</div>
<div class="row" id="row26">
  <label class="student"><input type="checkbox" name="76"><span class="testing" id="1076" name="1076"></span></label>
  <label class="student"><input type="checkbox" name="77"><span class="testing" id="1077" name="1077"></span></label>
  <label class="student"><input type="checkbox" name="78"><span class="testing" id="1078" name="1078"></span></label>
</div>
<div class="row" id="row27">
  <label class="student"><input type="checkbox" name="79"><span class="testing" id="1079" name="1079"></span></label>
  <label class="student"><input type="checkbox" name="80"><span class="testing" id="1080" name="1080"></span></label>
  <label class="student"><input type="checkbox" name="81"><span class="testing" id="1081" name="1081"></span></label>
</div>
<div class="row" id="row28">
  <label class="student"><input type="checkbox" name="82"><span class="testing" id="1082" name="1082"></span></label>
  <label class="student"><input type="checkbox" name="83"><span class="testing" id="1083" name="1083"></span></label>
  <label class="student"><input type="checkbox" name="84"><span class="testing" id="1084" name="1084"></span></label>
</div>
<div class="row" id="row29">
  <label class="student"><input type="checkbox" name="85"><span class="testing" id="1085" name="1085"></span></label>
  <label class="student"><input type="checkbox" name="86"><span class="testing" id="1086" name="1086"></span></label>
  <label class="student"><input type="checkbox" name="87"><span class="testing" id="1087" name="1087"></span></label>
</div>
<div class="row" id="row30">
  <label class="student"><input type="checkbox" name="88"><span class="testing" id="1088" name="1088"></span></label>
  <label class="student"><input type="checkbox" name="89"><span class="testing" id="1089" name="1089"></span></label>
  <label class="student"><input type="checkbox" name="90"><span class="testing" id="1090" name="1090"></span></label>
</div>
<div class="row" id="row31">
  <label class="student"><input type="checkbox" name="91"><span class="testing" id="1091" name="1091"></span></label>
  <label class="student"><input type="checkbox" name="92"><span class="testing" id="1092" name="1092"></span></label>
  <label class="student"><input type="checkbox" name="93"><span class="testing" id="1093" name="1093"></span></label>
</div>
<div class="row" id="row32">
  <label class="student"><input type="checkbox" name="94"><span class="testing" id="1094" name="1094"></span></label>
  <label class="student"><input type="checkbox" name="95"><span class="testing" id="1095" name="1095"></span></label>
  <label class="student"><input type="checkbox" name="96"><span class="testing" id="1096" name="1096"></span></label>
</div>
<div class="row" id="row33">
  <label class="student"><input type="checkbox" name="97"><span class="testing" id="1097" name="1097"></span></label>
  <label class="student"><input type="checkbox" name="98"><span class="testing" id="1098" name="1098"></span></label>
  <label class="student"><input type="checkbox" name="99"><span class="testing" id="1099" name="1099"></span></label>
</div>
    <%
    session.setAttribute("dept2", dept2);
    session.setAttribute("joining2", joining2);
    String semYears2 = request.getParameter("semYears2");
    int joiningYear2=2526;
    if (semYears2 != null && !semYears2.trim().isEmpty()) {
        joiningYear2 = Integer.parseInt(semYears2.trim());
		PreparedStatement ps=con.prepareStatement("update semester_year set joining_year = ? where department = ?");
		ps.setInt(1, joiningYear2);
		ps.setString(2, dept2.toLowerCase());
		ps.executeUpdate();
		
		PreparedStatement ps1 =con.prepareStatement("SELECT joining_year AS jyear FROM semester_year where department = ?");
        ps1.setString(1, dept2.toLowerCase());
        ResultSet rs1 = ps1.executeQuery();
        if(rs1.next()){
        	joiningYear2 = rs1.getInt("jyear");
        }
        
        String AttendancetableName = "attendance_" + dept2 + "_" + joiningYear2;
        Statement stmt1 = con.createStatement();
        stmt1.executeUpdate("CREATE TABLE " + AttendancetableName + " (" +
            "S_NO NUMBER NOT NULL, " +
            "Class_Date varchar2(20) NOT NULL, " +
            "Status NUMBER(1))");

		
        String Sub_tableName = "classes_" + dept2 + "_" + joiningYear2;
		String createSubTable = "CREATE TABLE " + Sub_tableName + " (" +
				"Subject varchar2(30) NOT NULL, " +
				"Class_Date varchar2(20) NOT NULL, " +
				"class_Status NUMBER(1) )";
		Statement stmt = con.createStatement();
		stmt.executeUpdate(createSubTable);
		out.println("<script>alert('Updated succesfully')</script>");
	}

    PreparedStatement ps1 = con.prepareStatement("select s_name, s_no from student_register_" + dept + "_" + joining2);
    ResultSet rs = ps1.executeQuery();
    int id2 = 1001;
    while (rs.next() && id2 <= 1099) {
        int s_no = rs.getInt("s_no");
        String student_name = rs.getString("s_name");
        String fullLabel = s_no + ". " + student_name;

%>
        <script>
            document.getElementById("<%= id2 %>").innerText = "<%= fullLabel %>";
        </script>
<%
        id2++;
     }
 }
catch(Exception ex)
{
    out.println("<script>alert('error "+ex.getMessage()+"')</script>");
}
%>
      <br><br>
      <center>
         <input style="margin-right: 150px;" type="reset" value="Reset?" class="reset_button"/>
         <input type="submit" value="Submit The Attandance?" class="submit_button"/>
      </center>
    </form>
    <div id="hidden" style="display: none;">
      <center>
      <h3>---Data successfully submitted into Database---</h3><br>
      <a href="home.html" style="text-decoration: none; background-color: gold; padding: 5px 10px; border-radius: 20px;">Return to Home</a>
      <br><br><br><br>
    </center>
    </div>
    <div id="footer">
			<h3 style="margin-right:60px; color:aqua;">Contact us</h3>
			<span class="footerspan">Phone : +91 7013074531</span>&nbsp;&nbsp;<span class="footerspan">attendanceproject1@gmail.com</span class="footerspan">&nbsp;&nbsp;<span class="footerspan">Gvp colllege, Rushikonda</span><br>
			<label style="font-size:12px; margin-top:20px; margin-right:50px; margin-bottom:0px; ">&copy; 2024-2025 GVP All rights reserved.</label>
		</div>
    <script>
      var today = new Date();
      var date= today.getDate();
      var month = today.getMonth()+1;
      var year = today.getFullYear();
      date = (date < 10) ? "0" + date : date;
      month = (month < 10) ? "0" + month : month;
      var fdate = date +'-'+month+'-'+year;
      document.getElementById("todaydate").innerHTML=fdate;
      function check(event){
          var check = document.getElementById("getdate").value;
          if(!check || check.trim()===""){
              alert('please select the date');
              return false;
          }
          document.getElementById("hidden").style.display = "block";
          console.log("Selected Date: ", document.getElementById("getdate").value);
          return true;
      }
      window.onload = function() {
    	    const rows = document.querySelectorAll('div[id^="row"]'); 
    	    rows.forEach(row => {
    	      const span = row.querySelector('span.testing');
    	      if (span && span.textContent.trim() === '') {
    	        row.style.display = 'none';
    	      }
    	    });
    	  };
    	function openF_RegisterModal() {
  			document.getElementById("SemUpdate").style.display = "block";
  		}

  		function closeF_RegisterModal() {
  			document.getElementById("SemUpdate").style.display = "none";
  		}
    </script>

    </body>
</html>