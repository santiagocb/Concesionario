/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udea.servlet;

import com.udea.logica.VehiculoFacadeLocal;
import com.udea.modelo.Cliente;
import com.udea.modelo.Vehiculo;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;

/**
 *
 * @author santiago
 */
public class VehiculoServlet extends HttpServlet {

    @EJB
    private VehiculoFacadeLocal vehiculoFacade;

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
            throws ServletException, IOException, FileUploadException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String action = request.getParameter("action");
            String url = "index.jsp";
            switch (action) {
                case "formvehiculo":
                    ServletFileUpload fileUpload = new ServletFileUpload();
                    FileItemIterator items = fileUpload.getItemIterator(request);
                    int count = 0;
                    String plac = request.getParameter("placa");
                    Vehiculo vehiculo = null;
                    while (items.hasNext()) {
                        FileItemStream item = items.next();
                        String name = item.getFieldName();
                        InputStream stream = item.openStream();
                        if (item.isFormField()) {
                            // Process regular form field (input type="text|radio|checkbox|etc", select, etc).
                            String fieldvalue = Streams.asString(stream);
                            System.out.println("Form field " + name + " with value "
                                + fieldvalue + " detected. count " + count);
                            switch (count) {
                                case 0:
                                    vehiculo = vehiculoFacade.find(fieldvalue);
                                    if (vehiculo != null) {
                                        url = "registrovehiculo.jsp?error=1";
                                        response.sendRedirect(url);
                                        return;
                                    } else {
                                        vehiculo = new Vehiculo();
                                        vehiculo.setPlaca(fieldvalue);
                                    }
                                    count++;
                                    break;
                                case 1:
                                    vehiculo.setMarca(fieldvalue);
                                    count++;
                                    break;
                                case 2:
                                    vehiculo.setReferencia(fieldvalue);
                                    count++;
                                    break;
                                case 3:
                                    vehiculo.setModelo(fieldvalue);
                                    count++;
                                    break;
                                case 4:
                                    vehiculo.setColor(fieldvalue);
                                    count++;
                                    break;
                                case 5:
                                    vehiculo.setPrecio(Integer.parseInt(fieldvalue));
                                    count++;
                                    break;
                            }
                        } else {                            
                            String fieldname = item.getFieldName();
                            String filename = FilenameUtils.getName(item.getName());
                            InputStream filecontent = item.openStream();
                            vehiculo.setImagen(IOUtils.toByteArray(filecontent));
                            System.out.println("File field " + name + " with file name "
                                + item.getName() + " detected. count " + filecontent);
                        }
                    }
                    vehiculoFacade.create(vehiculo);
                    url = "registrovehiculo.jsp?valido=1";
                    break;
                case "buscarvehiculo":
                    List<Vehiculo> findAll = vehiculoFacade.findAll();
                    request.getSession().setAttribute("vehiculos", findAll);
                    url = "buscarvehiculo.jsp";
                    break;
                case "buscar":
                    String placa = request.getParameter("placa");
                    Vehiculo veh = vehiculoFacade.find(placa);
                    if (veh != null) {
                        request.getSession().setAttribute("veh", veh);
                        url = "buscarveh.jsp";
                    } else {
                        url = "buscarvehiculo.jsp?error=1";
                    }
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
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            Logger.getLogger(VehiculoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            Logger.getLogger(VehiculoServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
