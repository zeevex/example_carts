<%@ Page Language="C#" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Text" %>
<script runat="server">
    NameValueCollection config = (NameValueCollection)ConfigurationSettings.GetConfig("zesaConfig");
    String ZESA_ACTION;
    String IPN_LOG;
    void Page_Load() {
        ZESA_ACTION = config.Get("ZESA_ACTION");
        IPN_LOG = config.Get("IPN_LOG");
    }

    String Print_Log()
    {
        String filePath = Server.MapPath("~")+IPN_LOG;
        
        StringBuilder buffer = new StringBuilder();
        string read = null;

        if (File.Exists(filePath))
        {
            StreamReader s = File.OpenText(filePath);
            while ((read = s.ReadLine()) != null)
            {
                buffer.Append(read);
            }
            s.Close();
        }
        else
        {
            buffer.Append("No log exist");
        }
        
        return buffer.ToString();
    }
</script>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"   "http://www.w3.org/TR/html4/loose.dtd">
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
                <label for="txn_id">txn_id</label><input style="width:200px" type="text" name="txn_id" value="<%= Request.QueryString["txn_id"]  %>" readonly /><br/>
                <label for="tx">tx</label><input style="width:200px" type="text" name="tx" value="<%= Request.QueryString["tx"]  %>" readonly />

            </fieldset>


            <fieldset >
                <legend>IPN Log</legend>

                <%=  Print_Log() %>

            </fieldset>


            <br/>
            <a href="cart.aspx">Place another order</a>
        </form>
    </body>
</html>
