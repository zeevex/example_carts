<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
$ZESA_HOST="localhost";
$ZESA_PORT=4500;
$ZESA_PATH="/cgi-bin/webscr";
$ZESA_ACTION = "http://$ZESA_HOST:$ZESA_PORT$ZESA_PATH";

$EXAMPLE_HOST_URL = "http://phpcart.zeevex.com"; // change this to match your server
$EXAMPLE_CANCEL_URL = "$EXAMPLE_HOST_URL/cart.php";
$EXAMPLE_RECEIPT_URL = "$EXAMPLE_HOST_URL/receipt.php";
$EXAMPLE_IPN_URL = "$EXAMPLE_HOST_URL/ipn.php";

define("IPN_LOG", "ipn.log" );


function log_request($from, $message) {

    $fp = fopen(IPN_LOG,"a");

    $buffer = "<table><tr><td>$from</td><td>$message</td></tr></table>";
    #fputs($fp, "$from||\n$message\n!!\n");
    fputs($fp,$buffer);
    fclose($fp);
}

function print_log() {
    

    if (is_readable(IPN_LOG)) {
        $fp = fopen(IPN_LOG,"r");
        $buffer = "";
        while (!feof($fp)) {
            $line = fgets($fp,1024);
            $buffer .= "$line</br>";

        }
        
        return  $buffer;

    }

    return "No log content found";

}

?>
