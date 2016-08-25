﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; // add
using System.Data.SqlClient; // add
using System.Web.Configuration; //add

public partial class MasterPage : System.Web.UI.MasterPage
{

    string conStr = WebConfigurationManager.ConnectionStrings["Ass_GD2ConnectionString"].ToString(); // chuỗi kết nối từ web.config
    

    protected void Page_Load(object sender, EventArgs e)
    {
        LoadIntro();
        ltlMenu.Text = loadmenu(0, 0);
    }

    private void LoadIntro()
    {
        if (Session["Ten"] != null)
        {
            ltlIntro.Text = "<li><font color='red'>Chào <b>" + Session["Ten"] + "</b></font></li><li class='sep-vertical'></li><li><a class='invarseColor' href='TaiKhoan.aspx'>Tài khoản</a></li>";
            ltlIntro2.Text = "<li class='sep-vertical'></li>";
            lkbOut.Visible = true;
        }
        else if(Request.Cookies["TenKH"] != null)
        {
            ltlIntro.Text = "<li><font color='red'>Chào <b>" + Request.Cookies["TenKH"].Value + "</b></font></li><li class='sep-vertical'></li><li><a class='invarseColor' href='TaiKhoan.aspx'>Tài khoản</a></li>";
            ltlIntro2.Text = "<li class='sep-vertical'></li>";
            lkbOut.Visible = true;
        }
        else
        {
            ltlIntro.Text = "<li><a class='invarseColor' href='DangNhap.aspx'>Đăng nhập</a></li><li class='sep-vertical'></li><li><a class='invarseColor' href='DangKy.aspx'>Đăng ký</a></li>";
            lkbOut.Visible = false;
        }
    }

    public string loadmenu(int parentid, int level)
    {
        string result = string.Empty;
        SqlConnection conn = new SqlConnection(conStr);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM [category] WHERE [parent_id] = " + parentid.ToString();
        cmd.Connection = conn;
        conn.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (!rd.HasRows)
            return result;
        else
        {
            if (level > 0) result += "<div><ul>";
            while (rd.Read())
            {
                result += "<li><a href='ChuyenMuc.aspx?ID=" + rd.GetInt32(rd.GetOrdinal("category_id")) + "'>" + rd.GetString(rd.GetOrdinal("category_name")) + "<i class='icon-caret-down'></i></a>";
                result += loadmenu(rd.GetInt32(rd.GetOrdinal("category_id")), level + 1) + "</li>";
            }
            if (level > 0) result += "</ul></div>";
            
        conn.Close();
        conn.Dispose();
        }
            return result;
    }

    protected void lkbOut_Click(object sender, EventArgs e)
    {
        Session.Remove("Ten");
        Session.Remove("ID");

        //XÓa cookie nếu trước đó đã lưu
        HttpCookie a = new HttpCookie("TenKH");
        HttpCookie b = new HttpCookie("ID");
        a.Expires = DateTime.Now.AddDays(-1);   //Thiết lập thời gian hết hiệu lực của cookie = trước 1 ngày (kể từ bây giờ)
        b.Expires = DateTime.Now.AddDays(-1);
        Response.Cookies.Add(a);
        Response.Cookies.Add(b);

        Response.Redirect("Default.aspx");
    }
}
