using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using StudentManagemntSystem.Models;
using static StudentManagemntSystem.Models.CommonFn;

namespace StudentManagemntSystem.Admin
{
    public partial class AddClass : System.Web.UI.Page
    {
        CommonFnx fn = new CommonFnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetClass();
            }
        }
        public void GetClass()
        {
            string query = "Select Row_Number() over(order by(select 101)) as [S.NO], classid, classname from class";
            DataTable da = fn.Fetch(query);
            GridView1.DataSource = da;
            GridView1.DataBind();
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            DataTable dat = fn.Fetch("Select * from class where classname ='" + txtclass.Text.Trim() + "'");
            try
            {
                if (dat.Rows.Count == 0)
                {
                    string query = "Insert into class values('" + txtclass.Text + "')";
                    fn.Query(query);
                    lblmsg.Text = "Data Saved Sucessfully";
                    lblmsg.CssClass = "alert alert-success";
                    lblmsg.Visible = true;
                    txtclass.Text = string.Empty;
                    GetClass();
                }
                else
                {
                    lblmsg.Text = "Data Already Saved!";
                    lblmsg.CssClass = "alert alert-danger";
                    lblmsg.Visible = true;
                    txtclass.Text = string.Empty;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(''" + ex.ToString() + "'')</script>");
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetClass();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetClass();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int classid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string classname = (row.FindControl("txtclassedit") as TextBox).Text;
                fn.Query("Update class set classname ='" + classname + "' where classid ='" + classid + "'");
                lblmsg.Text = "Data Updated Sucessfully";
                lblmsg.CssClass = "alert alert-success";
                lblmsg.Visible = true;
                txtclass.Text = string.Empty;
                GridView1.EditIndex = -1;
                GetClass();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(''" + ex.ToString() + "'')</script>");
            }
        }

        protected void btnAdd_Click1(object sender, EventArgs e)
        {
            DataTable dat = fn.Fetch("Select * from class where classname ='" + txtclass.Text.Trim() + "'");
            try
            {
                if (dat.Rows.Count == 0)
                {
                    string query = "Insert into class values('" + txtclass.Text.Trim() + "')";
                    fn.Query(query);
                    lblmsg.Text = "Data Saved Sucessfully";
                    lblmsg.CssClass = "alert alert-success";
                    lblmsg.Visible = true;
                    txtclass.Text = string.Empty;
                    GetClass();
                }
                else
                {
                    lblmsg.Text = "Data Already Saved!";
                    lblmsg.CssClass = "alert alert-danger";
                    lblmsg.Visible = true;
                    txtclass.Text = string.Empty;
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(''" + ex.ToString() + "'')</script>");
            }
        }
    }
}