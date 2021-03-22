/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.Collection;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotBlank;

/**
 *
 * @author Admin
 */
@Entity
@Table(name="Departs")
public class Depart {
    @Id
    @Column(name="ID")
    @NotBlank(message = "Không được để trống ID")
    private String id;
    
    @Column(name="Name")
    @NotBlank(message = "Không được để trống tên")
    private String name;
    
    @OneToMany(mappedBy = "depart",fetch = FetchType.EAGER)
    private Collection<Staff> staffs;

    public Depart(){
        
    }

    public Depart(String id) {
        this.id = id;
    }

    public Depart(String id, String name) {
        this.id = id;
        this.name = name;
    }
    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Collection<Staff> getStaffs() {
        return staffs;
    }

    public void setStaffs(Collection<Staff> staffs) {
        this.staffs = staffs;
    }
    
}
