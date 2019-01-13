package net.coffeecoding.service;
import net.coffeecoding.entity.Flat;

import java.util.List;

public interface FlatService {

    public List<Flat> getFlats();

    public Flat getFlat(int id);

    public void saveFlat(Flat theTopic);
}