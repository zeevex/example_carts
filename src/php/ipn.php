<?php
require("zesa_config.php");


if (isset($_POST['custom'])) {
    $order_id = $_POST['custom'];
} else {
    $order_id = 0;
}

log_request("DEBUG","Processing IPN order: $order_id");


if ($order_id) {
    $request = 'cmd=_notify-validate';
    
    
    foreach ($_POST as $key => $value) {
        $request .= '&' . $key . '=' . urlencode(stripslashes(html_entity_decode($value, ENT_QUOTES, 'UTF-8')));
    }
    log_request("RECEIVED",$request);
    if (extension_loaded('curl') && false) {  ### disabled curl execution

        $ch = curl_init($ZESA_ACTION);

        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $request);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

        $response = curl_exec($ch);

        log_request("IN",$response);

        if (strcmp($response, 'VERIFIED') == 0 || $_POST['payment_status'] == 'Completed') {
            //RECORD SUCCESSFUL
        } else {
            //RECORD FAIL
        }

        curl_close($ch);
    } else {
        $header  = "POST $ZESA_PATH HTTP/1.1" . "\r\n"; #Host: opencart.zeevex.com
        $header .= "Host: $ZESA_HOST:$ZESA_PORT" . "\r\n";
        $header .= 'Content-Type: application/x-www-form-urlencoded' . "\r\n";
        $header .= 'Content-Length: ' . strlen(utf8_decode($request)) . "\r\n";
        $header .= 'Connection: close'  ."\r\n\r\n";
        $fp = fsockopen($ZESA_HOST, $ZESA_PORT, $errno, $errstr, 30);

        if ($fp) {
            fputs($fp, $header . $request);
            log_request("SEND",$header . $request);
            $response = "";
            while (!feof($fp)) {
                $line = fgets($fp, 1024);
                $response .= $line;
          
                if (strcmp($line, 'VERIFIED') == 0 || $_POST['payment_status'] == 'Completed') {
                    log_request("OK","Sucessful transaction");
                //RECORD SUCCESSFUL
                } 
            }

            log_request("RECEIVED",$response);
            
            fclose($fp);
        } else {
            log_request("ERR","Can't connect to: $ZESA_HOST:$ZESA_PORT");
            //if ($fp) {
        }
    } // if (extension_loaded('curl')) {
} //if ($order_info) {



?>
