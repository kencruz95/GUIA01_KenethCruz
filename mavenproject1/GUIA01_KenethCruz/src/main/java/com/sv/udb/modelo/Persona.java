/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sv.udb.modelo;

/**
 *
 * @author aleso
 */
public class Persona {
    private int CodiPers;
    private String NombPers;
    private String ApelPers;
    private String DuiPers;

    public int getCodiPers() {
        return CodiPers;
    }

    public void setCodiPers(int CodiPers) {
        this.CodiPers = CodiPers;
    }

    public String getNombPers() {
        return NombPers;
    }

    public void setNombPers(String NombPers) {
        this.NombPers = NombPers;
    }

    public String getApelPers() {
        return ApelPers;
    }

    public void setApelPers(String ApelPers) {
        this.ApelPers = ApelPers;
    }

    public String getDuiPers() {
        return DuiPers;
    }

    public void setDuiPers(String DuiPers) {
        this.DuiPers = DuiPers;
    }

    
    public Persona() {
    }

    public Persona(int CodiPers, String NombPers, String ApelPers, String DuiPers) {
        this.CodiPers = CodiPers;
        this.NombPers = NombPers;
        this.ApelPers = ApelPers;
        this.DuiPers = DuiPers;
    }

    @Override
    public String toString() {
        return NombPers + " " + ApelPers;
    }
    
}
