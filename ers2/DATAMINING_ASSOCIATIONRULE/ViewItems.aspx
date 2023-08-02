<%@ Page Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ViewItems.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.ViewItems" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" runat="server">

    <!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2><span>Browse</span> Products</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->

   
   <!-- Register Section Begin -->
    
        <div class="container">
    <br />       
               

                     
        <table style="width: 100%;">
            <tr>
                <td>
                    <table style="width: 99%;">
                        
                        <tr>
                            <td style="text-align: left; width: 115px">
                                <b>Category</b></td>
                            <td style="text-align: left">
                                <asp:DropDownList ID="DropDownList1" runat="server" Width="200px" 
                                    AutoPostBack="True" onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td style="text-align: left">
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="width: 88%;">
                        
                        <tr>
                            <td style="text-align: left; " class="style1">
                                <b>SubCategory</b></td>
                            <td style="text-align: left; " class="style2">
                                <asp:DropDownList ID="DropDownList2" runat="server" Width="200px" 
                                    AutoPostBack="True" onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td style="text-align: left" class="style3">
                                </td>
                        </tr>
                    </table>
                </td>
            </tr>

              <tr>
                <td>
                   
                </td>
            </tr>
        </table>
        <br />
        <table style="width: 100%;">
            <tr>
                <td>
                    <asp:Table ID="Table1" runat="server" Width="1200px">
                    </asp:Table>
                </td>
            </tr>
        </table>
        <br />
        <table style="width: 100%;">
            <tr>
                <td style="text-align: left">
                    <asp:ImageButton ID="ImageButton1" runat="server" 
                        ImageUrl="~/images/prevlabel.gif" onclick="ImageButton1_Click" />
                </td>
                <td>
                    <asp:Label ID="LblMsg" runat="server" Font-Bold="True"></asp:Label>
                </td>
                <td style="text-align: right">
                    <asp:ImageButton ID="ImageButton2" runat="server" 
                        ImageUrl="~/images/nextlabel.gif" onclick="ImageButton2_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td style="text-align: right">
                    <asp:ImageButton ID="ImageButton3" runat="server" 
                        ImageUrl="~/images/closelabel.gif" onclick="ImageButton3_Click" />
                </td>
            </tr>
        </table>
        <br />


            
       
    </div>
    <!-- Register Form Section End -->
    
          
			
      

		
	
    
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    
</asp:Content>

