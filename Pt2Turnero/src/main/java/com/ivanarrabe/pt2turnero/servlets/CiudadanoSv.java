package com.ivanarrabe.pt2turnero.servlets;

import com.ivanarrabe.pt2turnero.logica.Ciudadano;
import com.ivanarrabe.pt2turnero.logica.Controladora;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CiudadanoSv", urlPatterns = {"/CiudadanoSv"})
public class CiudadanoSv extends HttpServlet {

    private Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Establecer los resultados en la solicitud para que se muestren en el JSP
        request.setAttribute("resultadosCiudadanos", control.traerCiudadanos());

        //Lo mostramos en la misma url de registro de ciudadanos
        request.getRequestDispatcher("agregarCiudadano.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String dni = request.getParameter("dniCiudadano");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");

        // Validar los datos
        if (dni == null || dni.isEmpty() || dni.equalsIgnoreCase("")
                || nombre == null || nombre.isEmpty() || nombre.equalsIgnoreCase("")
                || apellido == null || apellido.isEmpty() || apellido.equalsIgnoreCase("")) {
            // Si alguno de los campos está vacío, mostrar un mensaje de error
            response.sendRedirect("error.jsp");
            return;
        }

        Ciudadano ciudadano = new Ciudadano(dni, nombre, apellido);
        control.crearCiudadano(ciudadano);
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
