/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotBlank;

/**
 *
 * @author Admin
 */
@Entity
@Table(name = "Users")
public class User  {

    @Id
    @Column(name = "username")
    @NotBlank(message = "username.id")
    @Size(min=0,max=50,message="username.length")
    private String username;

    @Column(name = "password")
    @NotBlank(message = "Không được để trống mật khẩu")
    private String password;

    @Column(name = "fullname")
    @NotBlank(message = "Không được để trống họ tên")
    private String fullname;

    public User() {

    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(String username, String password, String fullname) {
        this.username = username;
        this.password = password;
        this.fullname = fullname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

}
