/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Date;
import java.util.Collection;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "Staffs")
public class Staff {

    @Id
    @Column(name = "ID")
    @NotBlank(message = "Không được để trống ID")
    private String ma;

    @Column(name = "Name")
    @NotBlank(message = "Không được để trống tên")
    private String name;

    @Column(name = "Gender")
    @NotNull(message = "Vui lòng chọn giới tính")
    private boolean gender;

    @Column(name = "Birthday")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @NotNull(message = "Không được để trống ngày sinh")
    private Date birthday;

    @Column(name = "Photo")
    private String photo;

    @Column(name = "Email")
    @NotBlank(message = "Không được để trống Email")
    private String email;

    @Column(name = "Phone")
    @NotBlank(message = "Không được để trống số điện thoại")
    private String phone;

    @Column(name = "Level")
    @NotNull(message = "Không được để trống cấp độ")
    @DecimalMin(value = "1", message = "Cấp độ không hợp lê")
    @DecimalMax(value = "10", message = "Cấp độ không hợp lệ")
    private Integer level;
    
    @Column(name = "Salary")
    @NotNull(message = "Không được để trống điểm")
    @DecimalMin(value = "0", message = "Lương không hợp lê")
    @DecimalMax(value = "1000000000000000", message = "Lương không hợp lệ")
    private double salary;

    @Column(name = "Notes")
    @NotBlank(message = "Không được để trống ghi chú")
    private String notes;

    @ManyToOne
    @JoinColumn(name = "DepartID")
    private Depart depart;

    @OneToMany(mappedBy = "staff", fetch = FetchType.EAGER)
    private Collection<Record> record;

    public Staff() {

    }

    public Staff(String ma, String name, boolean gender, Date birthday, String photo, String email, String phone, Integer level, double salary, String notes, Depart depart) {
        this.ma = ma;
        this.name = name;
        this.gender = gender;
        this.birthday = birthday;
        this.photo = photo;
        this.email = email;
        this.phone = phone;
        this.level = level;
        this.salary = salary;
        this.notes = notes;
        this.depart = depart;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    
    
    public Staff(String ma, String name, boolean gender, Date birthday, String email, String phone, double salary, String notes, Depart depart, Collection<Record> record) {
        this.ma = ma;
        this.name = name;
        this.gender = gender;
        this.birthday = birthday;
        this.email = email;
        this.phone = phone;
        this.salary = salary;
        this.notes = notes;
        this.depart = depart;
        this.record = record;
    }

    public Staff(String ma, String name, boolean gender, Date birthday, String photo, String email, String phone, double salary, String notes, Depart departs) {
        this.ma = ma;
        this.name = name;
        this.gender = gender;
        this.birthday = birthday;
        this.photo = photo;
        this.email = email;
        this.phone = phone;
        this.salary = salary;
        this.notes = notes;
        this.depart = departs;
    }

    public Staff(String ma) {
        this.ma = ma;
    }

    public String getMa() {
        return ma;
    }

    public void setMa(String ma) {
        this.ma = ma;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public double getSalary() {
        return salary;
    }

    public void setSalary(double Salary) {
        this.salary = Salary;
    }

    public String getNotes() {
        return notes;
    }

    public void setNotes(String notes) {
        this.notes = notes;
    }

    public Depart getDepart() {
        return depart;
    }

    public void setDepart(Depart depart) {
        this.depart = depart;
    }

    public Collection<Record> getRecord() {
        return record;
    }

    public void setRecord(Collection<Record> record) {
        this.record = record;
    }

}
