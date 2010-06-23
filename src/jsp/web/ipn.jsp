<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ include file="common.jsp" %>
<%
            response.setHeader("pragma", "no-cache");
            response.setHeader("Cache-control", "no-cache");
            response.setHeader("Cache-control", "no-store");


            String order_id = request.getParameter("custom");
            StringBuffer params = new StringBuffer();


//log_request("DEBUG","Processing IPN order: $order_id");

            System.out.println("test me "+new Date().toString());
            
            if (order_id != null) {
                params.append("cmd=_notify-validate");


                Enumeration enumNames = request.getParameterNames();

                while (enumNames.hasMoreElements()) {
                    String name = (String) enumNames.nextElement();
                    params.append('&').append(name).append("=").append(URLEncoder.encode(request.getParameter(name), "UTF-8"));
                }
                System.out.println(params.toString());
                //   log_request("RECEIVED",$request);
                //  String targetURL = ZESA_ACTION;
                ;
                HttpURLConnection connection = null;
                try {
                    //Create connection
                    URL url = new URL(ZESA_ACTION);
                    connection = (HttpURLConnection) url.openConnection();
                    connection.setRequestMethod("POST");
                    connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

                    connection.setRequestProperty("Content-Length", "" + Integer.toString(params.toString().getBytes().length));
                    connection.setRequestProperty("Content-Language", "en-US");

                    connection.setUseCaches(false);
                    connection.setDoInput(true);
                    connection.setDoOutput(true);

                    //Send request
                    DataOutputStream wr = new DataOutputStream(connection.getOutputStream());
                    wr.writeBytes(params.toString());
                    wr.flush();
                    wr.close();

                    //Get Response
                    InputStream is = connection.getInputStream();
                    BufferedReader rd = new BufferedReader(new InputStreamReader(is));
                    String line;
                    StringBuffer zesa_response = new StringBuffer();
                    while ((line = rd.readLine()) != null) {
                        zesa_response.append(line);
                        zesa_response.append('\r');
                    }
                    rd.close();
                    System.out.println("zesa_reponse:"+zesa_response.toString());
                    //return response.toString();

                } catch (Exception e) {

                    e.printStackTrace();
                    //return null;

                } finally {

                    if (connection != null) {
                        connection.disconnect();
                    }
                }
            }
            /*





            $header  = "POST $ZESA_PATH HTTP/1.1" . "\r\n"; #Host: opencart.zeevex.com
            $header .= "Host: $ZESA_HOST:$ZESA_PORT" . "\r\n";
            $header .= 'Content-Type: application/x-www-form-urlencoded' . "\r\n";
            $header .= 'Content-Length: ' . strlen(utf8_decode($request)) . "\r\n";
            $header .= 'Connection: close'  ."\r\n\r\n";
            $fp = fsockopen($ZESA_HOST, $ZESA_PORT, $errno, $errstr, 30);

            if ($fp) {
            fputs($fp, $header . $request);
            log_request("SEND",$header . $request);
            $response = "";
            while (!feof($fp)) {
            $line = fgets($fp, 1024);
            $response .= $line;

            if (strcmp($line, 'VERIFIED') == 0 || $_POST['payment_status'] == 'Completed') {
            log_request("OK","Sucessful transaction");
            //RECORD SUCCESSFUL
            }
            }

            log_request("RECEIVED",$response);

            fclose($fp);
            } else {
            log_request("ERR","Can't connect to: $ZESA_HOST:$ZESA_PORT");
            //if ($fp) {
            }

            } //if ($order_info) {
             */

%>