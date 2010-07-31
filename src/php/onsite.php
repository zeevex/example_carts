<?php
require("zesa_config.php");

$EXAMPLE_CANCEL_RETURN_URL = "$EXAMPLE_HOST_URL/onsite_cart_cancel.php";
$EXAMPLE_RETURN_URL= "$EXAMPLE_HOST_URL/onsite_cart_return.php";

//log_request("DEBUG", "Beging request with random order #$RANDOM_ORDER");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ZEEVEX | PHP Example Onsite Cart</title>
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<link href="css/global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.google.com/jsapi"></script>
<script type="text/javascript" charset="utf-8">
	google.load("jquery", "1.3");
</script>
<!--

        <script type="text/javascript" src="http://sandbox.zeevex.com/javascripts/jquery.js"></script>
        -->
<script type="text/javascript" src="http://sandbox.zeevex.com/javascripts/jquery/jquery.form.js"></script>
<script type="text/javascript" src="games/zeevex_racing.js"></script>
<script src="http://www.google.com/jsapi" type="text/javascript"></script>
<script type="text/javascript">
            <!--
            var balance = 5;

            function getMovie(movieName) {
                if (navigator.appName.indexOf("Microsoft") != -1) {
                    return window[movieName];
                } else {
                    return document[movieName];
                }

            }

            function getBalance() {
                // alert("it works");
                return balance;
            }

            function playGame() {

                return false;
                
            }

            function paymentCanceled() {
                $.prettyPhoto.close();
            }

            function paymentComplete() {
                balance = balance + 10;
                zr = getMovie("zeevex_racing"); 
                zr.addTokens();
                $.prettyPhoto.close();
            }

            function setBalance(n) {
                balance = n;
            }

            function buyTokens(amount) {

                var form = document.getElementById("purchaseform");
                form.invoice.value +=1;
                var query = jQuery('#purchaseform').formSerialize();
                var zframe = document.getElementById("zeevex_iframe");
                zframe.href  = '<?php echo $ZESA_ACTION ?>?' + query +'&xframe=1&width=570&height=350';
                $("#zeevex_iframe").trigger('click');
            }


            -->
        </script>
<script src="javascript/jquery.prettyPhoto.js" type="text/javascript" charset="utf-8"></script>
<link rel="stylesheet" href="css/prettyPhoto.css" type="text/css" media="screen" title="prettyPhoto main stylesheet" charset="utf-8" />
<style>

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
#spinner span {
	position: absolute;
	top: 100px;
	left: 220px;
}
h1 {
	color: #3d3d3d
}
#zeevex_iframe {
	height: 700px;
	width: 350px;
	display: none;
}


</style>
</head>
<body>
<div id="wrap" class="clearfix">
  <div id="contentFrame">
    <h1 id="logo">Su</h1>
    <ul id="nav">
      <li id="receipt"><a href="return.php" title="receipt"> View Return Transactions </a></li>
      <li id="onsite_cart"><a href="onsite.php" title="Onsite Cart" >Onsite Cart </a></li>
      <li id="order"><a href="index.php" title="Place another order"> Place PDT order </a></li>
    </ul>
    <div id="contentHome">
      <div id="game">
        <script language="JavaScript" type="text/javascript">
                        /*
                        AC_FL_RunContent(
                        'codebase', 'http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0',
                        'width', '640',
                        'height', '500',
                        'src', 'games/zeevex_racing',
                        'quality', 'high',
                        'pluginspage', 'http://www.adobe.com/go/getflashplayer',
                        'align', 'middle',
                        'play', 'true',
                        'loop', 'true',
                        'scale', 'showall',
                        'wmode', 'window',
                        'devicefont', 'false',
                        'id', 'zeevex_racing',
                        'bgcolor', '#ffffff',
                        'name', 'zeevex_racing',
                        'menu', 'true',
                        'allowFullScreen', 'false',
                        'allowScriptAccess','always',
                        'movie', 'games/zeevex_racing',
                        'salign', ''
                    ); //end AC code */
                    </script>
        <div  style="width:650px;height:500px; background-color: #d57e00; -moz-border-radius: 14px 14px 14px 14px;-webkit-border-radius: 14px;border-radius: 14px;padding:5px;">
          <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="640" height="500" id="zeevex_racing" align="middle">
            <param name="allowScriptAccess" value="always" />
            <param name="allowFullScreen" value="false" />
            <param name="wmode" value="opaque" />
            <param name="movie" value="games/zeevex_racing.swf" />
            <param name="quality" value="high" />
            <param name="bgcolor" value="#ffffff" />
            <embed src="games/zeevex_racing.swf" quality="high" bgcolor="#ffffff" width="640" height="500" name="zeevex_racing" align="middle" wmode="opaque" allowScriptAccess="always" allowFullScreen="false" type="application/x-shockwave-flash" pluginspage="http://www.adobe.com/go/getflashplayer" />
          </object>
        </div>
        <noscript>
        </noscript>
      </div>
      <form action="#" id="purchaseform" name="purchaseform" style="display: none;">
        <input id="cmd" name="cmd" type="hidden" value="_xclick" />
        <input id="currency_code" name="currency_code" type="hidden" value="ZXT" />
        <input id="rm" name="rm" type="hidden" value="0" />
        <input id="iframe" name="iframe" type="hidden" value="1" />
        <input id="business" name="business" type="hidden" value="<?php echo $EXAMPLE_BUSINESS ?>" />
        <input id="invoice" name="invoice" type="hidden" value="<?php echo $EXAMPLE_INVOICE_NUMBER ?>" />
        <input id="item_name" name="item_name" type="hidden" value="<?php echo $EXAMPLE_ITEM_NAME ?>" />
        <input id="item_number" name="item_number" type="hidden" value="<?php echo $EXAMPLE_ITEM_SKU ?>" />
        <input id="amount" name="amount" type="hidden" value="10" />
        <input id="quantity" name="quantity" type="hidden" value="1" />
        <input class="url" type="hidden" name="cancel_return" value="<?php echo $EXAMPLE_CANCEL_RETURN_URL ?>" />
        <input class="url" type="hidden" name="notify_url" value="<?php echo $EXAMPLE_NOTIFY_URL ?>" />
        <input class="url" type="hidden" name="return" value="<?php echo $EXAMPLE_RETURN_URL ?>" />
      </form>
      <br>
      
      <a id="zeevex_iframe"   rel="prettyPhoto"  > 
      </a>
      
	  <script type="text/javascript" charset="utf-8">
                    $(document).ready(function(){
                        $("a[rel^='prettyPhoto']").prettyPhoto();
                    });
      </script>
    </div>
  </div>
</div>
</body>
</html>