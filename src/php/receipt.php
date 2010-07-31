<?php

require("zesa_config.php");

?>
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
        <form action="<?php echo $ZESA_ACTION ?>" >
            <h1> Thank you for your purchase! </h1>
            <fieldset >
                <legend>ZEEVEX Receipt Redirect Params Read-Only</legend>
                <label for="txn_id">txn_id</label><input style="width:200px" type="text" name="txn_id" value="<?php echo $_GET["txn_id"] ?>" readonly /><br/>
                <label for="tx">tx</label><input style="width:200px" type="text" name="tx" value="<?php echo $_GET["tx"] ?>" readonly />

            </fieldset>


            <fieldset >
                <legend>IPN Log</legend>
              
                <?php echo print_log() ?>

            </fieldset>


            <br/>
            
        </form>
    </body>
</html>
