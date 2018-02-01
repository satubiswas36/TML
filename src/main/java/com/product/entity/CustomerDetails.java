package com.product.entity;
// Generated Jan 28, 2018 2:52:02 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * CustomerDetails generated by hbm2java
 */
@Entity
@Table(name="customer_details"
    ,catalog="tml"
)
public class CustomerDetails  implements java.io.Serializable {


     private Integer id;
     private String customerName;
     private String customerAddress;
     private String customerContact1;
     private String customerContact2;
     private int balance;

    public CustomerDetails() {
    }

    public CustomerDetails(String customerName, String customerAddress, String customerContact1, String customerContact2, int balance) {
       this.customerName = customerName;
       this.customerAddress = customerAddress;
       this.customerContact1 = customerContact1;
       this.customerContact2 = customerContact2;
       this.balance = balance;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    
    @Column(name="customer_name", nullable=false, length=200)
    public String getCustomerName() {
        return this.customerName;
    }
    
    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    
    @Column(name="customer_address", nullable=false, length=500)
    public String getCustomerAddress() {
        return this.customerAddress;
    }
    
    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    
    @Column(name="customer_contact1", nullable=false, length=100)
    public String getCustomerContact1() {
        return this.customerContact1;
    }
    
    public void setCustomerContact1(String customerContact1) {
        this.customerContact1 = customerContact1;
    }

    
    @Column(name="customer_contact2", nullable=false, length=100)
    public String getCustomerContact2() {
        return this.customerContact2;
    }
    
    public void setCustomerContact2(String customerContact2) {
        this.customerContact2 = customerContact2;
    }

    
    @Column(name="balance", nullable=false)
    public int getBalance() {
        return this.balance;
    }
    
    public void setBalance(int balance) {
        this.balance = balance;
    }




}

