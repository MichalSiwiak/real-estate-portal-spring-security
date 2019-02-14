package net.coffeecoding.dao;


import net.coffeecoding.entity.Flat;

import java.util.List;

public interface FlatDAO {

    public List<Flat> getFlats();
    public Flat getFlat(int id);
    public void saveFlat(Flat flat);
    public void deleteFlat(Flat flat);
    public List<String> findDistinctByCity();
    public List<Flat> findByCityEquals(String cityName);
    public List<Flat> findByTitleLike(String title);
    public List<Flat> findByPriceBetween(int minPrice, int maxPrice);
    public int findMaxPrice();
    public int findMinPrice();



}
