package com.dao;

import com.product.entity.Customer;
import com.product.model.HibernateUtil;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

public class CustomerDao {

    SessionFactory factory = HibernateUtil.getSessionFactory();

    public void customerRegistration(Customer customer) {

        Session session = null;
        Transaction transaction = null;
        try {
            session = factory.openSession();
            transaction = session.beginTransaction();
            session.save(customer);
            transaction.commit();
        } catch (HibernateException e) {
            System.out.println(e.toString());
            if (transaction != null) {
                transaction.rollback();
            }
        } finally {
            session.close();
            System.out.println("c");
        }
    }

    public long getLastId() {
        long id = 0;
        Session session = factory.openSession();
        Transaction transaction = session.beginTransaction();
        try {
            List ls = session.createQuery("select count(*) from Customer").list();
            id = (long) ls.get(0);
        } catch (Exception e) {
            if (transaction != null) {
                transaction.commit();
            }
        } finally {
            session.close();
        }
        return id;
    }

    public List<Customer> customerList() {
        Session session = factory.openSession();
        session.beginTransaction();
        List<Customer> customers = null;
        try {
            customers = session.createCriteria(Customer.class).list();
            session.getTransaction().commit();
        } catch (HibernateException e) {
            System.out.println(e.toString());
        } finally {
            session.close();
        }
        return customers;
    }

    public List getCustomerById(String id) {
        Session session = factory.openSession();
        List customers = null;
        try {
            customers = session.createCriteria(Customer.class).add(Restrictions.eq("id", id)).list();

            session.getTransaction().commit();
        } catch (HibernateException e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
        }
        return customers;
    }

    public void updateCustomerById(String id, String cus_name, String cus_address, String cus_mobile1, String cus_mobile2, String cus_status) {
        Session session = factory.openSession();
        Query query = null;
        try {
            session.beginTransaction();
            query = session.createQuery("UPDATE Customer c SET c.custName = :cusname, c.custAddress = :cus_address, c.contactNumber01 = :cus_contact1, c.contactNumber02 = :cus_contact2, c.status = :cus_status WHERE c.custId = :cusid");
            query.setParameter("cusname", cus_name);
            query.setParameter("cus_address", cus_address);
            query.setParameter("cus_contact1", cus_mobile1);
            query.setParameter("cus_contact2", cus_mobile2);
            query.setParameter("cus_status", cus_status);
            query.setParameter("cusid", id);
            query.executeUpdate();
            session.getTransaction().commit();
        } catch (Exception e) {
            System.out.println(e.toString());
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
        } finally {
            session.close();
        }
    }
}
