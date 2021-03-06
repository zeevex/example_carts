﻿<%@ Page Language="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">
    Dim config As NameValueCollection = ConfigurationSettings.GetConfig("zesaConfig")
    Dim ZESA_ACTION As String = config("ZESA_ACTION")
    Dim EXAMPLE_BUSINESS As String = config("EXAMPLE_BUSINESS")
    Dim EXAMPLE_CANCEL_RETURN_URL As String = config("EXAMPLE_CANCEL_RETURN_URL")
    Dim EXAMPLE_RETURN_URL As String = config("EXAMPLE_RETURN_URL")
    Dim EXAMPLE_NOTIFY_URL As String = config("EXAMPLE_NOTIFY_URL")
    Dim EXAMPLE_RANDOM_INVOICE_NUMBER As Integer = RandomNumber(1000, 10000) 'Random.Next(1000)
    Dim EXAMPLE_RANDOM_ORDER As Integer = RandomNumber(10000, 20000) 'Random.Next(10000)
    
    Function RandomNumber(ByVal intHighestNumber, ByVal intLowestNumber)
        Randomize()
        RandomNumber = Int(Rnd * intHighestNumber) + intLowestNumber
    End Function
</script>  

<html>
    <head>
        <title> ZEEVEX: Test Cart</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    </head>
    <body>
    
        <form action="<%= ZESA_ACTION %>" >

            <div  class="border" >
                <fieldset >
                    <legend>Read-Only</legend>
                    <label for="rm">rm</label><input type="text" name="rm" value="0" readonly />
                    <label for="cmd">cmd</label><input type="text" name="cmd" value="_xclick" readonly/><br/>
                    <label for="currency_code">currency_code</label><input type="text" name="currency_code" value="USD" readonly />
                    <label for="payment_action">payment_action</label><input type="text" name="payment_action" value="sale" readonly />
                </fieldset>  </div>
            <div  class="border" >
                <fieldset >
                    <legend>Personal Info</legend>
                    <label for="first_name">first_name</label> <input type="text" name="first_name" value="John" /> <br/>
                    <label for="last_name">last_name</label> <input type="text" name="last_name" value="Doe" /> <br/>
                    <label for="street_address">address</label> <input type="text" name="street_address" value="250 Williams St. Suite M-100" /> <br/>
      
                    <label for="city">city</label> <input type="text" name="city" value="Atlanta" /> <br/>
                    <label for="zip">zip</label> <input type="text" name="zip" value="30303" /> <br/>

                    <label for="country">country</label> <input type="text" name="country" value="US" /> <br/>

                    <label for="custom">custom</label> <input type="text" name="custom" value="<%= EXAMPLE_RANDOM_ORDER %>" /> <br/>

                </fieldset>

            </div>
            <div  class="border" >
            <fieldset >
                <legend>API Info</legend>
                <label for="business">business</label> <input type="text" name="business" value="<%= EXAMPLE_BUSINESS %>" /> <br/>

                <label for="amount">amount</label> <input type="text" name="amount" value="17.76" /> <br/>

                <label for="invoice">invoice</label> <input type="text" name="invoice" value="<%= EXAMPLE_RANDOM_INVOICE_NUMBER %>" /> <br/>
                <label for="item_name">item_name</label> <input type="text" name="item_name" value="Liberty Bell" /> <br/>

                <label for="lc">lc</label> <input type="text" name="lc" value="en" /> <br/>
                <label for="no_note">no_note</label> <input type="text" name="no_note" value="1" /> <br/>


                <label for="cancel_return">cancel_return</label> <input class="url" type="text" name="cancel_return" value="<%= EXAMPLE_CANCEL_RETURN_URL %>" size="50" /> <br/>
                <label for="notify_url">notify_url</label> <input class="url"type="text" name="notify_url" value="<%= EXAMPLE_NOTIFY_URL %>" /> <br/>
                <label for="return">return</label> <input class="url"type="text" name="return" value="<%= EXAMPLE_RETURN_URL %>" /> <br/>


            </fieldset>
            </div>

            <div class="border">
                <input type="submit" value="Purchase"/>
            </div>

        </form>

    </body>
</html>
