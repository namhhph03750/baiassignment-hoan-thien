using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; // add
using System.Data.SqlClient; // add
using System.Web.Configuration; //add

public partial class ThanhToan : System.Web.UI.Page
{
    string conStr = WebConfigurationManager.ConnectionStrings["Ass_GD2ConnectionString"].ToString(); // chuỗi kết nối từ web.config
    DataTable tb;
    protected void Page_Load(object sender, EventArgs e)
    {
            tb = (DataTable)Session["GioHang"];
            if (tb != null && tongtien(tb) > 0)
            {
                lbltongtien.Text = "<b><font color='blue'><i>Tổng số tiền thanh toán: </i></font><font color='red'>" + format_price(tongtien(tb).ToString()) + " VNĐ</font></b>";
                btnOK.Enabled = true;
            }
            else
            {
                lbltongtien.Text = "<font color='red'><b><i>Bạn chưa có sản phẩm nào để thanh toán!</i></b></font>";
                btnOK.Enabled = false;
            }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        string id = "0";
        if (Request.Cookies["ID"] != null)
        {
            id = Request.Cookies["ID"].Value;
        }
        else if (Session["ID"] != null)
        {
            id = Session["ID"].ToString();
        }        

        SqlConnection conn = new SqlConnection(conStr);

        // add đơn hàng vào bảng orders
        string sql = "INSERT INTO [orders] VALUES(@UserID, @RecName, @RecPhone, @RecAdd, @Sender, @Bank, @PayNum, @Status, @Price, @Notes)";
        SqlCommand cmd = new SqlCommand(sql, conn);
        cmd.Parameters.AddWithValue("UserID", id);
        cmd.Parameters.AddWithValue("RecName", txtRecipient.Text);
        cmd.Parameters.AddWithValue("RecPhone", txtRecipientPhone.Text);
        cmd.Parameters.AddWithValue("RecAdd", txtRecipientAdd.Text);
        cmd.Parameters.AddWithValue("Sender", txtSender.Text);
        cmd.Parameters.AddWithValue("Bank", txtBankname.Text);
        cmd.Parameters.AddWithValue("PayNum", txtPaynum.Text);
        cmd.Parameters.AddWithValue("Status", 1);
        cmd.Parameters.AddWithValue("Price", tongtien(tb));
        cmd.Parameters.AddWithValue("Notes", txtNotes.Text);
        conn.Open();
        cmd.ExecuteNonQuery(); // add đơn hàng
        conn.Close();

        // get id đơn hàng
        string oid = "0"; // id đơn hàng
        string sql2 = "SELECT order_id FROM orders ORDER BY order_id DESC";
        SqlCommand cmd2 = new SqlCommand(sql2, conn);
        conn.Open();
        SqlDataReader rd = cmd2.ExecuteReader();
        if (rd.HasRows)
        {
            rd.Read();
            oid = rd["order_id"].ToString();
        }
        conn.Close();

        for (int i = 0; i < tb.Rows.Count; i++)
        {
            // add đơn hàng vào bảng orders
            string sql1 = "INSERT INTO [product_bills] VALUES(@ID, @ProductID, @ProductNum)";
            SqlCommand cmd1 = new SqlCommand(sql1, conn);
            cmd1.Parameters.AddWithValue("ID", oid);
            cmd1.Parameters.AddWithValue("ProductID", tb.Rows[i]["productid"]);
            cmd1.Parameters.AddWithValue("ProductNum", tb.Rows[i]["quantity"]);
            conn.Open();
            cmd1.ExecuteNonQuery(); // add đơn hàng
            conn.Close();
        }

        Session.Remove("GioHang");

        conn.Dispose();
        Response.Redirect("~/ChiTietDonHang.aspx?Order=" + oid);
        
    }

    private string format_price(string val) // định dạng giá
    {
        val = val.Replace(",", "");
        val = val.Replace(".", "");
        string s = "";
        while (val.Length > 3)
        {
            s = "." + val.Substring(val.Length - 3) + s;
            val = val.Substring(0, val.Length - 3);

        }
        s = val + s;
        return s;
    } // end định dạng giá

    private int tongtien(DataTable tb)
    {
        int tt = 0;
        for (int i = 0; i < tb.Rows.Count; i++)
        {
            tt = tt + int.Parse(tb.Rows[i]["total"].ToString());
        }
        return tt;
    }
    protected void rdbTT_CheckedChanged(object sender, EventArgs e)
    {
        if (rdbTT.Checked && !rdbBank.Checked)
        {
            txtBankname.Enabled = false;
            txtPaynum.Enabled = false;
            txtSender.Enabled = false;
            
        }
    }
    protected void rdbBank_CheckedChanged(object sender, EventArgs e)
    {
        if (rdbBank.Checked && !rdbTT.Checked)
        {
            txtBankname.Enabled = true;
            txtPaynum.Enabled = true;
            txtSender.Enabled = true;
        }
    }


    private void CheckLogin()
    { 
        
    }
}