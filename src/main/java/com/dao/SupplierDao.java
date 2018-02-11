/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.product.entity.Customer;
import com.product.entity.Supplier;
import com.product.model.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Dell
 */
public class SupplierDao {

    SessionFactory factory = HibernateUtil.getSessionFactory();

    public List<Supplier> supplierList() {
        Session session = factory.openSession();
        session.beginTransaction();
        List<Supplier> suppliers = null;
        try {
            suppliers = session.createCriteria(Supplier.class).list();
            session.getTransaction().commit();
        } catch (HibernateException e) {
            System.out.println(e.toString());
        } finally {
            session.close();
        }
        return suppliers;
    }

    public void updateSupplierById(String supid, String supName, String supAddress, String supContact1, String supContact2, String supStatus) {
        Session session = null;
        Query query = null;
        try {
            session = factory.openSession();
            session.beginTransaction();
            query = session.createQuery("UPDATE Supplier s SET s.supName = :su_name, s.supAddress = :su_address, s.supContact01 = :su_contact1, s.supContact02 = :su_contact2, s.status = :su_status WHERE s.supId = :su_id");
            query.setParameter("su_name", supName);
            query.setParameter("su_address", supAddress);
            query.setParameter("su_contact1", supContact1);
            query.setParameter("su_contact2", supContact2);
            query.setParameter("su_status", supStatus);
            query.setParameter("su_id", supid);
            query.executeUpdate();
            session.getTransaction().commit();
        } catch (HibernateException e) {
            System.out.println(e.toString());
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
        } finally {
            session.close();
        }
    }
}
