using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; // add
using System.Data.SqlClient; // add
using System.Web.Configuration; //add


public partial class GioHang : System.Web.UI.Page
{

    string conStr = WebConfigurationManager.ConnectionStrings["Ass_GD2ConnectionString"].ToString(); // chuỗi kết nối từ web.config
    public DataTable tb = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string add = Request.QueryString["add"];
            string q = Request.QueryString["q"]; // số lượng
            if (add != null | q != null)
            {
                AddCart();
                Response.Redirect("GioHang.aspx");
            }
            LoadCart();
        }
    }

    private void LoadCart() // load cart
    {
        tb = (DataTable)Session["GioHang"];
        if (tb != null && tongtien(tb) > 0)
        {
            if (tb.Rows.Count > 0)
            {
                GridView1.DataSource = tb;
                GridView1.DataBind();
            }
            lbltongtien.Text = format_price(tongtien(tb).ToString()) + " VNĐ";
        }
    }



    private void AddCart() // add mới vào giỏ hàng
    {
        string productid = Request.QueryString["add"];
        int q = Convert.ToInt32(Request.QueryString["q"]); // số lượng
        string productname = "";
        int price = 0;


        SqlConnection conn = new SqlConnection(conStr);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM [product] WHERE [product_id] = " + productid;
        cmd.Connection = conn;
        conn.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.HasRows)
        {
            rd.Read();
            productname = rd.GetString(rd.GetOrdinal("product_name"));
            price = rd.GetInt32(rd.GetOrdinal("price"));
        }
        conn.Close();
        conn.Dispose();

        DataTable tb = new DataTable();
        tb = ThemGioHang(productid, productname, price, q);
        Session["GioHang"] = tb;
    }

    public DataTable ThemGioHang(string id, string name, int price, int quan)
    {
        DataTable dt = new DataTable();
        dt = (DataTable)Session["GioHang"];
        if (dt == null) // nếu Session trống là chưa có table... vì thế tạo cái table với các cột như dưới
        {
            DataTable tb = new DataTable("product");
            tb.Columns.Add("productid");
            tb.Columns.Add("productname");
            tb.Columns.Add("price");
            tb.Columns.Add("quantity");
            tb.Columns.Add("total");
            dt = tb;
        }
            

        //Kiểm tra xem đã có sản phẩm trong giỏ hàng chưa ?
        //Nếu chưa thì thêm bản ghi mới vào giỏ hàng với số lượng Quantity là 1
        //Nếu có thì tăng quantity lên 1
        bool isExisted = false;
        foreach (DataRow dr in dt.Rows)
        {
            if (dr["productid"].ToString() == id)
            {
                int sl =  int.Parse(dr["quantity"].ToString()) + 1;
                int gia = int.Parse(dr["price"].ToString());
                dr["quantity"] = sl;
                dr["total"] = sl * gia;
                isExisted = true;
                break;
            }
            
        }

        if (!isExisted)//Chưa có sản phẩm trong giỏ hàng
        {
            DataRow dr = dt.NewRow();
            dr["productid"] = id;
            dr["productname"] = name;
            dr["quantity"] = quan;
            dr["price"] = price;
            dr["total"] = quan * price;
            //thêm dòng vừa tạo vào table
            dt.Rows.Add(dr);
        }
        return dt;
        
    }

    private int tongtien(DataTable tb)
    {
        int tt = 0;
        for (int i = 0; i < tb.Rows.Count; i++)
        {
            tt = tt + int.Parse(tb.Rows[i]["total"].ToString());
        }
        return tt;
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        tb = (DataTable)Session["GioHang"];
        if (GridView1.Rows.Count > 0)
        {
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                TextBox sl = (TextBox)GridView1.Rows[i].FindControl("txtsl");
                int soluong = int.Parse(sl.Text);
                //cập nhật số lượng cho giỏ hàng
                tb.Rows[i]["quantity"] = soluong;
                //lấy đơn giá của hàng từ giỏ hàng về. 
                int g = int.Parse(tb.Rows[i]["price"].ToString());
                //cập nhật tổng giá cho giỏ hàng.
                tb.Rows[i]["total"] = g * soluong;
            }
            //load dữ liệu lại cho Gridview
            GridView1.DataSource = tb;
            GridView1.DataBind();
            //hiển thị tổng tiền.
            lbltongtien.Text = format_price(tongtien(tb).ToString()) + " VNĐ";
        }
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


    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GridView1.DataKeys[e.RowIndex].Value.ToString();

        tb = (DataTable)Session["GioHang"];

        foreach (DataRow dr in tb.Rows)
        {
            if (dr["productid"].ToString() == id)
            {
                
                dr.Delete();
                break;
            }
        }

        Session["GioHang"] = tb;
        //load dữ liệu lại cho Gridview
        GridView1.DataSource = tb;
        GridView1.DataBind();
        //hiển thị tổng tiền.
        lbltongtien.Text = format_price(tongtien(tb).ToString()) + " VNĐ";

        
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/");
    }
    protected void btnCheckout_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ThanhToan.aspx");
    }
}