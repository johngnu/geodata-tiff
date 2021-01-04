/*
 * ICG SRL - International Consulting Group 2017
 */
package com.geodata.admin;

import org.springframework.web.multipart.MultipartFile;

/**
 * BaseDatoArchivo, File Entity
 *
 * @author John Castillo
 */
public class BaseDatoArchivo {

    public static String SHAPE = "shape";
    public static String CSV = "csv";
    public static String BASE = "base";
    public static String TIFF = "tiff";

    private Long id;
    private MultipartFile file;
    private String name;
    private String style;
    private String type;
    private String key;
    private Long var;
    private String unidad;
    private String path;
    private String layer;
    private Long mes;    

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public String getRepository() {
        if (type.equals(BASE)) {
            return "base_" + key;
        }
        if (type.equals(CSV)) {
            return "archivo_" + key;
        }
        if (type.equals(SHAPE)) {
            return "capa_adicional";
        }
        if (type.equals(TIFF)) {
            return "clima";
        }
        return path;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public Long getVar() {
        return var;
    }

    public void setVar(Long var) {
        this.var = var;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getUnidad() {
        return unidad;
    }

    public void setUnidad(String unidad) {
        this.unidad = unidad;
    }

    public String getLayer() {
        return layer;
    }

    public void setLayer(String layer) {
        this.layer = layer;
    }

    public Long getMes() {
        return mes;
    }

    public void setMes(Long mes) {
        this.mes = mes;
    }
    
}
