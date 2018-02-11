package com.product.controller;

import com.dao.CustomerDao;
import com.product.entity.Customer;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CustomerController {

    CustomerDao customerDao = new CustomerDao();
    int cusid = 1;

    @RequestMapping(value = "customer", method = RequestMethod.GET)
    public String customerRegistrationGet(ModelMap map) {
        List<Customer> customers = customerDao.customerList();
        map.addAttribute("customers", customers);
        return "customer";
    }

    @RequestMapping(value = "customer", method = RequestMethod.POST)
    @ResponseBody
    public String customerRegistrationPost(@RequestParam("cusName") String cusName, @RequestParam("cusAddress") String cusAddress,
            @RequestParam("cusMobile1") String cusMobile1, @RequestParam("cusMobile2") String cusMobile2) {
        //date format
        Date date = new Date();
        SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
        String customer_date = sd.format(date);
        // get id for creating custID
        long id = customerDao.getLastId() + 1;
        Customer c = new Customer();
        c.setCustId("CUS-" + id);
        c.setCustName(cusName);
        c.setCustAddress(cusAddress);
        c.setDate(customer_date);
        c.setContactNumber01(cusMobile1);
        c.setContactNumber02(cusMobile2);
        c.setStatus("Active");
        customerDao.customerRegistration(c);
        return "Inserted";
    }

    @RequestMapping(value = "customerupdatebyid", method = RequestMethod.POST)
    @ResponseBody
    public String  updateCustomerById(@RequestParam("cus_id") String cus_id,@RequestParam("cus_name") String cus_name,
            @RequestParam("cus_address") String cus_address,@RequestParam("cus_mobile1") String cus_mobile1,
            @RequestParam("cus_mobile2") String cus_mobile2,@RequestParam("cus_status") String cus_status) {
        customerDao.updateCustomerById(cus_id,cus_name,cus_address,cus_mobile1,cus_mobile2,cus_status);
        return "Updated";
    }
}
