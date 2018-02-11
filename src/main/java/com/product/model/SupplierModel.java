package com.product.model;

import com.product.entity.Supplier;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;

public class SupplierModel {

    SessionFactory sf = HibernateUtil.getSessionFactory();

    public boolean insertSupplier(Supplier supplier) {
        boolean done = false;
        String strDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        supplier.setDate(strDate);
        Session session = sf.openSession();
        session.beginTransaction();
        Criteria c = session.createCriteria(Supplier.class);
        c.setProjection(Projections.max("id"));
        
        
        Integer total = (Integer) c.uniqueResult();
       
        
        if(total!=null) total+=1;
        else total=1;
        
        String totalNum = Long.toString(total);
        String s = "SUP-" + totalNum;
        
        supplier.setSupId(s);
        
        session.close();
        Session session1=sf.openSession();
        try {
            System.out.println(supplier.getSupId());
            session1.beginTransaction();
            session1.save(supplier);
            session1.getTransaction().commit();
            done = true;
        } catch (Exception e) {
            session1.getTransaction().rollback();
        }
        session1.close();
        return done;
    }
}
