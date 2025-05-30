<%@ page import="java.sql.*" contentType="text/html" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Attendance Management System</title>
    <link href="collegelogo.png" type="image" rel="icon">
</head>
<body>
    <%
        try {
            String date = request.getParameter("getdatevalue");
            
            
            String sub1 = request.getParameter("subject1sem");
            String sub2 = request.getParameter("subject2sem");
            String sub3 = request.getParameter("subject3sem");
            String sub4 = request.getParameter("subject4sem");
            
            if (date == null ||date.trim().isEmpty()) {
                out.println("<script>alert('Error: Date is missing!')</script>");
                return;
            }
            Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "AP", "chandukittu");
            PreparedStatement ps=null;
            PreparedStatement ps1=null;
            PreparedStatement Psub=null;
            ResultSet rs=null;
            
            
            Object deptAttr1 = session.getAttribute("dept1");
            String department1 = deptAttr1 != null ? deptAttr1.toString().toLowerCase() : null;

            Object joinAttr1 = session.getAttribute("joining1");
            String joining1 = joinAttr1 != null ? joinAttr1.toString() : null;

            Object deptAttr2 = session.getAttribute("dept2");
            String department2 = deptAttr2 != null ? deptAttr2.toString().toLowerCase() : null;

            Object joinAttr2 = session.getAttribute("joining2");
            String joining2 = joinAttr2 != null ? joinAttr2.toString() : null;

            Object deptAttr3 = session.getAttribute("dept3");
            String department3 = deptAttr3 != null ? deptAttr3.toString().toLowerCase() : null;

            Object joinAttr3 = session.getAttribute("joining3");
            String joining3 = joinAttr3 != null ? joinAttr3.toString() : null;
            
            Object deptAttr4 = session.getAttribute("dept4");
            String department4 = deptAttr4 != null ? deptAttr4.toString().toLowerCase() : null;

            Object joinAttr4 = session.getAttribute("joining4");
            String joining4 = joinAttr4 != null ? joinAttr4.toString() : null;
            

            if (department1!=null && sub1!=null){
            	ps = con.prepareStatement("insert into attendance_"+ department1+"_"+ joining1 +" values(?,?,?)");
            	ps1 = con.prepareStatement("SELECT COUNT(*) AS total FROM student_register_mca_"+joining1);
            	rs = ps1.executeQuery();
            	int count = 0;
            	if(rs.next()){
            		count = rs.getInt("total");
            	}
            	
            	int k = 0;
                for (int i = 1; i <= count; i++) {
                	if(sub1 != null && (
                			   sub1.equalsIgnoreCase("OS Lab") || 
                			   sub1.equalsIgnoreCase("CO Lab") || 
                			   sub1.equalsIgnoreCase("DS Lab"))
                	){
                    	for(int j=1; j<=3; j++){
                        	String checkboxValue = request.getParameter(String.valueOf(i));
                        	int attendance = (checkboxValue != null) ? 1 : 0;
                        	ps.setInt(1, i);
                        	ps.setString(2, date);
                        	ps.setInt(3, attendance);
                        	k += ps.executeUpdate();
                    	}
                    }
                    else {
                        String checkboxValue = request.getParameter(String.valueOf(i));
                        int attendance = (checkboxValue != null) ? 1 : 0;
                        ps.setInt(1, i);
                        ps.setString(2, date);
                        ps.setInt(3, attendance);
                        k += ps.executeUpdate();
                    }
                }
                

            	Psub = con.prepareStatement("INSERT INTO classes_"+ department1 +"_"+ joining1 +" VALUES (?, ?, 1)");
            	Psub.setString(1, sub1);
            	Psub.setString(2, date);
            	Psub.executeUpdate();
            	
            	
                if (k > 0) {
                	out.println("<script>alert('Attendance submitted successfully!'); window.location.href='index.html';</script>");
                } else {
                    out.println("<script>alert('Failed to update attendance')</script>");
                }
            }            
            
            
                
                
            if (department2!=null && sub2!=null){
            	ps = con.prepareStatement("insert into attendance_"+ department2+"_"+ joining2 +" values(?,?,?)");
            	ps1 = con.prepareStatement("SELECT COUNT(*) AS total FROM student_register_mca_"+joining2);
            	rs = ps1.executeQuery();
            	int count = 0;
            	if(rs.next()){
            		count = rs.getInt("total");
            	}
            	
            	int k = 0;
                for (int i = 1; i <= count; i++) {
                	if(sub2 != null && (
                			   sub2.equalsIgnoreCase("CN Lab") || 
                			   sub2.equalsIgnoreCase("DBMS Lab") || 
                			   sub2.equalsIgnoreCase("WP Lab"))
                	){
                    	for(int j=1; j<=3; j++){
                        	String checkboxValue = request.getParameter(String.valueOf(i));
                        	int attendance = (checkboxValue != null) ? 1 : 0;
                        	ps.setInt(1, i);
                        	ps.setString(2, date);
                        	ps.setInt(3, attendance);
                        	k += ps.executeUpdate();
                    	}
                    }
                    else {
                        String checkboxValue = request.getParameter(String.valueOf(i));
                        int attendance = (checkboxValue != null) ? 1 : 0;
                        ps.setInt(1, i);
                        ps.setString(2, date);
                        ps.setInt(3, attendance);
                        k += ps.executeUpdate();
                    }
                }

            	Psub = con.prepareStatement("INSERT INTO classes_"+ department2 +"_"+ joining2 +" VALUES (?, ?, 1)");
            	Psub.setString(1, sub2);
            	Psub.setString(2, date);
            	Psub.executeUpdate();
                
                if (k > 0) {
                	out.println("<script>alert('Attendance submitted successfully!'); window.location.href='index.html';</script>");
                } else {
                    out.println("<script>alert('Failed to update attendance')</script>");
                }
            }
                
                
                
                if (department3!=null && sub3!=null){
                	ps = con.prepareStatement("insert into attendance_"+ department3+"_"+ joining3 +" values(?,?,?)");
                	ps1 = con.prepareStatement("SELECT COUNT(*) AS total FROM student_register_mca_"+joining3);
                	rs = ps1.executeQuery();
                	int count = 0;
                	if(rs.next()){
                		count = rs.getInt("total");
                	}
                	
                	int k = 0;
                    for (int i = 1; i <= count; i++) {
                    	if(sub3 != null && (
                    			   sub3.equalsIgnoreCase("dont know lab") || 
                    			   sub3.equalsIgnoreCase("dont know lab") || 
                    			   sub3.equalsIgnoreCase("dont know Lab"))
                    	){
                        	for(int j=1; j<=3; j++){
                            	String checkboxValue = request.getParameter(String.valueOf(i));
                            	int attendance = (checkboxValue != null) ? 1 : 0;
                            	ps.setInt(1, i);
                            	ps.setString(2, date);
                            	ps.setInt(3, attendance);
                            	k += ps.executeUpdate();
                        	}
                        }
                        else {
                            String checkboxValue = request.getParameter(String.valueOf(i));
                            int attendance = (checkboxValue != null) ? 1 : 0;
                            ps.setInt(1, i);
                            ps.setString(2, date);
                            ps.setInt(3, attendance);
                            k += ps.executeUpdate();
                        }
                    }
                    

                	Psub = con.prepareStatement("INSERT INTO classes_"+ department3 +"_"+ joining3 +" VALUES (?, ?, 1)");
                	Psub.setString(1, sub3);
                	Psub.setString(2, date);
                	Psub.executeUpdate();
                	
                    
                    if (k > 0) {
                    	out.println("<script>alert('Attendance submitted successfully!'); window.location.href='index.html';</script>");
                    } else {
                        out.println("<script>alert('Failed to update attendance')</script>");
                    }
                }
                    
                    
                

                    if (department4!=null && sub4!=null){
                    	ps = con.prepareStatement("insert into attendance_"+ department4+"_"+ joining4 +" values(?,?,?)");
                    	ps1 = con.prepareStatement("SELECT COUNT(*) AS total FROM student_register_mca_"+joining4);
                    	rs = ps1.executeQuery();
                    	int count = 0;
                    	if(rs.next()){
                    		count = rs.getInt("total");
                    	}
                    	
                    	int k = 0;
                        for (int i = 1; i <= count; i++) {
                        	if(sub4 != null && 
                        			   sub4.equalsIgnoreCase("dont know Lab")
                        			   
                        	){
                            	for(int j=1; j<=3; j++){
                                	String checkboxValue = request.getParameter(String.valueOf(i));
                                	int attendance = (checkboxValue != null) ? 1 : 0;
                                	ps.setInt(1, i);
                                	ps.setString(2, date);
                                	ps.setInt(3, attendance);
                                	k += ps.executeUpdate();
                            	}
                            }
                            else {
                                String checkboxValue = request.getParameter(String.valueOf(i));
                                int attendance = (checkboxValue != null) ? 1 : 0;
                                ps.setInt(1, i);
                                ps.setString(2, date);
                                ps.setInt(3, attendance);
                                k += ps.executeUpdate();
                            }
                        }
                        

                    	Psub = con.prepareStatement("INSERT INTO classes_"+ department4 +"_"+ joining4 +" VALUES (?, ?, 1)");
                    	Psub.setString(1, sub4);
                    	Psub.setString(2, date);
                    	Psub.executeUpdate();
                    	
                        
                        if (k > 0) {
                        	out.println("<script>alert('Attendance submitted successfully!'); window.location.href='index.html';</script>");
                        } else {
                            out.println("<script>alert('Failed to update attendance')</script>");
                        }
                    }
                    con.close();
            		ps.close();
            		ps1.close();
            		Psub.close();
            		rs.close();
            		
     } 
    
    catch(Exception ex) {
    		ex.printStackTrace();
            out.println("<script>alert('Error: " + ex.getMessage() + "')</script>");
        }
    %>
</body>
</html>