import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", urlPatterns = {"/customer"})
public class CustomerServlet extends HttpServlet {
    private static List<Customer> customerList=new ArrayList<>();
    static {
        customerList.add(new Customer("DangCong Tan","25/03/2001","Binh Dinh","https://www.pexels.com/photo/wood-buildings-building-forest-11111431/"));
        customerList.add(new Customer("Nguyen Thi Kim Ngan","14/02/2001","Quang Nam","https://unsplash.com/photos/oXVCgaDqX30"));
        customerList.add(new Customer("Mai Thi Thanh Truc","04/06/2001","Da Nang","https://unsplash.com/photos/oXVCgaDqX30"));
        customerList.add(new Customer("Vo Phuong Nhi","11/04/2001","Gia Lai","https://unsplash.com/photos/oXVCgaDqX30"));
        customerList.add(new Customer("Ba Cham","01/01/2001","Ha Noi","https://unsplash.com/photos/oXVCgaDqX30"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher=request.getRequestDispatcher("view/customer/list.jsp");
        request.setAttribute("customerList",customerList);
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}