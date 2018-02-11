package com.product.controller;

import com.product.model.Product;
import com.product.entity.StockAvail;
import com.product.model.HibernateUtil;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import org.hibernate.SessionFactory;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ProductController {

    Map<String, String> mapLang = new TreeMap<>();
    Product product = new Product();
    SessionFactory factory = HibernateUtil.getSessionFactory();

    @RequestMapping(value = "/")
    public String index() {        
        return "index";
    }
    

    @RequestMapping(value = "removeProduct")
    public String removeProduct(Model m) {
        List<StockAvail> plist = product.productList();
        m.addAttribute("plist", plist);
        return "removeProduct";
    }

    @RequestMapping(value = "valuereceive")
    @ResponseBody
    public void valueReceived(@RequestParam("productName") String name, @RequestParam("productQty") String qty) {
        String pname = name;
        String pqty = qty;
        System.out.println("before enter");
        System.out.println(mapLang.containsKey(name));
        if (mapLang.containsKey(name)) { // check product already exit or not
            System.out.println("first");
            int exitQtyInMapByProductName = Integer.parseInt(mapLang.get(pname));
            int currentQty = Integer.parseInt(qty);
            int totalQty = exitQtyInMapByProductName + currentQty;
            mapLang.put(pname, totalQty + "");
            System.out.println("exit" + totalQty);
        } else {
            mapLang.put(pname, pqty);
            System.out.println("not exit");
        }

        if (pname == null || pname == "") {
            Set mapSet = (Set) mapLang.entrySet();
            Iterator mapIterator = mapSet.iterator();
            int i = 0;
            while (mapIterator.hasNext()) {
                Map.Entry mapEntry = (Map.Entry) mapIterator.next();
                String keyValue = (String) mapEntry.getKey();
                String value = (String) mapEntry.getValue();
                if (i > 0) {
                    product.updateProductQty(keyValue, value);
                    product.insertProductQty(keyValue, value);
                }
                i++;
            }
            mapLang.clear();
            System.out.println("ok");
        }
    }

    @RequestMapping(value = "clearmap")
    @ResponseBody
    public void clearMap() {
        mapLang.clear();
        System.out.println("clear");
    }

    @RequestMapping(value = "removeqtyfrommap")
    @ResponseBody
    public void removeQtyFromMap(@RequestParam("productName") String name, @RequestParam("productQty") String qty) {
        mapLang.remove(name);
    }

    @RequestMapping(value = "checkqtywithdatabase")
    @ResponseBody
    public String checkQtyWithDatabase(@RequestParam("productName") String name, @RequestParam("productQty") String qty) {
        int qtyOfDatabase = product.qtyCheckWithDatabase(name);
        int qtyOfField = Integer.parseInt(qty);
        int qtyInMap = 0;
        if (mapLang.containsKey(name)) {
            qtyInMap = Integer.parseInt(mapLang.get(name));
        }
        String status = null;
        if (qtyOfDatabase < (qtyOfField + qtyInMap)) {
            status = "Not Available";
        } else {
            status = "";
        }
        System.out.println(status);
        return status;
    }
}
