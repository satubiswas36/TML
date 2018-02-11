/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.product.model;

import com.product.entity.StockAvail;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class ProductModel {
    
    SessionFactory sf=HibernateUtil.getSessionFactory();
    public void insertStockAvail(StockAvail obj)
    {
        Session ses=sf.openSession();
        
        try{
            ses.beginTransaction();
            ses.save(obj);
            ses.getTransaction().commit();
            
        }catch(Exception e)
        {
            ses.getTransaction().rollback();
        }
        ses.close();
    }
    
}
