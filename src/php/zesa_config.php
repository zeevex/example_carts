<?php
/* 
 * This file is use to configure the example cart for your website domain. At
 * The most you should update the following variables to reflect your
 * environment.
 */
$ZESA_HOST="localhost";
$ZESA_PORT=4500;
$ZESA_PATH="/cgi-bin/webscr";
$ZESA_ACTION = "http://$ZESA_HOST:$ZESA_PORT$ZESA_PATH";

$EXAMPLE_HOST_URL = "http://phpcart.zeevex.com"; // change this to match your server
$EXAMPLE_CANCEL_URL = "$EXAMPLE_HOST_URL/cart.php";
$EXAMPLE_RECEIPT_URL = "$EXAMPLE_HOST_URL/receipt.php";
$EXAMPLE_IPN_URL = "$EXAMPLE_HOST_URL/ipn.php";
$IPN_LOG="ipn.log";

/*
 *  The
 *
 *
 */

function log_request($from, $message) {
    global $IPN_LOG;

    if($fp = fopen($IPN_LOG,"a")) {
        $buffer = "<table width=100% border=1><tr><td valign='top' width=100>".htmlspecialchars($from)."</td><td>".htmlspecialchars($message)."</td></tr></table>\n";
        fputs($fp,$buffer);
        fclose($fp);
    } 
}

function print_log() {
    global $IPN_LOG;

    if (is_readable($IPN_LOG)) {
        $fp = fopen($IPN_LOG,"r");
        $buffer = "";
        while (!feof($fp)) {
            $line = fgets($fp,1024);
            $buffer .= $line."</br>";
        }
        
        return  $buffer;
    }

    return "No log content found. Perhaps the directory where this PHP file is stored is not writable.";

}

?>
