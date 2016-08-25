<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="~/Admin/News.aspx.cs" Inherits="Admin_News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="main">
<div class="full_w">
	<div class="h_title">News</div>
    <p><asp:TextBox ID="txtSearch" runat="server" class="text err" 
        Height="20px"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text=" Search " 
        onclick="btnSearch_Click" Height="25px" />
    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnAddnew" runat="server" Text=" + Add News " Height="25px" 
        onclick="btnAddnew_Click"/>
        </p>
        <asp:Label ID="lblSuccess" runat="server" 
        Text="<div class='n_ok'><p>Added a news success!</p></div>" />
    <asp:Panel ID="pnlAdd" runat="server">
        <table class="style1">
            <tr>
                <td class="style2">
                    <p>News title:</p></td>
                <td>
                    <asp:TextBox ID="txtProductname" runat="server" class="text err" 
        Height="20px" Width="90%"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="style3">
                    <p>Images:</p></td>
                <td class="style4">

                    <asp:FileUpload ID="uplImg" runat="server" Width="90%" />
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <p>Content:</p></td>
                <td>

                    <asp:TextBox ID="txtDes" runat="server" class="text err" 
        Height="100px" TextMode="MultiLine" Width="90%"></asp:TextBox>

                </td>
            </tr>
            <tr>
                <td class="style2">
                    </td>
                <td>
                    <asp:Button ID="btnOK" runat="server" Height="25px" Text=" Sumit " 
                        onclick="btnOK_Click" />
                </td>
            </tr>
        </table>
       </asp:Panel>
</div>
<asp:GridView ID="GridView1" Width="100%" HorizontalAlign="Center" runat="server" 
                                          DataKeyNames="id"  AutoGenerateColumns="False" 
        onrowdeleting="GridView1_RowDeleting" onrowediting="GridView1_RowEditing" 
        onrowcancelingedit="GridView1_RowCancelingEdit" 
        onrowdatabound="GridView1_RowDataBound" 
        onrowupdating="GridView1_RowUpdating">
                                            <Columns>
                                                <asp:TemplateField HeaderText="ID">
                                                    <ItemTemplate>
                                                        <%# Eval("id") %>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="10px"></ItemStyle>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderText="Images">
                                                    <EditItemTemplate>
                                                        <asp:FileUpload ID="uplImg" runat="server" EnableTheming="True" 
                                                            Font-Size="Smaller" Width="100px" />
                                                        <br />
                                                        <br />
                                                        <asp:TextBox ID="txtImg" runat="server" Width="100px" Text='<%# Eval("images") %>'/>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <img src='../<%# Eval("images") %>' height="100px" width="100px" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="News title">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtEditName" runat="server" Text='<%# Eval("title") %>'  />
                                                    </EditItemTemplate>
                                                    <ItemTemplate >
                                                        <b><%# Eval("title") %></b>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" Width="120px"></ItemStyle>
                                                </asp:TemplateField>

                                                

                                                <asp:TemplateField HeaderText="Content">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="txtContent" runat="server" Height="100px" 
                                                            Text='<%# Eval("content") %>' TextMode="MultiLine" Width="100%"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate >
                                                        <%# Eval("content") %>
                                                    </ItemTemplate>
                                                    <ItemStyle></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:CommandField ButtonType="Image" HeaderText="Modify" DeleteImageUrl="~/Admin/img/i_delete.png" 
                                                    EditImageUrl="~/Admin/img/i_edit.png" ShowDeleteButton="True" 
                                                    ShowEditButton="True" CancelImageUrl="~/Admin/img/i_delete.png" 
                                                    UpdateImageUrl="~/Admin/img/i_ok.png">
                                                </asp:CommandField>
                                            </Columns>
                                        </asp:GridView>



</div>
</asp:Content>

