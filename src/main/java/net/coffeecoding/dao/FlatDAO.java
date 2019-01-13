package net.coffeecoding.dao;


import net.coffeecoding.entity.Flat;

import java.util.List;

public interface FlatDAO {

    public List<Flat> getFlats();
    public Flat getFlat(int id);
    public void saveFlat(Flat theFlat);
}
