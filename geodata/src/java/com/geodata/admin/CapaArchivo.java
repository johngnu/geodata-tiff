/*
 * ICG SRL - International Consulting Group 2017
 */
package com.geodata.admin;

import org.springframework.web.multipart.MultipartFile;

/**
 * CapaArchivo, File Entity
 *
 * @author John Castillo
 */
public class CapaArchivo {

    public static String SHAPE = "shape";
    public static String CSV = "csv";
    public static String BASE = "base";
    public static String TIFF = "tiff";

    private Long id;
    private MultipartFile file;
    private String name;
    private String style;
    private String type;
    private String path;
    private String layer;

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

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getLayer() {
        return layer;
    }

    public void setLayer(String layer) {
        this.layer = layer;
    }

}
