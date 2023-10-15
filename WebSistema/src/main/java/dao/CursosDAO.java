/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package dao;

import java.util.List;
import modelos.Cursos;

public interface CursosDAO {
    public boolean registrar(Cursos curso);
    public List<Cursos> obtener();    
    public boolean actualizar(Cursos curso);    
    public boolean eliminar(String[] codigos);    
    public Cursos buscar(int codigo);
}