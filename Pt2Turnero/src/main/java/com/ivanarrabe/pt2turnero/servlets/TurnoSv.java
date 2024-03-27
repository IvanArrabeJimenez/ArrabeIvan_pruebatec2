package com.ivanarrabe.pt2turnero.servlets;

import com.ivanarrabe.pt2turnero.logica.Controladora;
import com.ivanarrabe.pt2turnero.logica.Turno;
import java.io.IOException;
import java.time.LocalDate;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "TurnoSv", urlPatterns = {"/TurnoSv"})
public class TurnoSv extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Obtenemos el ciudadano al que vamos a asignar el turno
        String ciudadano = request.getParameter("idCiudadano");
        //Para obtener la fecha en formato localdate
        String fecha = request.getParameter("fecha");

        String descripcion = request.getParameter("descripcion");

        // Validar los datos
        if (ciudadano == null || ciudadano.isEmpty() || ciudadano.equalsIgnoreCase("")
                || fecha == null || fecha.trim().isEmpty() || fecha.equalsIgnoreCase("")
                || descripcion == null || descripcion.isEmpty() || descripcion.equalsIgnoreCase("")) {
            // Si alguno de los campos está vacío, mostrar un mensaje de error
            response.sendRedirect("error.jsp");
            return;
        }
        LocalDate fechaDate = LocalDate.parse(fecha);
        //Creamos el turno
        Turno turno = new Turno();
        turno.setFecha(fechaDate);
        turno.setTramite(descripcion);
        turno.setEstado("En espera");

        //Mandamos los datos
        control.crearTurno(turno, Long.parseLong(ciudadano));

        //Redirigimos al index
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
