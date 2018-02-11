package com.product.controller;

import com.dao.SupplierDao;
import com.product.entity.Supplier;
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SupplierController {

    SupplierDao supplierDao = new SupplierDao();

    @RequestMapping(value = "supplier")
    public String supplier(ModelMap map) {
        List<Supplier> suppliers = supplierDao.supplierList();
        map.addAttribute("suppliers", suppliers);
        return "supplier";
    }

    @RequestMapping(value = "updatesupplierbyid")
    @ResponseBody
    public String updateSupplierById(@RequestParam("supId") String supId, @RequestParam("supName") String supName, @RequestParam("supAddress") String supAddress, @RequestParam("supMobile1") String supMobile1, @RequestParam("supMobile2") String supMobile2, @RequestParam("supStatus") String supStatus) {
        supplierDao.updateSupplierById(supId, supName, supAddress, supMobile1, supMobile2, supStatus);
        return "Updated";
    }
}
