package model.repository.impl;

import model.bean.Product;
import model.repository.ProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepositoryImpl implements ProductRepository {
    private static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1, "Oreo", "Bánh", 500, 23000));
        productList.add(new Product(2, "Cosy", "Bánh", 300, 25000));
        productList.add(new Product(3, "THTrueMilk", "Sữa", 450, 30000));
        productList.add(new Product(4, "VinaMilk", "Sữa", 430, 25000));
        productList.add(new Product(5, "Chuppa", "Kẹo", 450, 20000));
    }
    @Override
    public List<Product> findAll() {
        return productList;
    }

    @Override
    public void add(Product product) {
        productList.add(product);
        System.out.println("them moi thanh cong");
    }

    @Override
    public void delete(int id) {
        productList.remove(id);
    }

    @Override
    public Product findById(int id) {
        return productList.get(id);
    }

    @Override
    public void edit(int id, Product product) {
        productList.add(id, product);
    }

    @Override
    public List<Product> findByName(String name) {
        List<Product> products = new ArrayList<>();
        for(Product product : productList){
            if(product.getName().equals(name)){
                products.add(product);
            }
        }
        return products;
    }
}
