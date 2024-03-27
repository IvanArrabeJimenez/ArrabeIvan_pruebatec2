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

@WebServlet(name = "ListaSv", urlPatterns = {"/ListaSv"})
public class ListaSv extends HttpServlet {

    Controladora control = new Controladora();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Mandamos la fecha para filtrar la lista
        String fecha = request.getParameter("fecha");
        // Validar los datos
        if (fecha == null || fecha.trim().isEmpty() || fecha.equalsIgnoreCase("")) {
            // Si alguno de los campos está vacío, mostrar un mensaje de error
            response.sendRedirect("error.jsp");
            return;
        }
        LocalDate fechaDate = LocalDate.parse(fecha);
        //Lo mandamos para filtrar la lista
        request.setAttribute("resultadosTurnos", control.traerTurnosFecha(fechaDate));
        //Mandamos los resultados a la tabla que vamos a mostrar
        request.getRequestDispatcher("listar.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //Recogemos el id del turno que vamos a atender      
        String idTurnoString = request.getParameter("idTurno");
        // Validar los datos
        if (idTurnoString == null || idTurnoString.isEmpty() || idTurnoString.equalsIgnoreCase("")) {
            // Si alguno de los campos está vacío, mostrar un mensaje de error
            response.sendRedirect("error.jsp");
            return;
        }
        //Lo convertimos a Long
        Long idTurno = Long.parseLong(idTurnoString);
        //Buscamos el turno a editar en función del id que hemos pedido
        Turno turnoEditar = control.buscarTurno(idTurno);
        //Cambiamos el estado a atendido
        turnoEditar.setEstado("Atendido");
        //Mandamos a editar en la base de datos
        control.editarTurno(turnoEditar);
        response.sendRedirect("index.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
