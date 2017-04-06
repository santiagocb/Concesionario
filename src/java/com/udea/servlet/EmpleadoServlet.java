/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udea.servlet;

import com.udea.logica.EmpleadoFacadeLocal;
import com.udea.modelo.Cliente;
import com.udea.modelo.ClientePK;
import com.udea.modelo.Empleado;
import com.udea.logica.VehiculoFacadeLocal;
import com.udea.modelo.Vehiculo;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author santiago
 */
public class EmpleadoServlet extends HttpServlet {

    @EJB
    private EmpleadoFacadeLocal empleadoFacade;

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
        PrintWriter out = response.getWriter();
        try {
            String action = request.getParameter("action");
            String url = "index.jsp";  
            switch(action){
                case "empleado":
                    String u = request.getParameter("username");
                    String p = request.getParameter("password");
                    boolean iniciarSesion = empleadoFacade.checkLogin(u, p);
                    if(iniciarSesion){
                        Empleado emple = empleadoFacade.findbyUP(u, p);
                        request.getSession().setAttribute("emple", emple);                        
                        url = "empleado.jsp";
                    }else{
                        url = "index.jsp?error=1";
                    }   
                    break;
                case "cliente":
                    url = "cliente.jsp";
                    break;
                case "vehiculo":
                    url = "vehiculo.jsp";
                    break;
                case "registrocliente":
                    url = "registrocliente.jsp";
                    break;
                case "registrovehiculo":
                    url = "registrovehiculo.jsp";
                    break;  
                case "cerrarsesion":                    
                    request.getSession().removeAttribute("emple");
                    url="index.jsp";
                    break;
            }      
            response.sendRedirect(url);
        } finally {
            out.close();
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

 

