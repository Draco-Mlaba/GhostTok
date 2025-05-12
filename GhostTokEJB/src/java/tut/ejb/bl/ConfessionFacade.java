/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package tut.ejb.bl;

import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import tut.entities.Confession;

/**
 *
 * @author musaw
 */
@Stateless
public class ConfessionFacade extends AbstractFacade<Confession> implements ConfessionFacadeLocal {

    @PersistenceContext(unitName = "GhostTokEJBPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ConfessionFacade() {
        super(Confession.class);
    }

    @Override
    public void saveConfession(String username, String message) {
        Confession confession = new Confession(username, message, new java.util.Date());
        em.persist(confession);
    }

    @Override
    public List<Confession> getAllConfessions() {
        return em.createQuery("SELECT c FROM Confession c ORDER BY c.timestamp DESC", Confession.class)
                 .getResultList();
    }
    
}
