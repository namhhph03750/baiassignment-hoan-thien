using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; // add
using System.Data.SqlClient; // add
using System.Web.Configuration; //add

public partial class Dangnhap : System.Web.UI.Page
{

    string conStr = WebConfigurationManager.ConnectionStrings["Ass_GD2ConnectionString"].ToString(); // chuỗi kết nối từ web.config

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Ten"] != null | Request.Cookies["TenKH"] != null)
        {
            Response.Redirect("~/");
        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(conStr);
        string sql = "Select * From [user] Where email=@User and passwd=@Pass";
        SqlCommand cmd = new SqlCommand(sql, conn);
        cmd.Parameters.AddWithValue("User", txtEmail.Text);
        cmd.Parameters.AddWithValue("Pass", txtPass.Text);
        conn.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            rd.Read();
            Session["Ten"] = rd["name"].ToString(); // lưu session cột name
            Session["ID"] = rd["user_id"].ToString(); // cột id
            if (ckbDangnhap.Checked)
            {
                //lưu thông tin cookie xuống trình duyệt máy khách 
                HttpCookie a = new HttpCookie("TenKH");
                HttpCookie b = new HttpCookie("ID");
                a.Value = rd["name"].ToString();
                a.Expires = DateTime.Now.AddDays(30);   //Thiết lập thời gian hết hiệu lực của cookie = sau 30 ngày
                b.Value = rd["user_id"].ToString();
                b.Expires = DateTime.Now.AddDays(30);
                Response.Cookies.Add(a);
                Response.Cookies.Add(b);
            }
            else
            {
                //XÓa cookie nếu trước đó đã lưu
                HttpCookie a = new HttpCookie("TenKH");
                HttpCookie b = new HttpCookie("ID");
                a.Expires = DateTime.Now.AddDays(-1);   //Thiết lập thời gian hết hiệu lực của cookie = trước 1 ngày (kể từ bây giờ)
                b.Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Add(a);
                Response.Cookies.Add(b);
            }
            
            Response.Redirect("Default.aspx");
        }
        else
        {
            lblMsg.Visible = true;
            lblMsg.Text = "Email hoặc mật khẩu không đúng!";
        }
        conn.Close();
        conn.Dispose();
    }
}