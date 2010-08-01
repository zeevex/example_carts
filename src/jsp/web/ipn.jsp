<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ include file="common.jsp" %>
<%
            response.setHeader("pragma", "no-cache");
            response.setHeader("Cache-control", "no-cache");
            response.setHeader("Cache-control", "no-store");


            String order_id = request.getParameter("custom");
            StringBuffer params = new StringBuffer();
            boolean isVerfied = false;


            log_message("DEBUG", "Processing IPN order: " + order_id);


            if (order_id != null) {
                params.append("cmd=_notify-validate");


                Enumeration enumNames = request.getParameterNames();

                while (enumNames.hasMoreElements()) {
                    String name = (String) enumNames.nextElement();
                    params.append('&').append(name).append("=").append(URLEncoder.encode(request.getParameter(name), "UTF-8"));
                }


                log_message("IN",params.toString());

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
                    log_message("OUT", params.toString());

                    //Get Response
                    InputStream is = connection.getInputStream();
                    BufferedReader rd = new BufferedReader(new InputStreamReader(is));
                    String line;
                    StringBuffer zesa_response = new StringBuffer();
                    while ((line = rd.readLine()) != null) {
                        //if (strcmp($line, 'VERIFIED') == 0 || $_POST['payment_status'] == 'Completed')
                        if (line.contains("VERIFIED")) {
                            isVerfied = true;
                        }

                        zesa_response.append(line);
                        zesa_response.append('\r');
                    }
                    rd.close();
                    //System.out.println("zesa_reponse:"+zesa_response.toString());
                    //return response.toString();

                    log_message("IN", zesa_response.toString());

                } catch (Exception e) {

                    e.printStackTrace();
                    //return null;

                } finally {

                    if (connection != null) {
                        connection.disconnect();
                    }
                }
            }

%>