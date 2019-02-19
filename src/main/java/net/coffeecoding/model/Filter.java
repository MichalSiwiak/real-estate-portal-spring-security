package net.coffeecoding.model;

public class Filter {

    private  String title;
    private  String city;
    private  String priceRange;

    @Override
    public String toString() {
        return "Filter{" +
                "title='" + title + '\'' +
                ", city='" + city + '\'' +
                ", priceRange='" + priceRange + '\'' +
                '}';
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPriceRange() {
        return priceRange;
    }

    public void setPriceRange(String priceRange) {
        this.priceRange = priceRange;
    }
}
