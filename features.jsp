<%@ page import="java.sql.*" contentType="text/html" language="java" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Attendance Management System</title>
        <link rel="icon" href="collegelogo.png" type="image">
        <meta charset="ISO-8859-1">
    </head>
    <body>
<%
try {
    String Fid, Fid2, update,update2, dept, year;
    dept=request.getParameter("fdepartment");
    year=request.getParameter("Jyear");
    Fid=request.getParameter("FchangeID");
    Fid2=request.getParameter("FchangeID2");
    update=request.getParameter("FchangePass");
    update2=request.getParameter("fdepartmentChange");
    Class.forName("oracle.jdbc.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","AP","chandukittu");
    Statement stmt = con.createStatement();
    if(dept!=null && year!=null) {
    	String tableName = "student_register_" + dept + "_" + year;
        String sequenceName = "seq_" + dept + "_" + year;
        String triggerName = "trg_" + dept + "_" + year;

        String createTable = "CREATE TABLE " + tableName + " (" +
                             "S_NO NUMBER Unique NOT NULL, " +
                             "S_NAME VARCHAR2(30) NOT NULL, " +
                             "S_ID VARCHAR2(13) PRIMARY KEY, " +
                             "S_MAIL VARCHAR2(40) Unique, " +
                             "S_PHONE VARCHAR2(15) not null, " +
                             "S_DEPARTMENT VARCHAR2(30) )";

        String createSequence = "CREATE SEQUENCE " + sequenceName + 
                                " START WITH 1 INCREMENT BY 1";

        String createTrigger = "CREATE OR REPLACE TRIGGER " + triggerName + 
                               " BEFORE INSERT ON " + tableName + 
                               " FOR EACH ROW " +
                               " BEGIN " +
                               " SELECT " + sequenceName + ".NEXTVAL INTO :NEW.S_NO FROM dual; " +
                               " END;";

        stmt.executeUpdate(createTable);
        stmt.executeUpdate(createSequence);
        stmt.executeUpdate(createTrigger);
        out.println("<script>alert('Table created..!'); window.location.href='admin.html';</script>");
    }
    
    
    if(update!=null && Fid != null) {
    	PreparedStatement ps1 = con.prepareStatement("UPDATE faculty_register_table SET password=? WHERE id=?");
        ps1.setString(1,update);
        ps1.setString(2,Fid);
        int n = ps1.executeUpdate();
        if(n>=1){
            out.println("<script>alert('Password Changed..!'); window.location.href='admin.html';</script>");
        }
        else{
            out.println("<script>alert('registration failed')</script>");
        }
    }
    
    
    if(update2!=null && Fid2 != null) {
    	PreparedStatement ps1 = con.prepareStatement("UPDATE faculty_register_table SET department=? WHERE id=?");
        ps1.setString(1,update2);
        ps1.setString(2,Fid2);
        int n = ps1.executeUpdate();
        if(n>=1){
            out.println("<script>alert('Department Updated..!'); window.location.href='admin.html';</script>");
        }
        else{
            out.println("<script>alert('registration failed')</script>");
        }
    }
    
    con.close();
}
catch(Exception ex){
    out.println("<script>alert('Error at :"+ex.getMessage()+"')</script>");
}
%> 
    </body>
</html>