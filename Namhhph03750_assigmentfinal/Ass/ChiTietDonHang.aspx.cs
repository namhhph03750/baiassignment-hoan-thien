using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; // add
using System.Data.SqlClient; // add
using System.Web.Configuration; //add


public partial class ChiTietDonHang : System.Web.UI.Page
{
    string conStr = WebConfigurationManager.ConnectionStrings["Ass_GD2ConnectionString"].ToString(); // chuỗi kết nối từ web.config
    protected void Page_Load(object sender, EventArgs e)
    {
        product();
        info();
    }

    private void info()
    {
        string order = "0";
        if (Request.QueryString["Order"] != null)
            order = Request.QueryString["Order"];
        SqlConnection conn = new SqlConnection(conStr);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM [orders] WHERE [order_id] = " + order;
        cmd.Connection = conn;
        conn.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            rd.Read();
            ltlRecipient.Text = rd.GetString(rd.GetOrdinal("recipient_name"));
            ltlAdd.Text = rd.GetString(rd.GetOrdinal("recipient_add"));
            ltlPhone.Text = rd.GetInt32(rd.GetOrdinal("recipient_phone")).ToString();
            if (rd.GetString(rd.GetOrdinal("bank")) != "") { ltlMethod.Text = "Chuyển khoản ngân hàng"; ltlMethodBank.Visible = true; }
            else {ltlMethod.Text = "Trực tiếp";}
            ltlNote.Text = rd.GetString(rd.GetOrdinal("notes"));
            if (rd.GetInt32(rd.GetOrdinal("status")) == 1) { ltlStatus.Text = "<font color='red'>Chưa thanh toán</font>"; }
            else if (rd.GetInt32(rd.GetOrdinal("status")) == 2) { ltlStatus.Text = "<font color='blue'>Đã thanh toán</font>"; }
            else if (rd.GetInt32(rd.GetOrdinal("status")) == 3) { ltlStatus.Text = "<font color='green'>Hoàn thành</font>"; }
            ltlTotal.Text = "<font color='red'><b>" + format_price(rd.GetInt32(rd.GetOrdinal("order_price")).ToString()) + " VNĐ</b></font>";
            ltlMethodBank.Text = "<tr><td style='width:20%'>Chủ khoản:</td><td>" + rd.GetString(rd.GetOrdinal("sender_name")) + "</td></tr>";
            ltlMethodBank.Text += "<tr><td style='width:20%'>Ngân hàng:</td><td>" + rd.GetString(rd.GetOrdinal("bank")) + "</td></tr>";
            ltlMethodBank.Text += "<tr><td style='width:20%'>Số tài khoản:</td><td>" + rd.GetString(rd.GetOrdinal("pay_num")) + "</td></tr>";
        }
        conn.Close();
        conn.Dispose();
    }

    private void product()
    {
        string order = "0";
        if (Request.QueryString["Order"] != null)
            order = Request.QueryString["Order"];

        SqlConnection conn = new SqlConnection(conStr);
        string sql = "SELECT product.product_id, product_name, price, product_num FROM product_bills INNER JOIN product ON product_bills.product_id = product.product_id WHERE order_id = " + order;
        SqlDataAdapter dt = new SqlDataAdapter(sql, conn);
        DataTable tb2 = new DataTable();
        DataTable tb = new DataTable("order");
        tb.Columns.Add("productid");
        tb.Columns.Add("productname");
        tb.Columns.Add("price");
        tb.Columns.Add("quantity");
        tb.Columns.Add("total");
        conn.Open();
        dt.Fill(tb2);
        foreach (DataRow i in tb2.Rows)
        {
            DataRow dr = tb.NewRow();
            dr["productid"] = i[0];
            dr["productname"] = i[1];
            dr["price"] = format_price(i[2].ToString());
            dr["quantity"] = i[3];
            dr["total"] = format_price((int.Parse(i[2].ToString()) * int.Parse(i[3].ToString())).ToString());
            tb.Rows.Add(dr);
        }

        GridView1.DataSource = tb;
        GridView1.DataBind();
        conn.Close();
        conn.Dispose();
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

}