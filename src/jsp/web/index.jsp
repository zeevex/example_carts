<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file="common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>ZEEVEX | JSP Example Cart</title>
        <meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
        <meta http-equiv="Content-Language" content="en-us" />
        <link href="css/global.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div id="wrap" class="clearfix">
            <div id="contentFrame">
                <h1 id="logo">Super Merchant</h1>
                <ul id="nav">

                    <li id="receipt"><a href="return.jsp" title="receipt"> View Return Transactions </a></li>
                    <li id="onsite_cart"><a href="onsite.jsp" title="Onsite Cart" >Onsite Cart </a></li>
                    <li id="order"><a href="index.jsp" title="Place another order"> Place PDT order </a></li>
                </ul>
                <div id="contentHome">
                    <p>&nbsp;</p>
                    <form action="<%= ZESA_ACTION %>" >
                        <fieldset >
                            <legend>Read-Only</legend>
                            <div class="clear forminput span-4">
                                <label for="rm">rm</label>
                                <input type="text" name="rm" value="0" readonly />
                            </div>
                            <div class="forminput span-4">
                                <label for="cmd">cmd</label>
                                <input type="text" name="cmd" value="_xclick" readonly/>
                            </div>
                            <div class="forminput span-4">
                                <label for="currency_code">currency_code</label>
                                <input type="text" name="currency_code" value="USD" readonly />
                            </div>
                            <div class="forminput span-4">
                                <label for="payment_action">payment_action</label>
                                <input type="text" name="payment_action" value="sale" readonly />
                            </div>
                        </fieldset>
                        <fieldset >
                            <legend>API Info</legend>
                            <div class="clear forminput span-4">
                                <label for="business">business</label>
                                <input type="text" name="business" value="<%= EXAMPLE_BUSINESS %>" />
                                <br/>
                            </div>
                            <div class="forminput span-4">
                                <label for="amount">amount</label>
                                <input type="text" name="amount" value="17.76" />
                            </div>
                            <div class="forminput span-4">
                                <label for="invoice">invoice</label>
                                <input type="text" name="invoice" value="<%=  RANDOM_ORDER %>" />
                            </div>
                            <div class="forminput span-4 last">
                                <label for="brand">brand</label>
                                <input type="text" name="brand" value="<%=  EXAMPLE_BRAND    %>" />
                            </div>
                            <div class="clear forminput span-4 ">
                                <label for="item_name">item_name</label>
                                <input type="text" name="item_name" value="Bit O Mead" />
                            </div>
                            <div class="forminput span-4">
                                <label for="lc">lc</label>
                                <input type="text" name="lc" value="en" />
                            </div>
                            <div class="forminput span-4 last">
                                <label for="no_note">no_note</label>
                                <input type="text" name="no_note" value="1" />
                                <br/>
                            </div>
                            <div class="clear forminput span-8 ">
                                <label for="cancel_return">cancel_return</label>
                                <input  type="text" name="cancel_return" value="<%= EXAMPLE_CANCEL_RETURN_URL %>" size="50" />
                            </div>
                            <div class="clear forminput span-8">
                                <label for="return">return</label>
                                <input type="text" name="return" value="<%= EXAMPLE_RETURN_URL %>" />
                            </div>
                            <div class="clear forminput span-8">
                                <label for="notify_url">notify_url</label>
                                <input class="url"type="text" name="notify_url" value="<%= EXAMPLE_NOTIFY_URL %>" />
                                <br/>
                            </div>
                        </fieldset>
                        <fieldset>
                            <legend>Personal Info</legend>
                            <div class="clear forminput span-4">
                                <label for="first_name">first_name</label>
                                <input type="text" value="John" name="first_name">
                            </div>
                            <div class="forminput span-4">
                                <label for="last_name">last_name</label>
                                <input type="text" value="Doe" name="last_name">
                            </div>
                            <div class="forminput span-8 last">
                                <label for="email">email</label>
                                <input type="text" value="your_email@merchant.com" name="email">
                            </div>
                            <div class="clearfix forminput span-8">
                                <label for="address1">address</label>
                                <input type="text" value="50 Williams Street Northwest" name="address">
                            </div>
                            <div class="forminput span-4">
                                <label for="city">city</label>
                                <input type="text" value="Atlanta" name="city">
                            </div>
                            <div class="clearfix forminput span-4" last>
                                <label for="zip">zip</label>
                                <input type="text" value="30303" name="zip">
                            </div>
                            <div class="clearfix forminput span-4">
                                <label for="country">country</label>
                                <input type="text" value="US" name="country">
                            </div>
                            <div class="clearfix forminput span-4">
                                <label for="custom">custom</label>
                                <input type="text" value="<%= RANDOM_ORDER %>" name="custom">
                            </div>
                            <div class="forminput span-4 last">
                                <label for="address_override">address_override</label>
                                <input type="text" value="0" name="address_override">
                            </div>
                            <br>
                        </fieldset>
                        <div class="submit">
                            <input type="submit" name="button" id="button" value="Buy with Zeevex" />
                        </div>
                    </form>
                    <p>&nbsp;</p>
                </div>

            </div>
        </div>
    </body>
</html>
