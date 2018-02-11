package com.product.entity;
// Generated Feb 6, 2018 5:16:54 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * UomDetails generated by hbm2java
 */
@Entity
@Table(name="uom_details"
    ,catalog="tml"
)
public class UomDetails  implements java.io.Serializable {


     private Integer id;
     private String name;
     private String spec;

    public UomDetails() {
    }

    public UomDetails(String name, String spec) {
       this.name = name;
       this.spec = spec;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    
    @Column(name="name", length=120)
    public String getName() {
        return this.name;
    }
    
    public void setName(String name) {
        this.name = name;
    }

    
    @Column(name="spec", length=120)
    public String getSpec() {
        return this.spec;
    }
    
    public void setSpec(String spec) {
        this.spec = spec;
    }




}


