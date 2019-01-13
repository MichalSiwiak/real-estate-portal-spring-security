package net.coffeecoding.dao;

import net.coffeecoding.entity.Users;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class UsersDAOImpl implements UsersDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Users getUser(String username) {

        Session currentSession = sessionFactory.getCurrentSession();
        Users user = currentSession.get(Users.class, username);

        return user;
    }
}
