using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;

public partial class TaiKhoan : System.Web.UI.Page
{
    string conStr = WebConfigurationManager.ConnectionStrings["Ass_GD2ConnectionString"].ToString(); // chuỗi kết nối từ web.config
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["ID"] == null && Request.Cookies["ID"] == null) Response.Redirect("~/DangNhap.aspx");
            Loadinfo();
        }
    }
    
    private void Loadinfo()
    {
        string id = "";
        if (Session["ID"] != null) { id = Session["ID"].ToString(); }
        else { id = Request.Cookies["ID"].Value; }

        SqlConnection conn = new SqlConnection(conStr);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM [user] WHERE [user_id] = " + id;
        cmd.Connection = conn;
        conn.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            rd.Read();
            txtName.Text = rd.GetString(rd.GetOrdinal("name"));
            txtAdd.Text = rd.GetString(rd.GetOrdinal("address"));
            txtPhone.Text = rd.GetInt32(rd.GetOrdinal("phone")).ToString();
            txtEmail.Text = rd.GetString(rd.GetOrdinal("email"));
        }
        conn.Close();
        conn.Dispose();
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(conStr);
        string sql = "SELECT * From [user] WHERE email=@User AND passwd=@Pass";
        SqlCommand cmd = new SqlCommand(sql, conn);
        cmd.Parameters.AddWithValue("User", txtEmail.Text);
        cmd.Parameters.AddWithValue("Pass", txtPass.Text);
        conn.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            string id = "";
            if (Session["ID"] != null) { id = Session["ID"].ToString(); }
            else { id = Request.Cookies["ID"].Value; }

            SqlConnection conn2 = new SqlConnection(conStr);
            //SQL statement to update a product
            string sql2 = String.Format("UPDATE [user] SET name = N'{0}', phone='{1}', address = N'{2}' WHERE user_id ='{3}'", txtName.Text, txtPhone.Text, txtAdd.Text, id);
            SqlCommand cmd2 = new SqlCommand(sql2, conn2);
            conn2.Open();
            cmd2.ExecuteNonQuery(); // thuc thi
            conn2.Close();
            conn2.Dispose();
                lblMsg.Visible = true;
                lblMsg.Text = "Thay đổi đã được lưu lại!";
        }
        else
        {
            lblMsg.Visible = true;
            lblMsg.Text = "Mật khẩu xác nhận không hợp lệ!";
        }
        conn.Close();
        conn.Dispose();
    }
}