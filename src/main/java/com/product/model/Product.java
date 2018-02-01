package com.product.model;

import com.product.entity.StockAvail;
import com.product.entity.StockDetails;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

public class Product {

    SessionFactory factory = HibernateUtil.getSessionFactory();

    public List<StockAvail> productList() {
        Session session = factory.openSession();
        try {
            session.beginTransaction();
            Criteria c = session.createCriteria(StockAvail.class);
            List<StockAvail> pList = c.list();
            return pList;
        } catch (HibernateException e) {
            session.getTransaction().rollback();
            return null;
        }
    }

    public void updateProductQty(String pname, String qty) {
        Session session = factory.openSession();
        try {
            session.beginTransaction();
            Query query = session.createQuery("from StockAvail where name=?");
            query.setString(0, pname);
            session.getTransaction();
            StockAvail obj = (StockAvail) query.uniqueResult();
            int temp_quan = obj.getQuantity() - Integer.parseInt(qty);
            if (temp_quan > 0) {
                obj.setQuantity(temp_quan);
                session.update(obj);
                System.out.println("update");
            }
            session.getTransaction().commit();
        } catch (NumberFormatException e) {
            session.getTransaction().rollback();
        }
        session.close();
    }

    public void insertProductQty(String name, String quantity) {
        Session session = factory.openSession();
        Date dat = new Date();
        try {
            session.beginTransaction();
            StockDetails sd = new StockDetails();
            sd.setStockName(name);
            sd.setStockQuatity(Integer.parseInt(quantity));
            sd.setCategory("");
            sd.setCompanyPrice(BigDecimal.ZERO);
            sd.setDate(dat);
            sd.setExpireDate(dat);
            sd.setSellingPrice(BigDecimal.ZERO);
            sd.setStockId("");
            sd.setSupplierId("");
            sd.setUom("");
            session.save(sd);
            session.getTransaction().commit();
            session.close();
        } catch (NumberFormatException | HibernateException e) {
            e.printStackTrace();
        }
    }

    public int qtyCheckWithDatabase(String name) {
        Session session = factory.openSession();        
        int temp_quan = 0;
        try {
            session.beginTransaction();
            Query query = session.createQuery("from StockAvail where name=?");
            query.setString(0, name);
            session.getTransaction();
            StockAvail obj = (StockAvail) query.uniqueResult();
            temp_quan = obj.getQuantity();
            session.getTransaction().commit();
            session.close();
        } catch (NumberFormatException e) {
            session.getTransaction().rollback();
            return 0;
        }
        return temp_quan;
    }
}
