<%@LANGUAGE="VBSCRIPT" %>
<!--#include file="common.asp"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>ZEEVEX | ASPX Example Cart</title>
<meta http-equiv="Content-type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="Content-Language" content="en-us" />
<meta http-equiv="refresh" content="10">
<link href="css/global.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="wrap" class="clearfix">
  <div id="contentFrame">
    <h1 id="logo">Su</h1>
    <ul id="nav">

      <li id="receipt"><a href="return.asp" title="receipt"> View Return Transactions </a></li>
      <li id="onsite_cart"><a href="onsite.asp" title="Onsite Cart" >Onsite Cart </a></li>
      <li id="order"><a href="default.asp" title="Place another order"> Place PDT order </a></li>
    </ul>
    <div id="contentHome">
      <p>&nbsp;</p>
      
                  <fieldset >
                <legend>ZEEVEX Receipt Redirect Params Read-Only</legend>
                
                <div class="clear forminput span-7">
                <label for="txn_id">txn_id</label><input type="text" name="txn_id" value="<%= Request.QueryString("txn_id")  %>" readonly />
                </div>
                <div class="forminput span-7 last">
                <label for="tx">tx</label><input type="text" name="tx" value="<%= Request.QueryString("tx")  %>" readonly />
				</div>
            </fieldset>


            <fieldset >
                <legend>IPN Log</legend>
              	<div style="width: 600px">
                   	<%= Print_Log() %>
                </div>

            </fieldset>
      
      
  
      <p>&nbsp;</p>
    </div>
   
  </div>
</div>
</body>
</html>