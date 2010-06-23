<%-- 
    Document   : receipt
    Created on : Jun 22, 2010, 9:53:33 PM
    Author     : ghost
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="common.jsp" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title> ZEEVEX: Test Cart </title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="refresh" content="10">
        <style type="text/css" media=screen>
            <!--
            p {font-family: georgia, serif; font-size: x-small;}
            hr {color: #ff9900; height: 1px }
            a:hover {color: #ff0000; text-decoration: none}

            .url {width:400px}
            -->
        </style>
    </head>
    <body>
        <form action="<%= ZESA_ACTION %>" >
            <h1> Thank you for your purchase! </h1>
            <fieldset >
                <legend>ZEEVEX Receipt Redirect Params Read-Only</legend>
                <label for="txn_id">txn_id</label><input style="width:200px" type="text" name="txn_id" value="<%= request.getParameter("txn_id") %>" readonly /><br/>
                <label for="tx">tx</label><input style="width:200px" type="text" name="tx" value="<%= request.getParameter("tx") %>" readonly />

            </fieldset>


            <fieldset >
                <legend>IPN Log</legend>

                <!-- php echo print_log() -->

            </fieldset>


            <br/>
            <a href="cart.jsp">Place another order</a>
        </form>
    </body>
</html>
