package com.product.entity;
// Generated Feb 6, 2018 5:16:54 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

/**
 * Category generated by hbm2java
 */
@Entity
@Table(name="category"
    ,catalog="tml"
    , uniqueConstraints = @UniqueConstraint(columnNames="id") 
)
public class Category  implements java.io.Serializable {


     private String proCategoryId;
     private int id;
     private String proCategoryName;

    public Category() {
    }

	
    public Category(int id) {
        this.id = id;
    }
    public Category(int id, String proCategoryName) {
       this.id = id;
       this.proCategoryName = proCategoryName;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="pro_category_id", unique=true, nullable=false, length=30)
    public String getProCategoryId() {
        return this.proCategoryId;
    }
    
    public void setProCategoryId(String proCategoryId) {
        this.proCategoryId = proCategoryId;
    }

    
    @Column(name="id", unique=true, nullable=false)
    public int getId() {
        return this.id;
    }
    
    public void setId(int id) {
        this.id = id;
    }

    
    @Column(name="pro_category_name", length=100)
    public String getProCategoryName() {
        return this.proCategoryName;
    }
    
    public void setProCategoryName(String proCategoryName) {
        this.proCategoryName = proCategoryName;
    }




}

