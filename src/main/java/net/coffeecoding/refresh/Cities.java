package net.coffeecoding.refresh;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;

public enum Cities {

    Warszawa, Wrocław, Łódź, Zakopane, Gdańsk, Szczecin, Gdynia, Olsztyn,
    Lublin, Rzeszów, Opole, Kielce, Poznań, Katowice, Białystok, Kraków,
    Kalisz, Kołobrzeg, Malbork, Ustka, Karpacz;

    private static final List<Cities> VALUES =
            Collections.unmodifiableList(Arrays.asList(values()));
    private static final int SIZE = VALUES.size();
    private static final Random RANDOM = new Random();

    public static Cities randomCities() {
        return VALUES.get(RANDOM.nextInt(SIZE));
    }

}
