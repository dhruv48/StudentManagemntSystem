<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Masterpage.Master" AutoEventWireup="true"
    CodeBehind="AddClass.aspx.cs" Inherits="StudentManagemntSystem.Admin.AddClass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="Container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblmsg" runat="server" Visible="False"></asp:Label>
            </div>
            <h3 class="text-center">New Class</h3>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label>Class Name</label>
                    <asp:TextBox ID="txtclass" runat="server" CssClass="form-control" placeholder="Enter Class Name"
                        required></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5 ">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558c9"
                        Text="AddClass" OnClick="btnAdd_Click1" />
                </div>
            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <asp:GridView ID="GridView1" CssClass="table table-hover table-bordered" DataKeyNames="classid"
                        AutoGenerateColumns="False" EmptyDataText="No Records Found!"
                        runat="server" AllowPaging="True"
                        OnPageIndexChanging="GridView1_PageIndexChanging"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit"
                        OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"
                        PageSize="5">
                        <Columns>
                            <asp:BoundField DataField="classid" HeaderText="S.NO" ReadOnly="True">
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="CLASS">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtclassedit" runat="server" Text='<%# Eval("classname") %>' CssClass="form-control"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblclassname" runat="server" Text='<%# Eval("classname") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:CommandField CausesValidation="False" HeaderText="Action"
                                ShowEditButton="True" />
                        </Columns>
                        <HeaderStyle BackColor="#5558c9" ForeColor="Blue" />
                    </asp:GridView>
                </div>
            </div>

        </div>
    </div>

</asp:Content>
