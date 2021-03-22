/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import model.Depart;
import model.Staff;
import controller.UserController;
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
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Admin
 */
@Transactional
@Controller
@RequestMapping("/staff/")
public class StaffController {

    @Autowired
    SessionFactory factory;

    @Autowired
    ServletContext context;
    
    @RequestMapping("staff")
    public String index(ModelMap model) {
        model.addAttribute("staff", new Staff());
        Session session = factory.openSession();
        String hql = "From Staff";
        Query query = session.createQuery(hql);
        List<Staff> list = query.list();
        model.addAttribute("staffs", list);
        session.close();
        //UserController.login();
        return "staff/showStaff";
    }

    @ModelAttribute("sexual")
    public Map<Boolean, String> getSexual() {
        Map<Boolean, String> map = new HashMap<>();
        map.put(true, "Nam");
        map.put(false, "Nữ");
        return map;
    }

    @RequestMapping(value = "update")
    public String update(ModelMap model, HttpServletRequest request,
            @RequestParam("ma") String ma,
            @RequestParam("name") String name,
            @RequestParam("gender") String gender,
            @RequestParam("birthday") String birthday,
            @RequestParam("email") String email,
            @RequestParam("level")Integer level,
            @RequestParam("phone") String phone,
            @RequestParam("salary") String salary,
            @RequestParam("notes") String notes,
            @Validated @ModelAttribute(value = "departID") Depart depart,
            @RequestParam("photo") String photo) {
        Staff staff = new Staff(ma, name, Boolean.parseBoolean(gender),
                java.sql.Date.valueOf(birthday), photo, email,
                phone, level,Double.parseDouble(salary), notes, depart);
        model.addAttribute("staff", staff);
        return "staff/updateStaff";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String update(ModelMap model, @RequestParam("newPhoto") MultipartFile newPhoto,
            @ModelAttribute("staff")Staff staff, BindingResult errors) {
        if (newPhoto.isEmpty()) {
            if (errors.hasErrors()) {
                model.addAttribute("check", "form-bg-danger");
                model.addAttribute("message", "Vui lòng sửa lỗi ");
                return "staff/updateStaff";
            }
        } else {
            try {
                String photoPath = context.getRealPath("/assets/images/" + newPhoto.getOriginalFilename());
                newPhoto.transferTo(new File(photoPath));
                staff.setPhoto(newPhoto.getOriginalFilename());
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.update(staff);
            t.commit();
            model.addAttribute("check", "form-bg-success");
            model.addAttribute("message", "Cập nhật thành công !");

        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
            model.addAttribute("check", "form-bg-danger");
            model.addAttribute("message", "Cập nhật thất bại");
        } finally {
            session.close();
        }
        return "staff/updateStaff";
    }

    @RequestMapping(value = "insertStaff", method = RequestMethod.GET)
    public String insert(ModelMap model) {
        model.addAttribute("staff", new Staff());
        return "staff/insertStaff";
    }

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(ModelMap model, @RequestParam(value = "photo") MultipartFile photo,
            @Validated @ModelAttribute("staff") Staff staff,
            BindingResult errors) {
        if (errors.hasErrors() && photo.isEmpty()) {
            model.addAttribute("check", "form-bg-danger");
            model.addAttribute("message", "Vui lòng sửa lỗi ");
            return "staff/insertStaff";
        } else {
            Session session = factory.openSession();
            Transaction t = session.beginTransaction();
            try {
                String photoPath = context.getRealPath("/assets/images/" + photo.getOriginalFilename());
                photo.transferTo(new File(photoPath));
                //staff.setBirthday(new Date());
                staff.setPhoto(photo.getOriginalFilename());
                session.save(staff);
                t.commit();
                model.addAttribute("check", "form-bg-success");
                model.addAttribute("message", "Thêm mới thành công !");

            } catch (Exception e) {
                e.printStackTrace();
                t.rollback();
                model.addAttribute("check", "form-bg-danger");
                model.addAttribute("message", "Thêm thất bại");
            } finally {
                session.close();
            }
        }
        return "staff/insertStaff";
    }

    @ModelAttribute("departs")
    public List<Depart> getDepart() {
        Session session = factory.openSession();
        String hql = "from Depart";
        Query query = session.createQuery(hql);
        List<Depart> list = query.list();
        return list;
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public String delete(ModelMap model, @ModelAttribute("staff") Staff staff
    ) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.delete(staff);
            t.commit();
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        } finally {
            session.close();
        }
        return "redirect:staff.htm";
    }
    
    @RequestMapping(value="search")
    public String search(ModelMap model,
                        @RequestParam("name")String name) {
        model.addAttribute("staff", new Staff());
        Session session = factory.openSession();
        String hql = "From Staff where name like ?";
        Query query = session.createQuery(hql);
        query.setString(0, "%"+name+"%");
        List<Staff> list = query.list();
        model.addAttribute("staffs", list);
        session.close();
        return "staff/showStaff";
    }
    
}
