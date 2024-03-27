package com.ivanarrabe.pt2turnero.logica;

import java.io.Serializable;
import java.time.LocalDate;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Turno implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private LocalDate fecha;
    private String tramite;
    private String estado;

    @OneToOne
    private Ciudadano ciudadano;

    public Turno() {
    }

    public Turno(LocalDate fecha, String tramite, Ciudadano ciudadano) {
        this.fecha = fecha;
        this.tramite = tramite;
        this.estado = "En espera";
        this.ciudadano = ciudadano;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDate getFecha() {
        return fecha;
    }

    public void setFecha(LocalDate fecha) {
        this.fecha = fecha;
    }

    public String getTramite() {
        return tramite;
    }

    public void setTramite(String tramite) {
        this.tramite = tramite;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Ciudadano getCiudadano() {
        return ciudadano;
    }

    public void setCiudadano(Ciudadano ciudadano) {
        this.ciudadano = ciudadano;
    }

}
