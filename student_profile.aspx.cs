﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class student_profile : System.Web.UI.Page
{
    SqlConnection con;
    String i_path;
    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString);
        con.Open();
        i_path = "../" + Helper.WEBSITE_SUBMITED_PATH;

        if (Session["student_id"] == null)
        {
            Response.Redirect("login.aspx");
        }
        if (Convert.ToBoolean(Session["fine"]) )
        {
            Response.Redirect("student_fine.aspx");
        }

    }
    protected void take_admission(object sender, EventArgs e)
    {
        if (Session["fine"] == null)
        {

            Response.Redirect("student_fine.aspx");
        }
        Response.Redirect("admission.aspx");
    }

}