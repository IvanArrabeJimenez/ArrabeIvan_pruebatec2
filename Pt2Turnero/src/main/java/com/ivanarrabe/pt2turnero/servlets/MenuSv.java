package com.ivanarrabe.pt2turnero.servlets;

import com.ivanarrabe.pt2turnero.logica.Controladora;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MenuSv", urlPatterns = {"/MenuSv"})
public class MenuSv extends HttpServlet {

    private Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Recogemos la opción de botón pulsada
        String accion = request.getParameter("accion");

        switch (accion) {
            case "agregarTurno":
                // Redirigir a un JSP para agregar un nuevo turno
                request.getRequestDispatcher("agregarTurno.jsp").forward(request, response);
                break;
            case "agregarCiudadano":
                // Redirigir a un JSP para agregar un nuevo ciudadano
                request.getRequestDispatcher("agregarCiudadano.jsp").forward(request, response);
                break;
            case "listar":
                // Redirigir a un JSP para listar/atender turnos
                request.getRequestDispatcher("listar.jsp").forward(request, response);
                break;
            case "filtrar":
                // Redirigir a un JSP para filtrar lista de turnos
                request.getRequestDispatcher("filtrar.jsp").forward(request, response);
                break;
            default:
                // Acción por defecto si no coincide con ninguna acción esperada
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
