<?php
require("zesa_config.php");



log_request("DEBUG", "Beging request with random order #$RANDOM_ORDER");
?>
<html>
    <head>
        <title> ZEEVEX: Test Cart</title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <style type="text/css" media=screen>
            <!--
            p {font-family: georgia, serif; font-size: x-small;}
            hr {color: #ff9900; height: 1px }
            a:hover {color: #ff0000; text-decoration: none}

            .url {width:400px}

            body {
                background:none repeat scroll 0 0 #3D3D3D;
                font:12px 'Lucida Grande',Arial,sans-serif;
            }

            .border {
                -moz-box-shadow:1px 2px 6px rgba(0, 0, 0, 0.5);
                background:none repeat scroll 0 0 #E9EAEE;
                border:2px solid #FFFFFF;
                margin:0 auto;
                padding:10px 10px 10px;
                margin: 10px;
                text-align:center;
                width:460px;

                -moz-border-radius: 14px 14px 14px 14px;-webkit-border-radius: 14px;border-radius: 14px;
            }
            -->
        </style>
    </head>
    <body>

        <form action="<?php echo $ZESA_ACTION ?>" >

            <div  class="border" >
                <fieldset >
                    <legend>Read-Only</legend>
                    <label for="rm">rm</label><input type="text" name="rm" value="0" readonly />
                    <label for="cmd">cmd</label><input type="text" name="cmd" value="_xclick" readonly/><br/>
                    <label for="currency_code">currency_code</label><input type="text" name="currency_code" value="GBP" readonly />
                    <label for="payment_action">payment_action</label><input type="text" name="payment_action" value="sale" readonly />

                </fieldset>  </div>
            <div  class="border" >
                <fieldset >
                    <legend>Personal Info</legend>


                    <label for="address_override">address_override</label> <input type="text" name="address_override" value="0" /> <br/>

                    <label for="email">email</label> <input type="text" name="email" value="jwhitfield@zeevex.com" /> <br/>
                    <label for="first_name">first_name</label> <input type="text" name="first_name" value="John" /> <br/>
                    <label for="last_name">last_name</label> <input type="text" name="last_name" value="Doe" /> <br/>
                    <label for="address1">address1</label> <input type="text" name="address1" value="2451 Cumberland pkwy suite 3235" /> <br/>
                    <label for="address2">address2</label> <input type="text" name="address2" value="" /> <br/>
                    <label for="city">city</label> <input type="text" name="city" value="Atlanta" /> <br/>
                    <label for="zip">zip</label> <input type="text" name="zip" value="" /> <br/>

                    <label for="country">country</label> <input type="text" name="country" value="US" /> <br/>

                    <label for="custom">custom</label> <input type="text" name="custom" value="<?php echo $RANDOM_ORDER ?>" /> <br/>

                </fieldset>

            </div>
            <div  class="border" >
            <fieldset >
                <legend>API Info</legend>
                <label for="business">business</label> <input type="text" name="business" value="<?php echo $EXAMPLE_BUSINESS ?>" /> <br/>

                <label for="brand_id">brand_id</label> <input type="text" name="brand_id" value="<?php echo $EXAMPLE_BRAND_ID ?>" /> <br/>

                <label for="amount">amount</label> <input type="text" name="amount" value="17.76" /> <br/>

                <label for="invoice">invoice</label> <input type="text" name="invoice" value="<?php echo time() ?>" /> <br/>
                <label for="item_name">item_name</label> <input type="text" name="item_name" value="Liberty Bell" /> <br/>

                <label for="lc">lc</label> <input type="text" name="lc" value="en" /> <br/>
                <label for="no_note">no_note</label> <input type="text" name="no_note" value="1" /> <br/>


                <label for="cancel_return">cancel_return</label> <input class="url" type="text" name="cancel_return" value="<?php echo $EXAMPLE_CANCEL_RETURN_URL ?>" size="50" /> <br/>
                <label for="notify_url">notify_url</label> <input class="url"type="text" name="notify_url" value="<?php echo $EXAMPLE_NOTIFY_URL ?>" /> <br/>
                <label for="return">return</label> <input class="url"type="text" name="return" value="<?php echo $EXAMPLE_RETURN_URL ?>" /> <br/>


            </fieldset>
            </div>

            <div class="border">
                <input type="submit" value="Purchase"/>
            </div>

        </form>

    </body>
</html>
