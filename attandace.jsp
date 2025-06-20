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
			<div id="logo"> <img src="logo.png" height="100" width="120" alt="Page Logo"></div>
			<div><h3 style="font-size: 30px; margin-right: 150px; word-spacing: 10px;">ATTENDANCE MANAGEMENT SYSTEM</h3></div>
			<button onclick="openF_RegisterModal()" type="submit">Semester update??</button>
			<div id="SemUpdate" class="modal">
			 <div class="modal-content">
			 <h3>Semester update</h3>
			  <span class="close" onclick="closeF_RegisterModal()">&times;</span>
			  <center><span style="color:red; font-size:14px;">"If 2025-2026 batch then enter : 2526"</span></center>
			  <form method="post">
				<input type="tel" placeholder="Enter new Joining years" maxlength="4" pattern="{0-9}{4}" id="semYears" name="semYears"/>
			  	<button type="submit">Update</button>
			  </form>
			</div>
		  </div>	
		</div>
    <br>
    <center><h2 style="color:#15467a; text-decoration: underline; font-size: 28px;">MCA Department 2024 - 2026</h2></center>
    <br>
    <center><h2 style="color:red; font-size: 25px; ">Mark the Attendance</h2></center><br>
    <h2 style="margin: 18px 20px 0px 100px; display: inline;">Today Date :</h2><h2 id="todaydate" name="todaydate" style="margin: 0px; padding: opx; display: inline; color: brown;"></h2><br><br>
    <form id="attandance" action="main_attendance.jsp" method="POST" name="attandancemain" onsubmit="return check()">
    <h2 style="display: inline;  margin-left: 100px;">Select Date :</h2><input style="margin-left: 20px; font-size: 17px; color: black; padding: 5px 5px; height: 23px;" placeholder="Format : DD_MM_YYYY" type="text" id="getdatevalue"name="getdatevalue"><br><br>
    <h2 style="display: inline; margin-left: 100px; margin-right: 20px;">Select Subject :</h2>
    <select id="subject" name="subject" style="width: 200px; padding: 5px 5px; font-size: 16px;">
      <option value="" disabled selected hidden>Select Subject</option>
      <option value="FLAT">FLAT</option>
      <option value="Ccomputer Networks">Computer Networks</option>
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
    <center><span style="color:red;">("Press Tab to move for next Roll no. and press SpaceBar to Mark the Checkbox")</span></center><br><br>
    <div class="row">
        <label class="student"><input type="checkbox" name="1" value="1"><span class="number">1.</span> A. Krishna Prabha</label>
        <label class="student"><input type="checkbox" name="2"><span class="number">2.</span> A. Sai Saranya</label>
        <label class="student"><input type="checkbox" name="3"><span class="number">3.</span> B. Harish</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="4"><span class="number">4.</span> B. Ramya</label>
        <label class="student"><input type="checkbox" name="5"><span class="number">5.</span> B. Chakri</label>
        <label class="student"><input type="checkbox" name="6"><span class="number">6.</span> B. Vamsi Krishna</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="7"><span class="number">7.</span> CH. Praveen kumar</label>
        <label class="student"><input type="checkbox" name="8"><span class="number">8.</span> CH. Vinay Kumar</label>
        <label class="student"><input type="checkbox" name="9"><span class="number">9.</span> CH. Vamsi Kiran</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="10"><span class="number">10.</span> CH. Lakshmi</label>
        <label class="student"><input type="checkbox" name="11"><span class="number">11.</span> CH. Sai kiran</label>
        <label class="student"><input type="checkbox" name="12"><span class="number">12.</span> CH. Tejesh</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="13"><span class="number">13.</span> D. Dipak</label>
        <label class="student"><input type="checkbox" name="14"><span class="number">14.</span> D. Devi durga</label>
        <label class="student"><input type="checkbox" name="15"><span class="number">15.</span> D. Gnaneswaari</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="16"><span class="number">16.</span> E. Ram Sai</label>
        <label class="student"><input type="checkbox" name="17"><span class="number">17.</span> E. Sai Kiran</label>
        <label class="student"><input type="checkbox" name="18"><span class="number">18.</span> G. Devika</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="19"><span class="number">19.</span> G. Yaswanth Naidu</label>
        <label class="student"><input type="checkbox" name="20"><span class="number">20.</span> Laavanya</label>
        <label class="student"><input type="checkbox" name="21"><span class="number">21.</span> G. Bharathi</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="22"><span class="number">22.</span> G. Sai Sri</label>
        <label class="student"><input type="checkbox" name="23"><span class="number">23.</span> G. Naga Sri</label>
        <label class="student"><input type="checkbox" name="24"><span class="number">24.</span> G. Sai kiran</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="25"><span class="number">25.</span> G. Ashish</label>
        <label class="student"><input type="checkbox" name="26"><span class="number">26.</span> H. Vanitha</label>
        <label class="student"><input type="checkbox" name="27"><span class="number">27.</span> J. Karthik Patnaik</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="28"><span class="number">28.</span> K. Laasya</label>
        <label class="student"><input type="checkbox" name="29"><span class="number">29.</span> K. Sai Ganesh</label>
        <label class="student"><input type="checkbox" name="30"><span class="number">30.</span> K. Sampath Varma</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="31"><span class="number">31.</span> K. Siva Saketh</label>
        <label class="student"><input type="checkbox" name="32"><span class="number">32.</span> K. Hemanth Kumar</label>
        <label class="student"><input type="checkbox" name="33"><span class="number">33.</span> K. Girish Kumar</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="34"><span class="number">34.</span> K. Jayashree</label>
        <label class="student"><input type="checkbox" name="35"><span class="number">35.</span> K. Pravallika</label>
        <label class="student"><input type="checkbox" name="36"><span class="number">36.</span> L. Venkata Surya</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="37"><span class="number">37.</span> L. Shyam kumar</label>
        <label class="student"><input type="checkbox" name="38"><span class="number">38.</span> M. Surya Vijaya</label>
        <label class="student"><input type="checkbox" name="39"><span class="number">39.</span> S. Mahitha</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="40"><span class="number">40.</span> M. Vamsi Sai Kumar</label>
        <label class="student"><input type="checkbox" name="41"><span class="number">41.</span> M. Seetharama Krishna</label>
        <label class="student"><input type="checkbox" name="42"><span class="number">42.</span> M. Bhanu Vivek</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="43"><span class="number">43.</span> M. Sreema</label>
        <label class="student"><input type="checkbox" name="44"><span class="number">44.</span> P. Bala Prasunna</label>
        <label class="student"><input type="checkbox" name="45"><span class="number">45.</span> P. Gayathri</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="46"><span class="number">46.</span> P. Vyshnavi</label>
        <label class="student"><input type="checkbox" name="47"><span class="number">47.</span> P. Charishma</label>
        <label class="student"><input type="checkbox" name="48"><span class="number">48.</span> P. Yogesh</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="49"><span class="number">49.</span> P. Harshitha</label>
        <label class="student"><input type="checkbox" name="50"><span class="number">50.</span> P. Ajay Raj</label>
        <label class="student"><input type="checkbox" name="51"><span class="number">51.</span> R. Gireesha</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="52"><span class="number">52.</span> R. Prasunna Chandrika</label>
        <label class="student"><input type="checkbox" name="53"><span class="number">53.</span> S. Chandu</label>
        <label class="student"><input type="checkbox" name="54"><span class="number">54.</span> S. Philip</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="55"><span class="number">55.</span> T. Sai Swapna</label>
        <label class="student"><input type="checkbox" name="56"><span class="number">56.</span> T.E. Santhosh</label>
        <label class="student"><input type="checkbox" name="57"><span class="number">57.</span> U. Dushyanth</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="58"><span class="number">58.</span> V. Pavan Kumar</label>
        <label class="student"><input type="checkbox" name="59"><span class="number">59.</span> V. Deekshitha</label>
        <label class="student"><input type="checkbox" name="60"><span class="number">60.</span> Y. Mrunalini</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="61"><span class="number">61.</span> Y. Poorneswar</label>
        <label class="student"><input type="checkbox" name="62"><span class="number">62.</span> Y. Harsha Vardhan</label>
        <label class="student"><input type="checkbox" name="63"><span class="number">63.</span> Y. Usha Sri</label>
      </div>
      <div class="row">
        <label class="student"><input type="checkbox" name="64"><span class="number">64.</span> Y. Lakshmana Reddy</label>
      </div>


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
      function check(){
          var check = document.getElementById("getdate").value;
          if(!check || check.trim()===""){
              alert('please select the date');
              return false;
          }
          return true;
      }
    </script>

    </body>
</html>