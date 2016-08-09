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
public class Unidad {
    private int CodiUnid;
    private String NombUnid;

    public int getCodiUnid() {
        return CodiUnid;
    }

    public void setCodiUnid(int CodiUnid) {
        this.CodiUnid = CodiUnid;
    }

    public String getNombUnid() {
        return NombUnid;
    }

    public void setNombUnid(String NombUnid) {
        this.NombUnid = NombUnid;
    }
    
    
    public Unidad() {
    }

    public Unidad(int CodiUnid, String NombUnid) {
        this.CodiUnid = CodiUnid;
        this.NombUnid = NombUnid;
    }
    
}
