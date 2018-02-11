package com.product.entity;
// Generated Feb 6, 2018 5:16:54 PM by Hibernate Tools 4.3.1


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * StockUser generated by hbm2java
 */
@Entity
@Table(name="stock_user"
    ,catalog="tml"
)
public class StockUser  implements java.io.Serializable {


     private Integer id;
     private String username;
     private String password;
     private String userType;
     private String answer;

    public StockUser() {
    }

    public StockUser(String username, String password, String userType, String answer) {
       this.username = username;
       this.password = password;
       this.userType = userType;
       this.answer = answer;
    }
   
     @Id @GeneratedValue(strategy=IDENTITY)

    
    @Column(name="id", unique=true, nullable=false)
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }

    
    @Column(name="username", length=120)
    public String getUsername() {
        return this.username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }

    
    @Column(name="password", length=120)
    public String getPassword() {
        return this.password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    
    @Column(name="user_type", length=20)
    public String getUserType() {
        return this.userType;
    }
    
    public void setUserType(String userType) {
        this.userType = userType;
    }

    
    @Column(name="answer", length=100)
    public String getAnswer() {
        return this.answer;
    }
    
    public void setAnswer(String answer) {
        this.answer = answer;
    }




}


