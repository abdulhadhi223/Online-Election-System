<%-- 
    Document   : vote
    Created on : 17 Mar, 2021, 11:07:30 AM
    Author     : JAVA-JP
--%>

<%-- 
    Document   : DO_login
    Created on : 9 Mar, 2021, 5:34:14 PM
    Author     : JAVA-JP
--%>

<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String cid = request.getParameter("cid");
    
    String uid = (String)session.getAttribute("uid");
    String uname = (String)session.getAttribute("uname");
    String umail = (String)session.getAttribute("umail");
    System.out.println(" \n candidate id :" + cid + "\n user id:" +uid);
    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    Statement st1 = con.createStatement();
    try {
        ResultSet rs = st.executeQuery("Select * from add_candidate where id ='" + cid + "' ");
        if (rs.next()) {
            String election_name = rs.getString("election_name");
            String candidate_name = rs.getString("candidate_name");
            
            DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            Date date = new Date();
            String time = dateFormat.format(date);
            System.out.println("Date and Time : " + time);
            int i = st1.executeUpdate("INSERT into vote(election_name, cid, candidate_name, uname, uid, time, status) values('" + election_name + "','" + cid + "','" + candidate_name + "','" + uname + "','" + uid + "','" + time + "', '1')");
            if (i != 0) {
                response.sendRedirect("Elections.jsp?voted_successfully");
            }
        } else {
            response.sendRedirect("Elections.jsp?failed");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>

