/*
 * ICG SRL - International Consulting Group 2017
 */
package com.geodata.admin;

import org.springframework.web.multipart.MultipartFile;

/**
 * BaseDato
 *
 * @author Johns Castillo Valencia email: john.gnu@gmail.com
 * @since 05-11-2017
 */
public class BaseDato {

    private Long id;
    private String nombre;
    private String etiqueta_geovisor;
    private String descripcion;
    private MultipartFile attached;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getEtiqueta_geovisor() {
        return etiqueta_geovisor;
    }

    public void setEtiqueta_geovisor(String etiqueta_geovisor) {
        this.etiqueta_geovisor = etiqueta_geovisor;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public MultipartFile getAttached() {
        return attached;
    }

    public void setAttached(MultipartFile attached) {
        this.attached = attached;
    }

}
