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
    public void saveFlat(Flat flat) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.saveOrUpdate(flat);
    }

    @Override
    public void deleteFlat(Flat flat) {
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.delete(flat);
    }

    @Override
    public List<String> findDistinctByCity() {
        Session currentSession = sessionFactory.getCurrentSession();

        Query<String> query =
                currentSession.createQuery("select DISTINCT(f.city) from Flat f",
                        String.class);
        List<String> cities = query.getResultList();
        return cities;
    }

    @Override
    public List<Flat> findByCityEquals(String cityName) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Flat> query =
                currentSession.createQuery("select f from Flat f where f.city = :cityName ",
                        Flat.class);
        query.setParameter("cityName", cityName);
        List<Flat> flats = query.getResultList();

        return flats;
    }

    @Override
    public List<Flat> findByTitleLike(String title) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Flat> query =
                currentSession.createQuery("select f from Flat f where lower(f.title) like lower(concat('%', :title,'%'))",
                        Flat.class);
        query.setParameter("title", title);
        List<Flat> flats = query.getResultList();
        return flats;
    }

    @Override
    public List<Flat> findByPriceBetween(int minPrice, int maxPrice) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Flat> query =
                currentSession.createQuery("select f from Flat f where f.price BETWEEN :minPrice AND :maxPrice ",
                        Flat.class);
        query.setParameter("minPrice", minPrice);
        query.setParameter("maxPrice", maxPrice);
        List<Flat> flats = query.getResultList();

        return flats;
    }

    @Override
    public int findMaxPrice() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Integer> query =
                currentSession.createQuery("SELECT MAX(f.price) FROM Flat f",
                        Integer.class);
        if (query.getSingleResult() != null)
            return query.getSingleResult();
        else
            return 0;
    }

    @Override
    public int findMinPrice() {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Integer> query =
                currentSession.createQuery("SELECT MIN(f.price) FROM Flat f",
                        Integer.class);
        if (query.getSingleResult() != null)
            return query.getSingleResult();
        else
            return 0;
    }
}
