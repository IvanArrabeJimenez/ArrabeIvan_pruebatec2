package com.ivanarrabe.pt2turnero.persistencia;

import com.ivanarrabe.pt2turnero.logica.Ciudadano;
import com.ivanarrabe.pt2turnero.logica.Turno;
import java.time.LocalDate;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistencia {

    CiudadanoJpaController ciudadanoJpa = new CiudadanoJpaController();
    TurnoJpaController turnoJpa = new TurnoJpaController();

    public void crearCiudadano(Ciudadano ciudadano) {
        ciudadanoJpa.create(ciudadano);
    }

    public List<Ciudadano> traerCiudadanos() {
        return ciudadanoJpa.findCiudadanoEntities();
    }

    public Ciudadano buscarCiudadano(Long idCiudadano) {
        return ciudadanoJpa.findCiudadano(idCiudadano);
    }

    public void crearTurno(Turno turno) {
        turnoJpa.create(turno);
    }

    public Turno buscarTurno(Long idTurno) {
        return turnoJpa.findTurno(idTurno);
    }

    public void editarTurno(Turno turnoEditar) {
        try {
            turnoJpa.edit(turnoEditar);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Turno> traerTurnosFecha(LocalDate fechaDate) {
        return turnoJpa.traerTurnosFecha(fechaDate);
    }

    public List<Turno> traerTurnosFechaEstado(LocalDate fechaDate, String estado) {
        return turnoJpa.traerTurnosFechaEstado(fechaDate, estado);
    }

}
