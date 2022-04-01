package controller;

import model.bean.Product;
import model.service.ProductService;
import model.service.impl.ProductServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", urlPatterns = {"/product"})
public class ProductServlet extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                showFormCreate(request, response);
                break;
            case "edit":
                showFormEdit(request, response);
                break;
            case "delete":
                showFormDelete(request, response);
                break;
            case "view":
                viewProductDetails(request,response);
                break;
            case "search":
                showFormSearch(request,response);
                break;
            default:
                showListProduct(request, response);
        }
    }

    private void showListProduct(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/list.jsp");
        request.setAttribute("productList", productService.findAll());
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormSearch(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher=request.getRequestDispatcher("view/product/search.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void viewProductDetails(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null){
            dispatcher=request.getRequestDispatcher("view/error-404.jsp");
        }else {
            request.setAttribute("product",product);
            dispatcher=request.getRequestDispatcher("view/product/view.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormDelete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher requestDispatcher;
        if (product == null) {
            requestDispatcher = request.getRequestDispatcher("view/error-404.jsp");
        } else {
            request.setAttribute("product", product);
            requestDispatcher = request.getRequestDispatcher("view/product/delete.jsp");
        }
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) {
    int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        RequestDispatcher dispatcher;
        if (product == null){
            dispatcher = request.getRequestDispatcher("view/error-404.jsp");
        } else {
            request.setAttribute("product", product);
            dispatcher = request.getRequestDispatcher("view/product/edit.jsp");
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/product/create.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e){
            e.printStackTrace();
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                save(request, response);
                break;
            case "edit":
                edit(request, response);
                break;
            case "delete":
                delete(request, response);
                break;
            case "search":
                search(request,response);
                break;
            default:
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) {
        String name=request.getParameter("name");
        List<Product> products=productService.findByName(name);
        RequestDispatcher dispatcher;
        if (products.size()==0){
            dispatcher=request.getRequestDispatcher("view/error-404.jsp");
        }else {
            request.setAttribute("products",products);
            dispatcher=request.getRequestDispatcher("view/product/resultSearch.jsp");
        }
        try {
            dispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product=productService.findById(id);
        RequestDispatcher dispatcher;
        if (product==null){
            dispatcher=request.getRequestDispatcher("view.error-404.jsp");
        }else {
            productService.delete(id);
            request.setAttribute("product",product);
            try {
                response.sendRedirect("/product");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void edit(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        int amount = Integer.parseInt(request.getParameter("amount"));
        double price = Double.parseDouble(request.getParameter("price"));
        Product product = productService.findById(id);
        RequestDispatcher requestDispatcher;
        if (product==null){
            requestDispatcher=request.getRequestDispatcher("view.error-404.jsp");
        }else {
            product.setName(name);
            product.setPrice(price);
            product.setType(type);
            product.setAmount(amount);
            productService.edit(id,product);
            requestDispatcher=request.getRequestDispatcher("view/product/edit.jsp");
            request.setAttribute("product",product);
        }
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void save(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        int amount = Integer.parseInt(request.getParameter("amount"));
        double price = Double.parseDouble(request.getParameter("price"));
        Product product = new Product(id, name, type, amount, price);
        productService.add(product);
        try {
            response.sendRedirect("/product");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
