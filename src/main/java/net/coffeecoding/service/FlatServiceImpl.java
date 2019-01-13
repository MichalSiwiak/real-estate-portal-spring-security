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
    public void saveFlat(Flat theTopic) {
        flatDAO.saveFlat(theTopic);
    }
}





