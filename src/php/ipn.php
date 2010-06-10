<?php
require("zesa_config.php");


if (isset($_POST['custom'])) {
    $order_id = $_POST['custom'];
} else {
    $order_id = 0;
}

//$this->load->model('checkout/order');

//$order_info = $this->model_checkout_order->getOrder($order_id);

if ($order_info) {
    $request = 'cmd=_notify-validate';

    foreach ($_POST as $key => $value) {
        $request .= '&' . $key . '=' . urlencode(stripslashes(html_entity_decode($value, ENT_QUOTES, 'UTF-8')));
    }

    if (extension_loaded('curl')) {

        $ch = curl_init($ZESA_ACTION);

        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $request);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_TIMEOUT, 30);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

        $response = curl_exec($ch);
        if (strcmp($response, 'VERIFIED') == 0 || $_POST['payment_status'] == 'Completed') {
        //$this->model_checkout_order->confirm($order_id, $this->config->get('zx_standard_order_status_id'));
            //RECORD SUCCESSFUL
        } else {
            //RECORD FAIL
        // $this->model_checkout_order->confirm($order_id, $this->config->get('config_order_status_id'));
        }

        curl_close($ch);
    } else {
        $header  = 'POST /cgi-bin/webscr HTTP/1.0' . "\r\n";
        $header .= 'Content-Type: application/x-www-form-urlencoded' . "\r\n";
        $header .= 'Content-Length: ' . strlen(utf8_decode($request)) . "\r\n";
        $header .= 'Connection: close'  ."\r\n\r\n";
        $fp = fsockopen($ZESA_HOST, $ZESA_PORT, $errno, $errstr, 30);

        if ($fp) {
            fputs($fp, $header . $request);

            while (!feof($fp)) {
                $response = fgets($fp, 1024);
                if (strcmp($response, 'VERIFIED') == 0) {

                //RECORD SUCCESSFUL
                //$this->model_checkout_order->confirm($order_id, $this->config->get('zx_standard_order_status_id'));
                } else {
                //RECORD FAIL
                // $this->model_checkout_order->confirm($order_id, $this->config->get('config_order_status_id'));
                }
            }
            fclose($fp);
        } //if ($fp) {
    } // if (extension_loaded('curl')) {
} //if ($order_info) {



?>
