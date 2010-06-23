<%@ page import="java.util.*" %>
<%
            Properties properties = new Properties();
            
            properties.load(this.getServletContext().getResourceAsStream("Zeevex.properties"));

            
            String ZESA_HOST = properties.getProperty("ZESA_HOST","test.localhost.zeevex.com");
            String ZESA_PORT = properties.getProperty("ZESA_PORT", "4500"  ) ;
            String ZESA_PATH = properties.getProperty("ZESA_PATH", "/cgi-bin/webscr" ) ;
            String ZESA_ACTION = properties.getProperty("ZESA_ACTION", "http://" + ZESA_HOST + ":" + ZESA_PORT + ZESA_PATH ) ;

            String EXAMPLE_HOST_URL = properties.getProperty("EXAMPLE_HOST_URL", "http://phpcart.zeevex.com" ) ; // change this to match your server
            String EXAMPLE_CANCEL_URL = properties.getProperty("EXAMPLE_CANCEL_URL", EXAMPLE_HOST_URL+"/cart.php" ) ;
            String EXAMPLE_RECEIPT_URL = properties.getProperty("EXAMPLE_RECEIPT_URL", EXAMPLE_HOST_URL+"/receipt.php" ) ;
            String EXAMPLE_IPN_URL = properties.getProperty("EXAMPLE_IPN_URL", EXAMPLE_HOST_URL+"/ipn.php" ) ;
            String EXAMPLE_INVOICE_NUMBER = properties.getProperty("EXAMPLE_INVOICE_NUMBER", new Date().getTime() + "" ) ;

            String EXAMPLE_ITEM_NAME = properties.getProperty("EXAMPLE_ITEM_NAME", "Ring of Power" ) ;
            String EXAMPLE_ITEM_SKU = properties.getProperty("EXAMPLE_ITEM_SKU", "" + (2000 + new Random().nextInt(1000)) ); //rand(2000,3000) ) ;

            String EXAMPLE_BUSINESS = properties.getProperty("EXAMPLE_BUSINESS", "admin@zeevex.com" ) ;
            String IPN_LOG = properties.getProperty("IPN_LOG", "ipn.log" ) ;
            String RANDOM_ORDER = properties.getProperty("RANDOM_ORDER", "" + (new Random().nextInt(1000)) ) ;

%>