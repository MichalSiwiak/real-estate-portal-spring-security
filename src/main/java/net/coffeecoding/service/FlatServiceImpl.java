package net.coffeecoding.service;

import net.coffeecoding.dao.FlatDAO;
import net.coffeecoding.entity.Flat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class FlatServiceImpl implements FlatService {

    @Autowired
    private FlatDAO flatDAO;

    @Override
    @Transactional
    public List<Flat> getFlats() {
        return flatDAO.getFlats();
    }

    @Override
    @Transactional
    public Flat getFlat(int id) {
        return flatDAO.getFlat(id);
    }

    @Override
    @Transactional
    public void saveFlat(Flat flat) {
        flatDAO.saveFlat(flat);
    }

    @Override
    @Transactional
    public void deleteFlat(Flat flat) {
        flatDAO.deleteFlat(flat);
    }

    @Override
    @Transactional
    public List<String> findDistinctByCity() {
        return flatDAO.findDistinctByCity();
    }

    @Override
    @Transactional
    public List<Flat> findByCityEquals(String cityName) {
        return flatDAO.findByCityEquals(cityName);
    }

    @Override
    @Transactional
    public List<Flat> findByTitleLike(String title) {
        return flatDAO.findByTitleLike(title);
    }

    @Override
    @Transactional
    public List<Flat> findByPriceBetween(int minPrice, int maxPrice) {
        return flatDAO.findByPriceBetween(minPrice, maxPrice);
    }

    @Override
    public int findMaxPrice() {
        return flatDAO.findMaxPrice();
    }

    @Override
    public int findMinPrice() {
        return flatDAO.findMinPrice();
    }
}