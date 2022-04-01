package model.repository;

import model.bean.Product;

import java.util.List;

public interface ProductRepository {
    List<Product> findAll();
    void add(Product product);
    void delete(int id);
    Product findById(int id);
    void edit(int id, Product product);
    List<Product> findByName(String name);
}
