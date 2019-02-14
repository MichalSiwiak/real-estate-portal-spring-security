package net.coffeecoding.entity;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Set;

import javax.persistence.*;

@Entity
@Table(name = "flat")
public class Flat {
    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    private int id;
    private Timestamp date;
    private String title;
    @Lob()
    private String content;
    private int price;
    private int surface;
    private int rooms;
    private String city;
    private byte[] image;
    private byte[] avatar;
    @ManyToOne
    @JoinColumn(name = "users")
    private Users users;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getSurface() {
        return surface;
    }

    public void setSurface(int surface) {
        this.surface = surface;
    }

    public int getRooms() {
        return rooms;
    }

    public void setRooms(int rooms) {
        this.rooms = rooms;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public byte[] getAvatar() {
        return avatar;
    }

    public void setAvatar(byte[] avatar) {
        this.avatar = avatar;
    }

    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }

    @Override
    public String toString() {
        return "Flat{" +
                "id=" + id +
                ", date=" + date +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", price=" + price +
                ", surface=" + surface +
                ", rooms=" + rooms +
                ", city='" + city + '\'' +
                ", image=" + Arrays.toString(image) +
                ", avatar=" + Arrays.toString(avatar) +
                ", users=" + users +
                '}';
    }
}
