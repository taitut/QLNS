/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import model.Record;
import model.Staff;
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
@RequestMapping("/record/")
public class RecordController {

    @Autowired
    SessionFactory factory;

    @RequestMapping(value = "record", method = RequestMethod.GET)
    public String show(ModelMap model) {
        model.addAttribute("record", new Record());
        Session session = factory.openSession();
        String hql ="From Record";
        Query query = session.createQuery(hql);
        List<Record> list = query.list();
        model.addAttribute("records", list);
        session.close();
        return "record/showRecord";
    }
    
    @ModelAttribute("staffs")
    public List<Staff> getStaffs() {
        Session session = factory.openSession();
        String hql = "From Staff";
        Query query = session.createQuery(hql);
        List<Staff> list = query.list();
        return list;
    }
    
    @ModelAttribute("types")
    public Map<Boolean,String> getTypes(){
        Map<Boolean,String> maps = new HashMap<>();
        maps.put(true,"Tốt");
        maps.put(false, "Xấu");
        return maps;
    }

    @RequestMapping(value="update")
    public String update(ModelMap model,HttpServletRequest request,
                        @RequestParam("id")int id,
                        @RequestParam("type")boolean type,
                        @RequestParam("reason")String reason,
                        @RequestParam("ngay")String ngay,
                        @ModelAttribute(value="staffMa")Staff staff){
        Record record = new Record(id, type, reason, java.sql.Date.valueOf(ngay), staff);
        model.addAttribute("record", record);
        return "record/updateRecord";
    }
    
    @RequestMapping(value = "save", method = RequestMethod.POST)
    public String update(ModelMap model,@Validated @ModelAttribute("record")Record record,BindingResult errors) {
        if(record.getReason().trim().length() ==0){
            errors.rejectValue("reason", "record", "Không được để trống lý do");
        }if(record.getNgay()==null){
            errors.rejectValue("ngay", "record", "Không được để trống lý do");
        }
        if(errors.hasErrors()){
            model.addAttribute("check", "form-bg-danger");
            model.addAttribute("message", "Vui lòng sửa lỗi ");
            return "record/updateRecord";
        }
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.update(record);
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
        return "record/updateRecord";
    }
    
    @RequestMapping(value="insertRecord",method=RequestMethod.GET)
    public String insert(ModelMap model){
        model.addAttribute("record", new Record());
        return "record/insertRecord";
    }
    
    
    @RequestMapping(value = "insert", method = RequestMethod.POST)
    public String insert(ModelMap model,@Validated @ModelAttribute("record") Record record,BindingResult errors) {
        if(record.getReason().trim().length() ==0){
            errors.rejectValue("reason", "record", "Không được để trống lý do");
        }
        if(errors.hasErrors()){
            model.addAttribute("check", "form-bg-danger");
            model.addAttribute("message", "Vui lòng sửa lỗi ");
            return "record/insertRecord";
        }
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            record.setNgay(new Date());
            session.save(record);
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
        return "record/insertRecord";
    }

    

}
