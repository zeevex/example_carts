<%@ Page Language="VB" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.IO" %>

<script runat="server">
    Dim config As NameValueCollection = ConfigurationSettings.GetConfig("zesaConfig")
    Dim ZESA_ACTION As String = config("ZESA_ACTION")
    Dim IPN_LOG = config("IPN_LOG")


    Public Function Log_Message(ByVal type As String, ByVal message As String) As Boolean
        
        Dim logPath As String = Server.MapPath(IPN_LOG)
        Dim file As FileStream
        Dim f As IO.File

        If (f.Exists(logPath)) Then
            file = New FileStream(logPath, FileMode.Append, FileAccess.Write)
        Else
            file = New FileStream(logPath, FileMode.Create, FileAccess.ReadWrite)
        End If

        Dim sw As New StreamWriter(file, System.Text.Encoding.Default)
        If (f.Exists(logPath)) Then
            sw.BaseStream.Seek(0, SeekOrigin.End)
        Else
            sw.BaseStream.Seek(0, SeekOrigin.Begin)
        End If

        sw.Write("<table><tr><td>" & type & "</td><td>" & message & "</td></tr></table>")
        
      
        sw.Close()
    End Function
    
    
   
    Sub Page_Load()
        'Post back to either sandbox or live
       
        Dim httpWebRequest As HttpWebRequest = CType(WebRequest.Create(ZESA_ACTION), HttpWebRequest)

        'Set values for the request back
        httpWebRequest.Method = "POST"
        httpWebRequest.ContentType = "application/x-www-form-urlencoded"
  
   
        Dim Param() As Byte = Request.BinaryRead(HttpContext.Current.Request.ContentLength)
        Dim strRequest As String = Encoding.ASCII.GetString(Param)
        strRequest = strRequest + "&cmd=_notify-validate"
        httpWebRequest.ContentLength = strRequest.Length
        Log_Message("IN", strRequest)
        
        
        'for proxy
        'Dim proxy As New WebProxy(New System.Uri("http://url:port#"))
        'request.Proxy = proxy

        'Send the request to Zeevex and get the response
        Dim streamOut As StreamWriter = New StreamWriter(httpWebRequest.GetRequestStream(), Encoding.ASCII)
        streamOut.Write(strRequest)
        streamOut.Close()
        Log_Message("OUT", strRequest)
        
        Dim streamIn As StreamReader = New StreamReader(httpWebRequest.GetResponse().GetResponseStream())
        Dim strResponse As String = streamIn.ReadToEnd()
        streamIn.Close()

        If strResponse = "VERIFIED" Then
            'check the payment_status is Completed
            'check that txn_id has not been previously processed
            'check that payment_amount/payment_currency are correct
            'process payment
            
            
        ElseIf strResponse = "INVALID" Then
            'log for manual investigation
        Else
            'Response wasn't VERIFIED or INVALID, log for manual investigation
        End If
        
        Log_Message("IN", strResponse)
    End Sub
</script>