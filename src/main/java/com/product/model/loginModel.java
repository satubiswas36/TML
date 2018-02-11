/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.product.model;

import com.product.entity.StockAvail;
import com.product.entity.User;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

/**
 *
 * @author Dell
 */

public class loginModel {
    
    SessionFactory sf = HibernateUtil.getSessionFactory();

    public boolean checkUserName(String username) {
        boolean found = false;

        Session session = sf.openSession();
        try {
            session.beginTransaction();
            
            String hql="from User where username=?";
            Query q=session.createQuery(hql);
            q.setString(0, username);
            session.getTransaction();
            User user=(User)q.uniqueResult();
            
            if(user != null)
                found=true;
            
        } catch (Exception e) {
            session.getTransaction().rollback();
            found = false;
        }
        session.close();
        return found;
    }

    public boolean checkLogin(String username, String password) {
        boolean found = false;

        Session session = sf.openSession();
        try {
            session.beginTransaction();
            String hql = "from User where username=? and password=?";
            Query q = session.createQuery(hql);
            q.setString(0, username);
            q.setString(1, password);
            session.getTransaction();

            User user = (User) q.uniqueResult();
            System.out.println(user.getAccess());
            if (user.getAccess().contains("1")) {
                found = true;
            }

        } catch (Exception e) {
            session.getTransaction().rollback();
            found = false;
        }
        session.close();
        return found;
    }
    
    public User getUserCredential(String username,String password)
    {
        User user=new User();
        
        Session session = sf.openSession();
        
        try{
            session.beginTransaction();
            String hql="from User where username=? and password=?";
            Query q=session.createQuery(hql);
            q.setString(0, username);
            q.setString(1, password);
            session.getTransaction();
            
            user=(User)q.uniqueResult();
            
        }catch(Exception e)
        {
            session.getTransaction().rollback();
        }
        
        session.close();
        return user;
    }
    
    public String getProductNumber()
    {
        String productNumber=null;
        
        Session session=sf.openSession();
        try{
            session.beginTransaction();
            Criteria c=session.createCriteria(StockAvail.class);
            c.setProjection(Projections.sum("quantity"));        
            productNumber= c.uniqueResult().toString();
            
        }catch(Exception e)
        {
            session.getTransaction().rollback();
        }
        session.close();
        return productNumber;
    }
    
    public List demo()
    {
        List list=new ArrayList();
        
        return list;
    }
}
