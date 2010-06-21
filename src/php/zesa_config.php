<?php
/* 
 * This file is use to configure the example cart for your website domain. At
 * The most you should update the following variables to reflect your
 * environment.
 */
require('common.php');


$ZESA_HOST="test.localhost.zeevex.com";
$ZESA_PORT=4500;
$ZESA_PATH="/cgi-bin/webscr";
$ZESA_ACTION = "http://$ZESA_HOST:$ZESA_PORT$ZESA_PATH";

$EXAMPLE_HOST_URL = "http://phpcart.zeevex.com"; // change this to match your server
$EXAMPLE_CANCEL_URL = "$EXAMPLE_HOST_URL/cart.php";
$EXAMPLE_RECEIPT_URL = "$EXAMPLE_HOST_URL/receipt.php";
$EXAMPLE_IPN_URL = "$EXAMPLE_HOST_URL/ipn.php";
$EXAMPLE_INVOICE_NUMBER = time();

$EXAMPLE_ITEM_NAME = "Ring of Power";
$EXAMPLE_ITEM_SKU  = rand(2000,3000);


$EXAMPLE_BUSINESS = "admin@zeevex.com";
$IPN_LOG="ipn.log";
$RANDOM_ORDER = rand(1, 1000);

define('IPN_LOG',"ipn.log");



?>
