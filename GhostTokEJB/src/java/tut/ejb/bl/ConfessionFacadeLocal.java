/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package tut.ejb.bl;

import java.util.List;
import javax.ejb.Local;
import tut.entities.Confession;

/**
 *
 * @author musaw
 */
@Local
public interface ConfessionFacadeLocal {

    void create(Confession confession);

    void edit(Confession confession);

    void remove(Confession confession);

    Confession find(Object id);

    List<Confession> findAll();

    List<Confession> findRange(int[] range);
    
   void saveConfession(String username, String message);
   
    List<Confession> getAllConfessions();

    int count();
    
}
