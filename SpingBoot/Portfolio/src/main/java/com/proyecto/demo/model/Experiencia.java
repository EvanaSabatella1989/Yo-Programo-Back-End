
package com.proyecto.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Experiencia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String nombreE;
    private String dscripcionE;
    private String imgE;

    public Experiencia() {
    }

    public Experiencia(String nombreE, String dscripcionE, String imgE) {
        this.nombreE = nombreE;
        this.dscripcionE = dscripcionE;
        this.imgE = imgE;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombreE() {
        return nombreE;
    }

    public void setNombreE(String nombreE) {
        this.nombreE = nombreE;
    }

    public String getDscripcionE() {
        return dscripcionE;
    }

    public void setDscripcionE(String dscripcionE) {
        this.dscripcionE = dscripcionE;
    }

    public String getImgE() {
        return imgE;
    }

    public void setImgE(String imgE) {
        this.imgE = imgE;
    }
    
    
    
    
}
