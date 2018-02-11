/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.tml;

import com.product.entity.Customer;
import com.product.model.HibernateUtil;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Projections;

/**
 *
 * @author Dell
 */
public class NewClass {

    SessionFactory factory = HibernateUtil.getSessionFactory();

    public void getLastId() {
        Session session = factory.openSession();
        session.beginTransaction();
        try {
            List ls = session.createQuery("select * from Customer").list();
            int i = (int) ls.get(0);
            
            System.out.println(i);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            System.out.println(e.toString());
        }
    }
    public static void main(String[] args) {
        NewClass ss = new NewClass();
        ss.getLastId();
    }
}
