<%@ page import="java.util.*,java.net.*,java.io.*" %>
<%
            Properties properties = new Properties();

        //    properties.load(this.getServletContext().getResourceAsStream("Zeevex.properties"));
            properties.load( new BufferedReader( new FileReader( new File(this.getServletContext().getRealPath("Zeevex.properties")) )));
           

            String ZESA_HOST = properties.getProperty("ZESA_HOST", "sandbox.zeevex.com");
            String ZESA_PORT = properties.getProperty("ZESA_PORT", "80");
            String ZESA_PATH = properties.getProperty("ZESA_PATH", "/cgi-bin/webscr");
            String ZESA_ACTION = properties.getProperty("ZESA_ACTION", "http://" + ZESA_HOST + ":" + ZESA_PORT + ZESA_PATH);

            String EXAMPLE_HOST_URL = properties.getProperty("EXAMPLE_HOST_URL", "http://jsp.examplecart.zbox.zeevex.com"); // change this to match your server
            String EXAMPLE_CANCEL_RETURN_URL = properties.getProperty("EXAMPLE_CANCEL_RETURN_URL", EXAMPLE_HOST_URL + "/index.jsp");
            String EXAMPLE_RETURN_URL = properties.getProperty("EXAMPLE_RETURN_URL", EXAMPLE_HOST_URL + "/return.jsp");
            String EXAMPLE_NOTIFY_URL = properties.getProperty("EXAMPLE_NOTIFY_URL", EXAMPLE_HOST_URL + "/ipn.jsp");
            String EXAMPLE_INVOICE_NUMBER = properties.getProperty("EXAMPLE_INVOICE_NUMBER", new Date().getTime() + "");

            String EXAMPLE_ITEM_NAME = properties.getProperty("EXAMPLE_ITEM_NAME", "Ring of Power");
            String EXAMPLE_ITEM_SKU = properties.getProperty("EXAMPLE_ITEM_SKU", "" + (2000 + new Random().nextInt(1000))); //rand(2000,3000) ) ;

            String EXAMPLE_BUSINESS = properties.getProperty("EXAMPLE_BUSINESS", "admin@zeevex.com");
            String EXAMPLE_BRAND = properties.getProperty("EXAMPLE_BRAND", "anonymous_brand");
            
            String IPN_LOG = properties.getProperty("IPN_LOG", "ipn.log");
            String RANDOM_ORDER = properties.getProperty("RANDOM_ORDER", "" + (new Random().nextInt(1000)));
%>
<%!
    void log_message(String type, String message) {

        StringBuffer log = (StringBuffer) this.getServletContext().getAttribute("IPN_LOG");

        if (log == null) {

            this.getServletContext().setAttribute("IPN_LOG", log = new StringBuffer());
        }

        log.append("<div class='log_row'><div class='log_type'>").append(type).append("</div><div class='log_message'>").append(message).append("</div></div>\n");
    }

    void clear_log() {
        this.getServletContext().setAttribute("IPN_LOG", new StringBuffer());
    }

    String print_log() {

        StringBuffer log = (StringBuffer) this.getServletContext().getAttribute("IPN_LOG");

        return log != null ? log.toString() : "";
    }
%>