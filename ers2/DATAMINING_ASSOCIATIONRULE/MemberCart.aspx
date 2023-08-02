﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Member.Master" AutoEventWireup="true" CodeBehind="MemberCart.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.MemberCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:Panel ID="Panel1" runat="server">
     
     <<!-- Breadcrumb Section Begin -->
    <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                        <h2><span>Customer Cart</span> Products</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Form Section Begin -->

   
   <!-- Register Section Begin -->
    
        <div class="container">
    <br />       
            
            
        <table style="width:96%;" align="center">
           
            <tr>
                <td style="font-weight: bold; color: #006699; font-size: small; text-align: justify;">
                    * The Items will be delivered with in 7 to 10 Working days if quantity is 
                    available, other wise it takes some days extra depending on the quantity and 
                    Items.</td>
            </tr>
            <tr>
                <td align="left" 
                    
                    
                    style="font-weight: bold; color: #734633; font-size: 14px;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" 
                    style="font-weight: bold; color: #006699; font-size: small;">
                    * Shipping cost is within India 50/- Rs. Out side India 500/- Rs.</td>
            </tr>
            <tr>
                <td align="left" 
                    
                    
                    
                    style="font-weight: bold; color: #f7a849; font-size: small; font-family: 'Courier New', Courier, monospace;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left" 
                    style="font-family: 'Courier New', Courier, monospace; color: #f7a849; font-size: small; font-weight: bold;">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" 
                    style="font-family: 'Courier New', Courier, monospace; color: red; ">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Medium" 
                        Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="Panelca2" runat="server" style="text-align: center" 
                        Width="604px">
                        <table style="width: 100%;">
                            <tr>
                                <td>
                                    <asp:Table ID="Table1" runat="server" BorderStyle="None" GridLines="Both" 
                                        style="text-align: left" Width="600px">
                                    </asp:Table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Panel ID="Panel2" runat="server">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td align="left">
                                                    <asp:Button ID="BtnShopMore" runat="server" BackColor="#1791B6" 
                                                        BorderColor="#18B5E1" Font-Bold="True" ForeColor="White" Height="35px" 
                                                        onclick="BtnShopMore_Click" Text="Shop More" Width="100px" />
                                                </td>
                                                <td align="right">
                                                    <asp:Button ID="BtnExit" runat="server" BackColor="#1790B3" 
                                                        BorderColor="#179FC4" Font-Bold="True" ForeColor="White" Height="35px" 
                                                        onclick="BtnExit_Click" Text="Check Out" Width="100px" />
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LblQuan" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="LabelId" runat="server" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <br />

		
	</div>
     
    </asp:Panel>



</asp:Content>
