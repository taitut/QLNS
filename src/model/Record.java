/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author Admin
 */
@Entity
@Table(name="Records")
public class Record {
    @Id @GeneratedValue
    @Column(name="ID")
    private int id;
    
    @Column(name="Type")
    //@NotNull(message = "Vui lòng chọn loại")
    private boolean type;
    
    @Column(name="Reason")
    //@NotBlank(message = "Không được để trống Lý do")
    private String reason;
    
    @Column(name="Ngay")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    //@NotNull(message = "Không được để trống Ngày ghi nhận")
    private Date ngay;
    
    @ManyToOne
    @JoinColumn(name="StaffID")
    private Staff staff;

    public Record(){
        
    }

    public Record(int id, boolean type, String reason, Date ngay, Staff staff) {
        this.id = id;
        this.type = type;
        this.reason = reason;
        this.ngay = ngay;
        this.staff = staff;
    }
    
    
    public Staff getStaff() {
        return staff;
    }

    public void setStaff(Staff staff) {
        this.staff = staff;
    }

    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public boolean isType() {
        return type;
    }

    public void setType(boolean type) {
        this.type = type;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public Date getNgay() {
        return ngay;
    }

    public void setNgay(Date ngay) {
        this.ngay = ngay;
    }

    
}
