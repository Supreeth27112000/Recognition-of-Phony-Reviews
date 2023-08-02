<%@ Page Title="" Language="C#" MasterPageFile="~/Member.Master" AutoEventWireup="true" CodeBehind="MemberViewDetails.aspx.cs" Inherits="DATAMINING_ASSOCIATIONRULE.MemberViewDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <asp:Panel ID="Panel1" runat="server">

   <div class="breacrumb-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb-text">
                       <h2><span>View</span> Product Details</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
     
   <div class="container">
    <br />  
			 
			
     <table style="width:96%;">
        <tr>
            <td valign="top">
            <div id="popup">
                <asp:Table ID="TableBD" runat="server" style="text-align: left" 
                    HorizontalAlign="Left">
                </asp:Table>
                </div>
            </td>
        </tr>
        <tr>
            <td valign="top">
                <asp:Label ID="Lbl_Msg" runat="server" ForeColor="Red" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
    
        <br />
       <asp:Table ID="Table1" runat="server">
       </asp:Table>


        <br />


		
	</div>



    
    
    </asp:Panel>
</asp:Content>
