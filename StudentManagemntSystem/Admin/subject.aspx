<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Masterpage.Master" AutoEventWireup="true"
    CodeBehind="subject.aspx.cs" Inherits="StudentManagemntSystem.Admin.subject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="Container p-md-4 p-sm-4">
            <div>
                <asp:Label ID="lblmsg" runat="server" Visible="False"></asp:Label>
            </div>
            <h3 class="text-center">Subject</h3>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <label>Class Name</label>
                    <asp:DropDownList ID="ddlclass" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlclass"
                        Display="Dynamic" ErrorMessage="Class is Required." InitialValue="Select" SetFocusOnError="True"
                        ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
                <div class="col-md-6">
                    <label for="txtsubject">Subject</label>
                    <asp:TextBox ID="txtsubject" runat="server" CssClass="form-control" placeholder="Enter Subject"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5 ">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558c9"
                        Text="Add Subject" OnClick="Button1_Click1" />
                </div>
            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <asp:GridView ID="GridView1" runat="server"
                        CssClass="table table-hover table-bordered" AutoGenerateColumns="False"
                        EmptyDataText="No Record Found!" AllowPaging="True" DataKeyNames="subjectid"
                        OnPageIndexChanging="GridView1_PageIndexChanging"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit"
                        OnRowEditing="GridView1_RowEditing"
                        OnRowUpdating="GridView1_RowUpdating" PageSize="5">
                        <Columns>
                            <asp:BoundField DataField="S.NO" HeaderText="S.NO" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Class">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server"
                                        DataSourceID="SqlDataSource1" DataTextField="classname"
                                        DataValueField="classid" SelectedValue='<%# Eval("classid") %>' CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                        ConnectionString="<%$ ConnectionStrings:dbcs %>"
                                        SelectCommand="SELECT * FROM [class]"></asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("classname") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Subject">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" Text='<%# Eval("subjectname") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("subjectname") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:CommandField CausesValidation="False" HeaderText="Actions"
                                ShowEditButton="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:CommandField>
                        </Columns>
                        <HeaderStyle ForeColor="white" BackColor="#5558c9" />
                    </asp:GridView>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
