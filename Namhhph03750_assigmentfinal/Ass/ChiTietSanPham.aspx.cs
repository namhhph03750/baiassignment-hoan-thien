using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; // add
using System.Data.SqlClient; // add
using System.Web.Configuration; //add

public partial class ChiTietSanPham : System.Web.UI.Page
{

    string conStr = WebConfigurationManager.ConnectionStrings["Ass_GD2ConnectionString"].ToString(); // chuỗi kết nối từ web.config

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loaddetail();
            lienquan();
        }
    }

    string category = "";
    private void loaddetail()
    {
        string id = Request.QueryString["id"];

        SqlConnection conn = new SqlConnection(conStr);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM [product] WHERE [product_id] = " + id ;
        cmd.Connection = conn;
        conn.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            rd.Read();
            ltrTitle.Text = rd.GetString(rd.GetOrdinal("product_name"));
            ltrImg.Text = string.Format("<a class='fancybox' href='" + rd.GetString(rd.GetOrdinal("product_img")) + "'><img src='" + rd.GetString(rd.GetOrdinal("product_img")) + "' alt=''></a>");
            ltrPrice.Text = string.Format("<span>" + format_price(rd.GetInt32(rd.GetOrdinal("price")).ToString()) + " VNĐ</span>");
            ltrID.Text = string.Format("<dd>" + rd.GetInt32(rd.GetOrdinal("product_id")) + "</dd>");
            ltrDescription.Text = string.Format(rd.GetString(rd.GetOrdinal("description")));
            category = rd.GetInt32(rd.GetOrdinal("category_id")).ToString();
        }
        conn.Close();
        conn.Dispose();
        // add to cart

        //ltlBuy.Text = string.Format("<a class='btn btn-primary' href='GioHang.aspx?add={0}&q={1}'><i class='icon-shopping-cart'></i> Đặt mua</a>", id, Qual);
        // end add to cart    
    } // end load detail
    
    private void lienquan()
    {
        SqlConnection conn = new SqlConnection(conStr);
        string sql = "SELECT * FROM [product] WHERE [category_id] = " + category.ToString() + " ORDER BY product_id DESC";
        SqlDataAdapter dt = new SqlDataAdapter(sql, conn);
        DataSet ds = new DataSet();
        conn.Open();
        dt.Fill(ds);
        DataView sp = new DataView(ds.Tables[0]);
        for (int i = 0; i < sp.Count; i++)
        {
            ltrLienquan.Text += string.Format("<li class='span3 clearfix'><div class='thumbnail'><a href='ChiTietSanPham.aspx?id={1}'><img src='{0}' alt='{2}'></a></div><div class='thumbSetting'><div class='thumbTitle'><h3><a href='ChiTietSanPham.aspx?id={1}' class='invarseColor'>{2}</a></h3></div><div class='product-desc'><p>{3}</p></div><div class='thumbPrice'><span>{4} VNĐ</span></div><div class='thumbButtons'><a class='btn btn-primary btn-small btn-block' href='GioHang.aspx?add={1}&q=1'>Đặt mua</a></div></div></li>", sp[i]["product_img"], sp[i]["product_id"], sp[i]["product_name"], sp[i]["description"], format_price(sp[i]["price"].ToString()));
        }
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
    protected void btnBuy_Click(object sender, EventArgs e)
    {
        string id = Request.QueryString["id"];
        Session["Cart"] = id;
        int Qual = 1;
        if (txtQual.Text != "")
            Qual = int.Parse(txtQual.Text);

        Response.Redirect("GioHang.aspx?add=" + id + "&q=" + Qual);
    }
} // end class