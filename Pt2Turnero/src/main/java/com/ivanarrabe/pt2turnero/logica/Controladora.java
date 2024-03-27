package com.ivanarrabe.pt2turnero.logica;

import com.ivanarrabe.pt2turnero.persistencia.ControladoraPersistencia;
import java.time.LocalDate;
import java.util.List;

public class Controladora {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    public void crearCiudadano(Ciudadano ciudadano) {
        controlPersis.crearCiudadano(ciudadano);
    }

    public List<Ciudadano> traerCiudadanos() {
        return controlPersis.traerCiudadanos();
    }

    public void crearTurno(Turno turno, Long idCiudadano) {
        //Buscamos el ciudadano por su id
        Ciudadano ciudadano = controlPersis.buscarCiudadano(idCiudadano);
        //Asignamos el ciudadano al turno
        turno.setCiudadano(ciudadano);

        //Creamos el turno
        controlPersis.crearTurno(turno);
    }

    public Turno buscarTurno(Long idTurno) {
        return controlPersis.buscarTurno(idTurno);
    }

    public void editarTurno(Turno turnoEditar) {
        controlPersis.editarTurno(turnoEditar);
    }

    public List<Turno> traerTurnosFecha(LocalDate fechaDate) {
        return controlPersis.traerTurnosFecha(fechaDate);
    }

    public List<Turno> traerTurnosFechaEstado(LocalDate fechaDate, String estado) {
        return controlPersis.traerTurnosFechaEstado(fechaDate, estado);
    }

}
