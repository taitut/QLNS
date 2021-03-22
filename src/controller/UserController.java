/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import model.DTO;
import model.Mailer;
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
@RequestMapping("/user/")
public class UserController {

    @Autowired
    SessionFactory factory;

    @RequestMapping("admin")
    public String admin(ModelMap model) {
        
        return "admin";
    }

    @RequestMapping(value = "user", method = RequestMethod.GET)
    public String showUser(ModelMap model) {
        model.addAttribute("user", new User());
        Session session = factory.openSession();
        String hql = "from User";
        Query query = session.createQuery(hql);
        List<User> list = query.list();
        model.addAttribute("users", list);
        session.close();
        return "user/showUser";
    }

    @ModelAttribute("dto")
    public List getDTO() {
        
        Session session = factory.openSession();
        Query query2 = session.createQuery("select  s.photo,s.ma,s.name,s.email,\n"
                + "sum(case when r.type = 1 then 1 else 0 end),\n"
                + "sum(case when r.type= 0 then 1 else 0 end) ,\n"
                + "(sum(case when r.type = 1 then 1 else 0 end) - sum(case when r.type= 0 then 1 else 0 end)) \n"
                + "from Staff s, Record r "
                + "where  s.ma = r.staff.ma \n"
                + "group by s.photo,s.ma,s.name,s.email \n "
                + "order by (sum(case when r.type = 1 then 1 else 0 end) - sum(case when r.type= 0 then 1 else 0 end)) desc").setMaxResults(2);
        
        List<Object[]> list = query2.list();
        return list;
    }
    
    @ModelAttribute("countUser")
    public long getCountUser() {
        List<Long> list = new ArrayList<>();
        Session session = factory.openSession();
        Query query = session.createQuery("select count(*) from User");
        list = query.list();
        long a = list.get(0);
        return a;
    }

    @ModelAttribute("countDepart")
    public long getCountDepart() {
        List<Long> list = new ArrayList<>();
        Session session = factory.openSession();
        Query query = session.createQuery("select count(*) from Depart");
        list = query.list();
        long a = list.get(0);
        return a;
    }

    @ModelAttribute("countStaff")
    public long getCountStaff() {
        List<Long> list = new ArrayList<>();
        Session session = factory.openSession();
        Query query = session.createQuery("select count(*) from Staff");
        list = query.list();
        long a = list.get(0);
        return a;
    }

    @ModelAttribute("countRecord")
    public long getCountRecord() {
        List<Long> list = new ArrayList<>();
        Session session = factory.openSession();
        Query query = session.createQuery("select count(*) from Record");
        list = query.list();
        long a = list.get(0);
        return a;
    }

    @RequestMapping("insertUser")
    public String insert(ModelMap model) {
        model.addAttribute("user", new User());
        return "user/insertUser";
    }

    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(ModelMap model, @Validated @ModelAttribute("user") User user, BindingResult errors) {
        if (errors.hasErrors()) {
            model.addAttribute("check", "form-bg-danger");
            model.addAttribute("message", "Vui lòng sửa lỗi");
            return "user/insertUser";
        }
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.save(user);
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
        return "user/insertUser";
    }

    @RequestMapping(value = "update")
    public String update(ModelMap model, HttpServletRequest request,
            @RequestParam("username") String username,
            @RequestParam("password") String password,
            @RequestParam("fullname") String fullname) {

        //String username = request.getParameter("username");
        //String password = request.getParameter("password");
        //String fullname = request.getParameter("fullname");
        System.out.println(username);
        User user = new User(username, password, fullname);
        //model.addAttribute("user", new User());
        model.addAttribute("user", user);
        return "user/updateUser";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String update(ModelMap model, @Validated @ModelAttribute("user") User user, BindingResult errors) {
        if (errors.hasErrors()) {
            model.addAttribute("check", "form-bg-danger");
            model.addAttribute("message", "Vui lòng sửa lỗi ");
            return "user/updateUser";
        }
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.update(user);
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
        return "user/updateUser";
    }

    @RequestMapping(value = "delete", method = RequestMethod.POST)
    public String delete(ModelMap model, @ModelAttribute("user") User user) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.delete(user);
            t.commit();
        } catch (Exception e) {
            e.printStackTrace();
            t.rollback();
        } finally {
            session.close();
        }
        return "redirect:user.htm";
    }

    @RequestMapping("en")
    public String en() {
        return "redirect:admin.htm?language=en";
    }

    @RequestMapping("vi")
    public String vi() {
        return "redirect:admin.htm?language=vi";
    }

    @RequestMapping("login")
    public String login(ModelMap model) {
        model.addAttribute("user", new User());
        return "login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String login(ModelMap model, @ModelAttribute("user") User user) {
       // user.setFullname("");
        Session session = factory.openSession();
        String hql = "from User where username = :username and password = :password ";
        Query query = session.createQuery(hql);
        query.setParameter("username", user.getUsername());
        query.setParameter("password", user.getPassword());
       // query.setParameter("fullname", user.getFullname());
        System.out.println(user.getUsername());
        System.out.println(user.getPassword());
        System.out.println(user.getFullname());
        List<User> list = query.list();
        session.close();
        if (list.size() == 0) {
            model.addAttribute("check", "form-bg-danger");
            model.addAttribute("message", "Sai mật khẩu hoặc password");
           
            return "login";
        } else {
        	 model.addAttribute("fullname",user.getUsername() );
            return "admin";
        }
    }
    
    @Autowired
    Mailer mailer;
    
    
    @RequestMapping(value="send")
    public String send(ModelMap model,
                        @RequestParam("name")String name,
                        @RequestParam("email")String email){
        try {
            mailer.send(name, email);
            model.addAttribute("check", "form-bg-success");
            model.addAttribute("message", "Gửi mail thành công !");
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("check", "form-bg-danger");
            model.addAttribute("message", "Gửi mail thất bại !");
        }
        return "admin";
    }
}
