/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.*;
import javax.servlet.http.HttpServletRequest;
import model.Depart;
import model.User;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Admin
 */
@Transactional
@Controller
@RequestMapping("/depart/")
public class DepartController {
    
    @Autowired
    SessionFactory factory;
    
    @RequestMapping("depart")
    public String showDepart(ModelMap model){
        model.addAttribute("depart", new Depart());
        Session session = factory.openSession();
        String hql = "from Depart";
        Query query = session.createQuery(hql);
        List<Depart> list = query.list();
        model.addAttribute("departs", list);
        session.close();
        return "depart/showDepart";
    }
    
    
    
    @RequestMapping(value="insertDepart", method = RequestMethod.GET)
    public String insert(ModelMap model) {
        model.addAttribute("depart", new Depart());
        return "depart/insertDepart";
    }
    
    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(ModelMap model,@Validated @ModelAttribute("depart")Depart depart,BindingResult errors) {
        if(errors.hasErrors()){
            model.addAttribute("check", "form-bg-danger");
            model.addAttribute("message", "Vui lòng sửa lỗi ");
            return "depart/insertDepart";
        }
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.save(depart);
            t.commit();
            model.addAttribute("check", "form-bg-success");
            model.addAttribute("message", "Thêm mới thành công !");

        } catch (Exception e) {
            t.rollback();
            model.addAttribute("check", "form-bg-danger");
            model.addAttribute("message", "Thêm thất bại");
        } finally {
            session.close();
        }
        return "depart/insertDepart";
    }
    
    @RequestMapping(value = "update")
    public String update(ModelMap model, HttpServletRequest request,
            @RequestParam("id") String id,
            @RequestParam("name") String name) {

        System.out.println(id);
        Depart depart = new Depart(id,name);
        //model.addAttribute("user", new User());
        model.addAttribute("depart", depart);
        return "depart/updateDepart";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String update(ModelMap model,@Validated @ModelAttribute("depart")Depart depart,BindingResult errors) {
        if(errors.hasErrors()){
            model.addAttribute("check", "form-bg-danger");
            model.addAttribute("message", "Vui lòng sửa lỗi ");
            return "depart/updateDepart";
        }
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.update(depart);
            t.commit();
            model.addAttribute("check", "form-bg-success");
            model.addAttribute("message", "Cập nhật thành công !");

        } catch (Exception e) {
            t.rollback();
            model.addAttribute("check", "form-bg-danger");
            model.addAttribute("message", "Cập nhật thất bại");
        } finally {
            session.close();
        }
        return "depart/updateDepart";
    }
    
    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public String delete(ModelMap model, @ModelAttribute("depart")Depart depart) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.delete(depart);
            t.commit();
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        } finally {
            session.close();
        }
        return "redirect:depart.htm";
    }
}
