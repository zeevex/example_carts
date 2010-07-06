<%@LANGUAGE="VBScript"%>
<!--#include file="common.asp"-->
<%
Dim Item_name, Item_number, Payment_status, Payment_amount
Dim Txn_id, Receiver_email, Payer_email
Dim objHttp, str

' read post from Zeevex system and add 'cmd'
str = Request.Form & "&cmd=_notify-validate"


call Log_Message("IN", str)


set objHttp = Server.CreateObject("Msxml2.ServerXMLHTTP")
' set objHttp = Server.CreateObject("Msxml2.ServerXMLHTTP.4.0")
' set objHttp = Server.CreateObject("Microsoft.XMLHTTP")
objHttp.open "POST", ZESA_ACTION, false
objHttp.setRequestHeader "Content-type", "application/x-www-form-urlencoded"
objHttp.Send str
call Log_Message("OUT", "POST "& ZESA_ACTION & "<BR>" & "Content-type: application/x-www-form-urlencoded <br><br>" & str)

' assign posted variables to local variables
Item_name = Request.Form("item_name")
Item_number = Request.Form("item_number")
Payment_status = Request.Form("payment_status")
Payment_amount = Request.Form("mc_gross")
Payment_currency = Request.Form("mc_currency")
Txn_id = Request.Form("txn_id")
Receiver_email = Request.Form("receiver_email")
Payer_email = Request.Form("payer_email")

' Check notification validation
if (objHttp.status <> 200 ) then
' HTTP error handling
elseif (objHttp.responseText = "VERIFIED") then
' check that Payment_status=Completed
' check that Txn_id has not been previously processed
' check that Receiver_email is your Primary PayPal email
' check that Payment_amount/Payment_currency are correct
' process payment
elseif (objHttp.responseText = "INVALID") then
' log for manual investigation
else
' error
end if

call Log_Message("IN",objHttp.responseText)

set objHttp = nothing
%>