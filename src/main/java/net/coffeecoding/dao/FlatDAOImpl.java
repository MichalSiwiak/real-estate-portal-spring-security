package net.coffeecoding.dao;

import net.coffeecoding.entity.Flat;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class FlatDAOImpl implements FlatDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Flat> getFlats() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Flat> theQuery =
                currentSession.createQuery("SELECT f from Flat f",
                        Flat.class);
        List<Flat> flats = theQuery.getResultList();
        return flats;
    }

    @Override
    public Flat getFlat(int id) {
        Session currentSession = sessionFactory.getCurrentSession();
        Flat flat = currentSession.get(Flat.class, id);
        return flat;
    }

    @Override
    public void saveFlat(Flat theFlat) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(theFlat);
    }
}
