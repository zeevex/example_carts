<%@ Page Language="C#" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="System.IO" %>
<script runat="server">
    NameValueCollection config = (NameValueCollection)ConfigurationSettings.GetConfig("zesaConfig");
    String ZESA_ACTION;
    String IPN_LOG;
    void Log_Message(String type, String message)
    {
        String filePath = Server.MapPath("~")+IPN_LOG;
     //   if (File.Exists(filePath))
      //  {
            StreamWriter sw = File.AppendText(filePath);
            sw.WriteLine("<table><tr><td>" + type + "</td><td>" + message + "</td></tr></table>");
            sw.Close();
        

      //  }
    }
    
    void Page_Load()
    {
        ZESA_ACTION = config.Get("ZESA_ACTION");
        IPN_LOG = config.Get("IPN_LOG");
        //Post back to either sandbox or live
        string strSandbox = "http://dev.zbox.zeevex.com/cgi-bin/webscr";
        string strLive = "http://sandbox.zeevex.com/cgi-bin/webscr";
        HttpWebRequest req = (HttpWebRequest)WebRequest.Create(strSandbox);
        
        //Set values for the request back
        req.Method = "POST";
        req.ContentType = "application/x-www-form-urlencoded";
        byte[] param = Request.BinaryRead(HttpContext.Current.Request.ContentLength);
        string strRequest = Encoding.ASCII.GetString(param);
        strRequest += "&cmd=_notify-validate";
        req.ContentLength = strRequest.Length;
        Log_Message("IN", strRequest);
        
        //for proxy
        //WebProxy proxy = new WebProxy(new Uri("http://url:port#"));
        //req.Proxy = proxy;

        //Send the request to Zeevex and get the response
        StreamWriter streamOut = new StreamWriter(req.GetRequestStream(), System.Text.Encoding.ASCII);
        streamOut.Write(strRequest);
        
        
        streamOut.Close();

        Log_Message("OUT", strRequest);
        StreamReader streamIn = new StreamReader(req.GetResponse().GetResponseStream());
        string strResponse = streamIn.ReadToEnd();
        streamIn.Close();
        Log_Message("IN", strResponse);
        if (strResponse == "VERIFIED") {
            //check the payment_status is Completed
            //check that txn_id has not been previously processed
            //process payment
        } else if (strResponse == "INVALID") {
            //log for manual investigation
        } else {
            //log response/ipn data for manual investigation
        }
    }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
