
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Online_Election_System;

import DBconnection.SQLconnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JAVA-JP
 */
public class Add_election extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String election_name = request.getParameter("election_name");
            String end_date = request.getParameter("end_date");
           
            
            System.out.println("Election Name :" + election_name +  "End Date"+ end_date);

            Connection conn = SQLconnection.getconnection();
            String message = null;

            try {
                Statement st = conn.createStatement();

                ResultSet rs = st.executeQuery("Select * from add_election where election_name ='" + election_name + "'");
                if (rs.next()) {

                    response.sendRedirect("User_login.jsp?msg=Election_name_Exists");
                } else {

                    String sql = "insert into add_election(election_name, end_date) values (?,?)";
                    PreparedStatement statement = conn.prepareStatement(sql);
                    statement.setString(1, election_name);
                    statement.setString(2, end_date);
                    
                    int row = statement.executeUpdate();
                    if (row > 0) {

                        response.sendRedirect("Add_election.jsp?Election_added");
                    } else {
                        response.sendRedirect("Add_election.jsp?Failed");
                    }
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
