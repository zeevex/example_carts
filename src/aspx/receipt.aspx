<%@ Page Language="VB" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.IO" %>
<script runat="server">
    Dim config As NameValueCollection = ConfigurationSettings.GetConfig("zesaConfig")
    Dim IPN_LOG = config("IPN_LOG")
    Dim ZESA_ACTION As String = config("ZESA_ACTION")
    
    
    Public Function PrintIPNLog() As String
        Dim logPath As String = Server.MapPath("ipn.log")
        Dim strContents As String
        Dim objReader As StreamReader
        Try
            objReader = New StreamReader(logPath)
            strContents = objReader.ReadToEnd()
            objReader.Close()
            Return strContents
        Catch Ex As Exception
            Return ""
        End Try
        
    End Function
</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <title> ZEEVEX: Test Cart </title>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta http-equiv="refresh" content="10">

    </head>
    <body>
        <form action="<%= ZESA_ACTION %>" >
            <h1> Thank you for your purchase!! </h1>
            <fieldset >
                <legend>ZEEVEX Receipt Redirect Params Read-Only</legend>
                <label for="txn_id">txn_id</label><input style="width:200px" type="text" name="txn_id" value="<%= Request.QueryString("txn_id")  %>" readonly /><br/>
                <label for="tx">tx</label><input style="width:200px" type="text" name="tx" value="<%= Request.QueryString("tx")  %>" readonly />

            </fieldset>


            <fieldset >
                <legend>IPN Log</legend>

                <%=PrintIPNLog()%>

            </fieldset>


            <br/>
            <a href="cart.aspx">Place another order</a>
        </form>
    </body>
</html>
