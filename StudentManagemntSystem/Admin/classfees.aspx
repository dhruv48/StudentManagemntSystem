<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Masterpage.Master" AutoEventWireup="true"
    CodeBehind="classfees.aspx.cs" Inherits="StudentManagemntSystem.Admin.classfees" %>

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
                    <asp:DropDownList ID="ddlclass" runat="server" CssClass="form-control"></asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlclass"
                        Display="Dynamic" ErrorMessage="Class is Required." InitialValue="Select" SetFocusOnError="True"
                        ForeColor="Red"></asp:RequiredFieldValidator>

                </div>
                <div class="col-md-6">
                    <label>Amount</label>
                    <asp:TextBox ID="txtfeesamt" runat="server" CssClass="form-control" placeholder="Enter Fees Amount"
                        required TextMode="Number"></asp:TextBox>
                </div>
            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5 ">
                <div class="col-md-3 col-md-offset-2 mb-3">
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary btn-block" BackColor="#5558c9"
                        Text="Add Amount" OnClick="Button1_Click1" />
                </div>
            </div>
            <div class="row mb-3 mr-lg-5 ml-lg-5 mt-md-5">
                <div class="col-md-6">
                    <asp:GridView ID="GridView1" runat="server"
                        CssClass="table table-hover table-bordered" AutoGenerateColumns="False"
                        EmptyDataText="No Record Found!" AllowPaging="True" DataKeyNames="feesid"
                        OnPageIndexChanging="GridView1_PageIndexChanging"
                        OnRowCancelingEdit="GridView1_RowCancelingEdit"
                        OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing"
                        OnRowUpdating="GridView1_RowUpdating" PageSize="5">
                        <Columns>
                            <asp:BoundField DataField="S.NO" HeaderText="S.NO" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="classname" HeaderText="Class" ReadOnly="True">
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Fees(Annual)">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtfeesamount" CssClass="form-control" runat="server" Text='<%# Eval("feesamount") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("feesamount") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:CommandField CausesValidation="False" HeaderText="Actions" ShowDeleteButton="True"
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
