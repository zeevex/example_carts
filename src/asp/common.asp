<%
dim	ZESA_HOST
dim ZESA_PORT
dim ZESA_PATH
dim ZESA_ACTION
dim EXAMPLE_HOST_URL
dim EXAMPLE_CANCEL_URL
dim EXAMPLE_RECEIPT_URL
dim EXAMPLE_IPN_URL
dim EXAMPLE_INVOICE_NUMBER
dim EXAMPLE_ITEM_NAME
dim EXAMPLE_ITEM_SKU
dim EXAMPLE_BUSINESS
dim EXAMPLE_CUSTOMER_EMAIL
dim IPN_LOG
dim RANDOM_ORDER



ZESA_HOST = "sandbox.zeevex.com"
ZESA_PORT = 80
ZESA_PATH = "/cgi-bin/webscr"
ZESA_ACTION = "http://" & ZESA_HOST & ":" & ZESA_PORT & ZESA_PATH



EXAMPLE_CUSTOMER_EMAIL = "customer@yourwebsite.com"
EXAMPLE_HOST_URL = "http://yourwebsite.com/examplecart"
EXAMPLE_CANCEL_URL = EXAMPLE_HOST_URL & "/cart.asp"
EXAMPLE_RECEIPT_URL = EXAMPLE_HOST_URL & "/receipt.asp"
EXAMPLE_IPN_URL = EXAMPLE_HOST_URL &"/ipn.asp"
EXAMPLE_INVOICE_NUMBER = RandomNumber(1000,10000)
EXAMPLE_ITEM_NAME = "Ring of Power"
EXAMPLE_ITEM_SKU  = RandomNumber(2000,3000)
EXAMPLE_BUSINESS = "admin@zeevex.com"
RANDOM_ORDER = RandomNumber(1, 1000)
IPN_LOG="ipn.log"

Function RandomNumber(intHighestNumber, intLowestNumber )
	Randomize
	RandomNumber = Int(Rnd * intHighestNumber) + intLowestNumber
End Function

Function Log_Message(kind,message)

     dim filePath, file
     set fso = CreateObject("Scripting.FileSystemObject")
	 filePath = Server.MapPath(IPN_LOG)
     'If the file already exists give an error message.
	
     if fso.FileExists(filePath) then
    	set file = fso.opentextfile(filePath, 8)  
     else
        set file = fso.CreateTextFile(filePath)   
     end if
	 
	 file.WriteLine("<table width=100% border=1><tr><td valign='top' width=100>" & kind & "</td><td>" & message & "</td></tr></table>")

     file.Close()
	 
	'Log_Message = Nothing

End Function

Function Print_Log()
	Dim objFSO, objFile, strAllFile, filePath
	Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
	filePath = Server.MapPath(IPN_LOG)
	strAllFile = "No Content" 
	

	If objFSO.FileExists(filePath) then
	
		Set objFile = objFSO.OpenTextFile(filePath)
		
	  	if Not(objFile.AtEndOfStream) Then
			strAllFile = objFile.ReadAll
		End If
		
		objFile.Close
	End if
	
	Set objFile = Nothing
	Set objFSO = Nothing
	
	Print_Log =  strAllFile 
End Function



Sub StoreData()
Dim sTemp

	
End Sub


%>
