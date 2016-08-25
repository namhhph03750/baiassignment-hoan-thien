using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; // add
using System.Data.SqlClient; // add
using System.Web.Configuration; //add

public partial class ChuyenMuc : System.Web.UI.Page
{

    string conStr = WebConfigurationManager.ConnectionStrings["Ass_GD2ConnectionString"].ToString(); // chuỗi kết nối từ web.config
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            title(); // load title
            loadsp();
        }
    }

    private bool cateparent()
    {
        string id = Request.QueryString["id"];

        SqlConnection conn = new SqlConnection(conStr);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM [product] WHERE [category_id] = " + id;
        cmd.Connection = conn;
        conn.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.HasRows)
            return true;
        return false;
        conn.Close();
        conn.Dispose();

    } // end chuyen muc cha
    private void title()
    {
        string id = Request.QueryString["id"];

        SqlConnection conn = new SqlConnection(conStr);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM [category] WHERE [category_id] = " + id;
        cmd.Connection = conn;
        conn.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            rd.Read();
            ltlCategoryName.Text = string.Format(rd.GetString(rd.GetOrdinal("category_name")));
        }
        conn.Close();
        conn.Dispose();

    } // end load title

    private void loadsp()
    {
        string id = Request.QueryString["id"];
        SqlConnection conn = new SqlConnection(conStr);
        string sql = "";

        if (cateparent() == true) // kt chuyên mục cha
            sql = "SELECT TOP 12 * FROM [product] WHERE [category_id] = " + id + " ORDER BY product_id DESC";
        else
            sql = "SELECT TOP 12 * FROM product INNER JOIN category ON product.category_id=category.category_id WHERE parent_id =" + id + " ORDER BY product_id DESC";

        SqlDataAdapter dt = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        conn.Open();
        dt.Fill(ds);
        DataView sp = new DataView(ds.Tables[0]);
        for (int i = 0; i < sp.Count; i++)
        {
            ltlProduct.Text += string.Format("<li class='span3 clearfix'><div class='thumbnail'><a href='ChiTietSanPham.aspx?id={1}'><img src='{0}' alt='{2}'></a></div><div class='thumbSetting'><div class='thumbTitle'><h3><a href='ChiTietSanPham.aspx?id={1}' class='invarseColor'>{2}</a></h3></div><div class='product-desc'><p>{3}</p></div><div class='thumbPrice'><span>{4} VNĐ</span></div><div class='thumbButtons'><a class='btn btn-primary btn-small btn-block' href='GioHang.aspx?add={1}&q=1'>Đặt mua</a></div></div></li>", sp[i]["product_img"], sp[i]["product_id"], sp[i]["product_name"], sp[i]["description"], format_price(sp[i]["price"].ToString()));
        }
        conn.Close();
        conn.Dispose();

    } // end load detail

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