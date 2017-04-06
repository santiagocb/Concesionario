/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udea.servlet;

import com.udea.logica.ClienteFacadeLocal;
import com.udea.logica.EmpleadoFacadeLocal;
import com.udea.logica.VehiculoFacadeLocal;
import com.udea.logica.VentaFacadeLocal;
import com.udea.modelo.Cliente;
import com.udea.modelo.ClientePK;
import com.udea.modelo.Empleado;
import com.udea.modelo.Vehiculo;
import com.udea.modelo.Venta;
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
public class VentaServlet extends HttpServlet {


    @EJB
    private ClienteFacadeLocal clienteFacade;

    @EJB
    private VehiculoFacadeLocal vehiculoFacade;

    @EJB
    private VentaFacadeLocal ventaFacade;
    
    
    
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
                case "venta":
                    url = "venta.jsp";
                    break;
                case "formventa":
                    String placa = request.getParameter("placa");
                    String id_cliente = request.getParameter("id_cliente");
                    String tipo_id_cliente = request.getParameter("tipo_id_cliente");
                    Empleado em = (Empleado)request.getSession().getAttribute("emple");
                    Cliente cliente = clienteFacade.find(new ClientePK(id_cliente, tipo_id_cliente));
                    if(cliente == null){
                        url = "registrocliente.jsp?valido=2";
                    }else{
                        String fecha = request.getParameter("fecha");
                        boolean nuevo = Boolean.parseBoolean(request.getParameter("nuevo"));
                        Venta venta = new Venta();
                        venta.setFecha(fecha);
                        venta.setNuevo(nuevo);

                        venta.setCliente(cliente);
                        Vehiculo veh = vehiculoFacade.find(placa);
                        venta.setIdVehiculo(veh);
                        venta.setIdEmpleado(em);
                        ventaFacade.create(venta);
                        url = "registroventa.jsp?valido=1";
                    }         
                    break;   
                case "historial":
                    List<Venta> listaVenta = ventaFacade.findAll();
                    request.getSession().setAttribute("ventas", listaVenta);
                    url = "historial.jsp";
                    break;
                case "eliminarventa":
                    String codigo = request.getParameter("codigo");
                    Venta v = ventaFacade.find(Integer.valueOf(codigo));
                    ventaFacade.remove(v);
                    url = "VentaServlet?action=historial";
                    break;                    
                case "registroventa":
                    List<Vehiculo> listaVeh = vehiculoFacade.findAll();
                    request.getSession().setAttribute("listaVeh", listaVeh);
                    url = "registroventa.jsp";
                    break;
            }
            response.sendRedirect(url);

        }finally{
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
