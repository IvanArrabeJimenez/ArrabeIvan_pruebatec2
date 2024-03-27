package com.ivanarrabe.pt2turnero.servlets;

import com.ivanarrabe.pt2turnero.logica.Controladora;
import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "FiltroSv", urlPatterns = {"/FiltroSv"})
public class FiltroSv extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Recogemos la fecha y el estado para traer los turnos filtrados
        String fecha = request.getParameter("fecha");
        String estado = request.getParameter("estado");
        // Validar los datos
        if (fecha == null || fecha.trim().isEmpty() || fecha.equalsIgnoreCase("")
                || estado == null || estado.isEmpty() || estado.equalsIgnoreCase("")) {
            // Si alguno de los campos está vacío, mostrar un mensaje de error
            response.sendRedirect("error.jsp");
            return;
        }
        LocalDate fechaDate = LocalDate.parse(fecha);
        //Lo mandamos para filtrar la lista
        request.setAttribute("resultadosTurnosFiltro", control.traerTurnosFechaEstado(fechaDate, estado));
        //Mandamos los datos a la tabla que vamos a mostrar
        request.getRequestDispatcher("filtrar.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
