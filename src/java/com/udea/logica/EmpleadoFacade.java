/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.udea.logica;

import com.udea.modelo.Empleado;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author santiago
 */
@Stateless
public class EmpleadoFacade extends AbstractFacade<Empleado> implements EmpleadoFacadeLocal {

    
    @PersistenceContext(unitName = "ConcesionarioPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public EmpleadoFacade() {
        super(Empleado.class);
}

   @Override
    public boolean checkLogin(String u, String p) {
        Query q = em.createQuery("select a from Empleado a "
            + "where a.username=:u and a.password=:p");
        q.setParameter("u",u);
        q.setParameter("p",p);
        return q.getResultList().size()>0;
    }    

    @Override
    public Empleado findbyUP(String u, String p) {
         Query q = em.createQuery("select a from Empleado a "
            + "where a.username=:u and a.password=:p");
        q.setParameter("u",u);
        q.setParameter("p",p);
        return (Empleado)q.getResultList().get(0);
    }
    
    

    
}
