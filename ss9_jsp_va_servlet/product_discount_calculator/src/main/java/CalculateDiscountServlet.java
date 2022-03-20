import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculateDiscountServlet", value = "/display-discount")
public class CalculateDiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productDes=request.getParameter("ProductDescription");
        float listPrice=Float.parseFloat(request.getParameter("ListPrice"));
        float discountPer=Float.parseFloat(request.getParameter("DiscountPercent"));

        float discountAmount= (float) (listPrice*discountPer*0.01);
        float discountPrice= listPrice-discountAmount;
        PrintWriter printWriter=response.getWriter();
        printWriter.println("<html>");
        printWriter.println("<p><b>Product Description:</b> "+productDes+"</p>");
        printWriter.println("<p><b>List Price:</b> "+listPrice+"</p>");
        printWriter.println("<p><b>Discount Percent:</b> "+discountPer+"</p><br>");
        printWriter.println("<p><b>Discount Amount:</b> "+discountAmount+"</p>");
        printWriter.println("<p><b>Discount Price:</b> "+discountPrice+"</p>");
        printWriter.println("</html>");
    }
}
