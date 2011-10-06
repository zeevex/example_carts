<?php
/* 
 * This file is use to configure the example cart for your website domain. At
 * the minimum you should update the following variables to reflect your
 * environment.
 */
require('common.php');


$ZESA_HOST="sandbox.zeevex.com";
$ZESA_PORT=80;
$ZESA_PATH="/cgi-bin/webscr";
$ZESA_ACTION = "http://$ZESA_HOST:$ZESA_PORT$ZESA_PATH";

$EXAMPLE_HOST_URL = "http://yourwebsite.com"; // change this to match your server
$EXAMPLE_CANCEL_RETURN_URL = "$EXAMPLE_HOST_URL/index.php";
$EXAMPLE_RETURN_URL = "$EXAMPLE_HOST_URL/return.php";
$EXAMPLE_NOTIFY_URL = "$EXAMPLE_HOST_URL/ipn.php";
$EXAMPLE_INVOICE_NUMBER = time();

$EXAMPLE_ITEM_NAME = "Ring of Power";
$EXAMPLE_ITEM_SKU  = rand(2000,3000);


$EXAMPLE_BUSINESS = "admin@zeevex.com";
$EXAMPLE_BRAND_ID = "anonymous_brand";

$IPN_LOG="ipn.log";
$RANDOM_ORDER = rand(1, 1000);

define('IPN_LOG',"ipn.log");



?>
