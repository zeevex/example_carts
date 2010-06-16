<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

require("zesa_config.php");

?>
<html>
    <head>
        <title>ZEEVEX Onsite Cart</title>

        <script type="text/javascript" src="http://sandbox.zeevex.com/javascripts/jquery.js"></script>
        <script type="text/javascript" src="http://sandbox.zeevex.com/javascripts/jquery/jquery.form.js"></script>
        <style>
            body { padding: 20px; }
            #payment a, #payment a:visited, #payment a:link, #payment a:active, #payment a:hover {
                text-decoration: none;
                color: inherit;
                border: 0 none;
            }
            .centered { text-align: center;  margin: 0 auto; }
            #zeevex {
                display:none;
                width: 550px;
                height: 380px;
                position: relative;
            }

            #spinner {
                min-height: 10em;
                min-width: 30em;
                position: absolute;
                display: none;
                z-index: 10;
            }

            #spinner span { position: absolute; top: 100px; left: 220px; }

            #zeevex_iframe {

                height: 380px;
                width: 550px;
            }
        </style>
    </head>
    <body>
        <h1>ZEEVEX Onsite Cart </h1>



        <form action="#" id="purchaseform" name="purchaseform" style="display: none;">
            <input id="cmd" name="cmd" type="hidden" value="_xclick" />
            <input id="iframe" name="iframe" type="hidden" value="1" />
            <input id="business" name="business" type="hidden" value="<?php echo $EXAMPLE_BUSINESS ?>" />
            <input id="invoice" name="invoice" type="hidden" value="<?php echo $EXAMPLE_INVOICE_NUMBER ?>" />
            <input id="item_name" name="item_name" type="hidden" value="Leather Purse" />
            <input id="item_number" name="item_number" type="hidden" value="itemsku23591" />
            <input id="amount" name="amount" type="hidden" value="10" />
            <input id="quantity" name="quantity" type="hidden" value="1" />
            <input id="currency_code" name="currency_code" type="hidden" value="ZXT" />
            <input id="rm" name="rm" type="hidden" value="0" />


            <input class="url" type="hidden" name="cancel_return" value="<?php echo $EXAMPLE_CANCEL_URL ?>" /> 
            <input class="url" type="hidden" name="notify_url" value="<?php echo $EXAMPLE_IPN_URL ?>" />
            <input class="url" type="hidden" name="return" value="<?php echo $EXAMPLE_RECEIPT_URL ?>" />


        </form>

        <div id="iframe_container" style="width: 550px; height: 380px; background:black;">



        </div>

        <script type="text/javascript">
            <!--
            // transform the form's inputs into a query string
            var query = jQuery('#purchaseform').formSerialize();

            // dynamically create the iframe
            iframe = document.createElement('IFRAME');
            iframe.id = 'zeevex_iframe';
            iframe.src = '<?php echo $ZESA_ACTION ?>?' + query;
            document.getElementById('iframe_container').appendChild(iframe);

            -->
        </script>

    </body>
</html>