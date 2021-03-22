/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.File;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Admin
 */
@Service("mailer")
public class Mailer {
    
    @Autowired
    JavaMailSender mailer;
    
    @Autowired
    ServletContext context;
    
    public void send( String name, String to) {
        try {
            //String fileName = attach.getOriginalFilename();
            //String path = context.getRealPath("/image/" + fileName);
            
            MimeMessage mail = mailer.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(mail);
            helper.setFrom("buithetai2901@gmail.com", "buithetai2901@gmail.com");
            helper.setTo(to);
            helper.setReplyTo("buithetai2901@gmail.com", "buithetai2901@gmail.com");
            helper.setSubject("Compliment");
            helper.setText("Chúc mừng "+name+" đã đạt danh hiệu tốt", true);
            //helper.addAttachment(fileName, new File(path));
            
            mailer.send(mail);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
    
}
