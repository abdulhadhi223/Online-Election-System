
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Online_Election_System;

import DBconnection.SQLconnection;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author JAVA-JP
 */
@WebServlet("/add_candidate")
@MultipartConfig(maxFileSize = 16177215)
public class Add_candidate extends HttpServlet {

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
            String candidate_name = request.getParameter("candidate_name");
            String party_name = request.getParameter("party_name");
            String address = request.getParameter("address");
            String phone = request.getParameter("phone");

            InputStream fis = null;
            Part filePart = request.getPart("photo");

            if (filePart != null) {
                // prints out some information for debugging
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());

                // obtains input stream of the upload file
                fis = filePart.getInputStream();
            }

            System.out.println("Election Name :" + election_name + "Candidate name :" + candidate_name + "Address :" + address + "Phone No :" + phone);

            Connection conn = SQLconnection.getconnection();
            String message = null;

            try {
                Statement st = conn.createStatement();

                String sql = "insert into add_candidate(election_name, candidate_name, address, phone, photo, party_name) values (?, ?, ?, ?, ?, ?)";
                PreparedStatement statement = conn.prepareStatement(sql);
                statement.setString(1, election_name);
                statement.setString(2, candidate_name);
                statement.setString(3, address);
                statement.setString(4, phone);
                if (fis != null) {
                    statement.setBlob(5, fis);
                }
                statement.setString(6, party_name);

                int row = statement.executeUpdate();
                if (row > 0) {

                    response.sendRedirect("Add_candidate.jsp?Candidate_added");
                } else {
                    response.sendRedirect("Add_candidate.jsp?Failed");
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
