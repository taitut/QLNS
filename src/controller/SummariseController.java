/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.util.List;
import model.Staff;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Admin
 */
@Transactional
@Controller
@RequestMapping("/summarise/")
public class SummariseController {
    
    @Autowired
    SessionFactory factory;
    
    @RequestMapping("summarise")
    public String index(ModelMap model) {
        return "summarise/showSummarise";
    }
    
    @ModelAttribute("arrays")
    public List getList(ModelMap model){
        Session session = factory.openSession();
        String hql="select s.name,"
                + "sum(case when r.type = 1 then 1 else 0 end),"
                + "sum(case when r.type= 0 then 1 else 0 end) "
                + "from Record r,Staff s "
                + "where r.staff.ma = s.ma "
                + "group by s.name";
        
        Query query = session.createQuery(hql);
        List<Object[]> list = query.list();
        return list;
    }
    
    @ModelAttribute("arraysdepart")
    public List getListDepart(ModelMap model){
        Session session = factory.openSession();
        String hql="select d.name,"
                + "sum(case when r.type = 1 then 1 else 0 end),"
                + "sum(case when r.type= 0 then 1 else 0 end) "
                + "from Record r,Staff s,Depart d "
                + "where r.staff.ma = s.ma and  d.id=s.depart.id "
                + "group by d.name";
        
        Query query = session.createQuery(hql);
        List<Object[]> list = query.list();
        return list;
    }
}
