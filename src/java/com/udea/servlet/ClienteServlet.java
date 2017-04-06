/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udea.servlet;

import com.udea.logica.ClienteFacadeLocal;
import com.udea.modelo.Cliente;
import com.udea.modelo.ClientePK;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author santiago
 */
public class ClienteServlet extends HttpServlet {

    @EJB
    private ClienteFacadeLocal clienteFacade;

    
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
                case "formcliente":
                    String id_cliente = request.getParameter("id_cliente");
                    String tipo_id_cliente = request.getParameter("tipo_id_cliente");
                    Cliente c = clienteFacade.find(new ClientePK(id_cliente, tipo_id_cliente));
                    if(c == null){                        
                        Cliente cliente = new Cliente(id_cliente, tipo_id_cliente);
                        cliente.setNombre(request.getParameter("nombre_cliente"));
                        cliente.setDireccion(request.getParameter("direccion_cliente"));
                        cliente.setTelefono(request.getParameter("telefono_cliente"));
                        cliente.setEmail(request.getParameter("email_cliente"));
                        clienteFacade.create(cliente);
                        url = "registrocliente.jsp?valido=1";
                    }else{
                        url = "registrocliente.jsp?error=1";
                    }
                    break;
                case "buscarcliente":                    
                    List<Cliente> findAll = clienteFacade.findAll();
                    request.getSession().setAttribute("clientes",findAll);
                    url="buscarcliente.jsp";
                    break;
                case "actualizarcliente":
                    String id = request.getParameter("id");
                    String tipo_id = request.getParameter("tipoid");
                    Cliente client = clienteFacade.find(new ClientePK(id, tipo_id));
                    request.getSession().setAttribute("client", client);
                    url = "actualizarcliente.jsp";                    
                    break;
                case "formactualizarcliente":
                    String nombre = request.getParameter("nombre_cliente");
                    String direccion = request.getParameter("direccion_cliente");
                    String telefono = request.getParameter("telefono_cliente");
                    String email = request.getParameter("email_cliente");
                    
                    //if(c == null){                        
                        Cliente cliente = (Cliente) request.getSession().getAttribute("client");
                        cliente.setNombre(nombre);
                        cliente.setDireccion(direccion);
                        cliente.setTelefono(telefono);
                        cliente.setEmail(email);
                        clienteFacade.edit(cliente);
                        url = "actualizarcliente.jsp?valido=1";
                   //}else{
                   //     url = "empleado.jsp?error=1";
                   // }
                    break;
                case "buscar":
                    String idCliente = request.getParameter("id_cliente");
                    String tipoCliente = request.getParameter("tipo_id_cliente");
                    Cliente clien = clienteFacade.find(new ClientePK(idCliente, tipoCliente));
                    if(clien != null){
                        request.getSession().setAttribute("clien", clien);
                        url = "buscar.jsp";
                    }else{
                        url = "buscarcliente.jsp?error=1";
                    }
                    
                    break;
            }
            response.sendRedirect(url);
        }finally {
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
