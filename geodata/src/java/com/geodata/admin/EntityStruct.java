/*
 * ICG SRL - International Consulting Group 2017
 */
package com.geodata.admin;

/**
 *
 * @author John
 */
public class EntityStruct {

    private Long id;
    private Long reporte;
    private Long base_dato;
    private Long variable;
    private Integer gestion;
    private Integer mes;
    private Double dato;
    private String codigo;
    private Long archivo;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getReporte() {
        return reporte;
    }

    public void setReporte(Long reporte) {
        this.reporte = reporte;
    }

    public Long getBase_dato() {
        return base_dato;
    }

    public void setBase_dato(Long base_dato) {
        this.base_dato = base_dato;
    }

    public Long getVariable() {
        return variable;
    }

    public void setVariable(Long variable) {
        this.variable = variable;
    }

    public Integer getGestion() {
        return gestion;
    }

    public void setGestion(Integer gestion) {
        this.gestion = gestion;
    }

    public Integer getMes() {
        return mes;
    }

    public void setMes(Integer mes) {
        this.mes = mes;
    }

    public Double getDato() {
        return dato;
    }

    public void setDato(Double dato) {
        this.dato = dato;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Long getArchivo() {
        return archivo;
    }

    public void setArchivo(Long archivo) {
        this.archivo = archivo;
    }

}
