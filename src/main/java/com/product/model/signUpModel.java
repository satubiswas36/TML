/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.product.model;

import com.product.entity.User;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Dell
 */
public class signUpModel {
    SessionFactory sf=HibernateUtil.getSessionFactory();
    
    public boolean checkUserName(String userName)
    {
        boolean exist=false;
        
        Session session=sf.openSession();
        
        try{
            session.beginTransaction();
            String hql="from User where username=?";
            Query query=session.createQuery(hql);
            query.setString(0,userName);
            session.getTransaction();
            
            User u=(User) query.uniqueResult();
            if(u.getEmail()!=null)
                exist=true;
            else
                exist=false;
            
        }catch(Exception e)
        {
            session.getTransaction().rollback();
        }
        session.close();
        return exist;
    }
    
    public boolean insertUser(User user)
    {
        boolean done=false;
        Session session=sf.openSession();
        try{
            session.beginTransaction();
            session.save(user);
            session.getTransaction().commit();
            done=true;
        }catch(Exception e)
        {
            session.getTransaction().rollback();
        }
        session.close();
        return done;
    }
    
    public long getUserNumber()
    {
        long userNumber=0;
        
        Session session=sf.openSession();
        try{
            session.beginTransaction();
            String hql="select count(id) from User";
            Query q=session.createQuery(hql);
            session.getTransaction();
            userNumber=(long) q.uniqueResult();
        }catch(Exception e){
            session.getTransaction().rollback();
            
        }
        session.close();
        return userNumber;
    }
}
