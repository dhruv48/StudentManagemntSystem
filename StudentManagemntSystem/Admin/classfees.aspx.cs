using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using static StudentManagemntSystem.Models.CommonFn;

namespace StudentManagemntSystem.Admin
{
    public partial class classfees : System.Web.UI.Page
    {
        CommonFnx fn = new CommonFnx();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getclass();
                getfees();
            }
        }

        private void getclass()
        {
            DataTable dt = new DataTable();
            dt = fn.Fetch("Select * from class");
            ddlclass.DataSource = dt;
            ddlclass.DataTextField = "classname";
            ddlclass.DataValueField = "classid";
            ddlclass.DataBind();
            ddlclass.Items.Insert(0, "Select Class");
        }



        private void getfees()
        {
            DataTable dt = new DataTable();
            dt = fn.Fetch("Select Row_Number() over (order by (select 1)) as [S.NO],f.feesid , f.classid, c.classname , f.feesamount from feestable f  inner join class c on c.classid = f.classid");
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string classval = ddlclass.SelectedItem.Text;
            DataTable dat = fn.Fetch("Select * from feestable where classid ='" + ddlclass.SelectedItem.Value + "'");
            try
            {
                if (dat.Rows.Count == 0)
                {
                    string query = "Insert into feestable values('" + ddlclass.SelectedItem.Value + "','" + txtfeesamt.Text + "')";
                    fn.Query(query);
                    lblmsg.Text = "Data Saved Sucessfully";
                    lblmsg.CssClass = "alert alert-success";
                    lblmsg.Visible = true;
                    txtfeesamt.Text = string.Empty;
                    getfees();
                }
                else
                {
                    lblmsg.Text = "Data Already Exist<br>'" + classval + "'</br>!";
                    lblmsg.CssClass = "alert alert-danger";
                    lblmsg.Visible = true;
                    txtfeesamt.Text = string.Empty;
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
            getfees();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            getfees();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            getfees();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

            try
            {

                int feesid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                fn.Query("Delete feestable where feesid = '" + feesid + "'");
                lblmsg.Text = "Data Deleted Sucessfully";
                lblmsg.CssClass = "alert alert-success";
                lblmsg.Visible = true;
                txtfeesamt.Text = string.Empty;
                GridView1.EditIndex = -1;
                getfees();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(''" + ex.ToString() + "'')</script>");
            }

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int feesid = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                string feesamt =(row.FindControl("txtfeesamount") as TextBox).Text;
                fn.Query("Update feestable set feesamount ='" + feesamt.Trim() + "' where feesid ='" + feesid + "'");
                lblmsg.Text = "Data Updated Sucessfully";
                lblmsg.CssClass = "alert alert-success";
                lblmsg.Visible = true;
                txtfeesamt.Text = string.Empty;
                GridView1.EditIndex = -1;
                getfees();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert(''" + ex.ToString() + "'')</script>");
            }
        }
    }
}
