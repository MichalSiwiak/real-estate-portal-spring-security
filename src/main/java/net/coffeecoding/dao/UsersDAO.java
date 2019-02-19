package net.coffeecoding.dao;

import net.coffeecoding.entity.Flat;
import net.coffeecoding.entity.Users;

public interface UsersDAO {


    public Users getUser(String username);
    public void saveUser(Users users);


}
