<%-- 
    Document   : set_attribute
    Created on : Sep 29, 2020, 2:15:45 PM
    Author     : Lenovo
--%>

<%@page import="Online_Election_System.Mail"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String mail = request.getParameter("email");

    Connection con = null;
    Statement st = null;
    Statement st1 = null;
    Connection conn = SQLconnection.getconnection();
    Statement sto = conn.createStatement();
    st = conn.createStatement();

    try {
        int i = sto.executeUpdate("UPDATE user_reg SET status='Approved' WHERE id='" + id + "' ");
        System.out.println("Test print User ID ==" + id);
        if (i != 0) {
            ResultSet rs = st.executeQuery(" SELECT * from user_reg where id = '" + id + "' ");
            if (rs.next()) {
                String voterid = rs.getString("id");
                String msggg = "Online Election System Registration is Approved \nYour Voter ID is " + voterid;
                Mail ma = new Mail();
                ma.secretMail(msggg, "Registration_Approved", mail);
                String msg = "Account Activated:" + msggg;
                System.out.println("success");
                System.out.println("success");
                response.sendRedirect("View_voters.jsp?Approved");
            } else {

                System.out.println("failed");
                response.sendRedirect("View_voters.jsp?Failed");
            }
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
