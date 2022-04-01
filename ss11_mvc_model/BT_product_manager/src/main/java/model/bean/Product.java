package model.bean;

public class Product {
    private int id;
    private String name;
    private String type;
    private int amount;
    private double price;

    public Product() {
    }

    public Product(int id, String name, String type, int amount, double price) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.amount = amount;
        this.price = price;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
