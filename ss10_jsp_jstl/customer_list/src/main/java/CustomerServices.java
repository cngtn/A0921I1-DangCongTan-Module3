import java.util.HashMap;
import java.util.Map;

public class CustomerServices {
    private static Map<Integer, Customer> customers;
    static {
        customers = new HashMap<>();
        customers.add(1, new Customer("Công Tấn", "25/03/2001", "123/39 Cù Chinh Lan", "https://unsplash.com/photos/oXVCgaDqX30"));
    }
}
