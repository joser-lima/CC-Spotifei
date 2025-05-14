/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Junior
 */
public class Musica {
    private int id;
    private String nome;
    private String genero;
    private Artista artista;
    private int curtidas;
    private int descurtidas;

    public Musica() {
    }

    public Musica(int id, String nome, String genero, Artista artista, int curtidas, int descurtidas) {
        this.id = id;
        this.nome = nome;
        this.genero = genero;
        this.artista = artista;
        this.curtidas = curtidas;
        this.descurtidas = descurtidas;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getGenero() {
        return genero;
    }

    public void setGenero(String genero) {
        this.genero = genero;
    }

    public Artista getArtista() {
        return artista;
    }

    public void setArtista(Artista artista) {
        this.artista = artista;
    }

    public int getCurtidas() {
        return curtidas;
    }

    public void setCurtidas(int curtidas) {
        this.curtidas = curtidas;
    }

    public int getDescurtidas() {
        return descurtidas;
    }

    public void setDescurtidas(int descurtidas) {
        this.descurtidas = descurtidas;
    }
    
        
}
