<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="common.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
                <label for="txn_id">txn_id</label><input style="width:200px" type="text" name="txn_id" value="<%= Request.QueryString("txn_id")  %>" readonly /><br/>
                <label for="tx">tx</label><input style="width:200px" type="text" name="tx" value="<%= Request.QueryString("tx") %>" readonly />

            </fieldset>
			

            <fieldset >
                <legend>IPN Log</legend>
               	<%= Print_Log() %>
            </fieldset>


            <br/>
            <a href="cart.asp">Place another order</a>
        </form>
    </body>
</html>
