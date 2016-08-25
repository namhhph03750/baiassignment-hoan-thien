using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Admin_News : System.Web.UI.Page
{
    string conStr = WebConfigurationManager.ConnectionStrings["Ass_GD2ConnectionString"].ToString(); // chuỗi kết nối từ web.config
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            news();

            // button add

            pnlAdd.Visible = false;
        }
        lblSuccess.Visible = false;

    }
    string search = "";
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        search = "WHERE title LIKE N'%" + txtSearch.Text + "%' OR content LIKE N'%" + txtSearch.Text + "%'";
        news();
    }
    DataTable tb = new DataTable();
    private void news()
    {
        DataTable tb2 = new DataTable();
        SqlConnection conn = new SqlConnection(conStr);
        string sql = "SELECT * FROM news " + search + " ORDER BY id DESC";
        SqlDataAdapter dt = new SqlDataAdapter(sql, conn);
        conn.Open();
        dt.Fill(tb2);
        conn.Close();
        conn.Dispose();
        tb = tb2;
        GridView1.DataSource = tb;
        GridView1.DataBind();
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = GridView1.DataKeys[e.RowIndex].Value.ToString();

        SqlConnection conn = new SqlConnection(conStr);
        string sql = "DELETE FROM news WHERE id =" + id;
        SqlCommand cmd = new SqlCommand(sql, conn);
        conn.Open();
        cmd.ExecuteNonQuery(); // add đơn hàng
        conn.Close();
        conn.Dispose();

        //load dữ liệu lại
        news();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        news();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        news();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {


    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        // Get the product id of the selected product   
        string userID = GridView1.DataKeys[e.RowIndex].Value.ToString();
        // Get the GridViewRow object that represents the row being edited
        // from the Rows collection of the GridView control.           
        GridViewRow row = GridView1.Rows[e.RowIndex];
        // Get the controls that contain the updated values. In this
        // example, the updated values are contained in the TextBox
        // controls declared in the edit item templates of each TemplateField
        // column fields in the GridView control.
        TextBox img = (TextBox)row.FindControl("txtImg");
        TextBox name = (TextBox)row.FindControl("txtEditName");
        TextBox des = (TextBox)row.FindControl("txtContent");

        FileUpload uplImg = (FileUpload)row.FindControl("uplImg");
        if (uplImg.HasFile)
        {
            uplImg.PostedFile.SaveAs(MapPath("~/upload/") + uplImg.PostedFile.FileName);
            string path = "upload/" + uplImg.PostedFile.FileName;
            UpdateProduct(userID, name.Text, path, des.Text);
            GridView1.EditIndex = -1;
            news();
        }
        else if (img.Text.Length > 0)
        {
            UpdateProduct(userID, name.Text, img.Text, des.Text);
            GridView1.EditIndex = -1;
            news();
        }
        else
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "Scripts", "<script>alert('Images Field not allow to empty!')</script>");
        }
    }
    private void UpdateProduct(string userID, string title, string img, string content)
    {
        //SQL statement to update a product
        string sql = String.Format("UPDATE [news] SET title=N'{0}', images='{1}', content=N'{2}' WHERE id ={3}", title, img, content, userID);
        SqlConnection conn = new SqlConnection(conStr);
        conn.Open();
        //Initialize command object
        SqlCommand cmd = new SqlCommand(sql, conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        conn.Dispose();

    }
    protected void btnAddnew_Click(object sender, EventArgs e)
    {
        if (btnAddnew.Text == " + Add News ")
        {
            btnAddnew.Text = " - Cancel add ";
            pnlAdd.Visible = true;
        }
        else
        {
            btnAddnew.Text = " + Add News ";
            pnlAdd.Visible = false;

        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(conStr);

        string sql = "INSERT INTO [news] VALUES(@Name, @Img, @Des, @Time)";
        SqlCommand cmd = new SqlCommand(sql, conn);
        cmd.Parameters.AddWithValue("Name", txtProductname.Text);
        cmd.Parameters.AddWithValue("Des", txtDes.Text);
        string path = "";
        if (uplImg.HasFile)
        {
            uplImg.PostedFile.SaveAs(MapPath("~/upload/") + uplImg.PostedFile.FileName);
            path = "upload/" + uplImg.PostedFile.FileName;
        }
        cmd.Parameters.AddWithValue("Img", path);
        cmd.Parameters.AddWithValue("Time", DateTime.Now);

        conn.Open();
        cmd.ExecuteNonQuery(); // add đơn hàng
        conn.Close();
        conn.Dispose();
        btnAddnew.Text = " + Add News ";
        pnlAdd.Visible = false;
        lblSuccess.Visible = true;
        news();
    }
}