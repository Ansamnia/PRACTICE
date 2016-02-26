using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Data;
using System.Configuration;
using System.Collections;

using System.Web.Security;

using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Net;
using System.Data.SqlClient;
using System.IO;

namespace WebRole1
{
    public partial class _Default : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DeFault(object sender, EventArgs e)
        {

        }

        protected void ClickSub(object sender, EventArgs e)
        {

            //var oSR = new StreamReader(Request.InputStream);
            //string sContent = oSR.ToString();
            Name1Tbx.Text = Request.Form.ToString();





        }
}







}


   
    