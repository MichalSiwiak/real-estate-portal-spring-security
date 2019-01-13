package net.coffeecoding.entity;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Set;

@Entity
@Table(name = "users")
public class Users {

    @Id
    private String username;
    private String password;
    private boolean enabled;
    private Timestamp date;
    @OneToMany(mappedBy = "users", fetch = FetchType.EAGER)
    private Set<Flat> flats;

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

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public Set<Flat> getFlats() {
        return flats;
    }

    public void setFlats(Set<Flat> flats) {
        this.flats = flats;
    }
}

